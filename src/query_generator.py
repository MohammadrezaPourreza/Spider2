import os
import json
import pandas as pd

from src.database_utils.schema_generator import get_sql_for_database_from_tables_json, create_input_schema
from src.llm.engines import get_engine, invoke_engine
from src.database_utils.execution import get_snowflake_sql_result
from src.llm.tokenizer import count_tokens
from src.llm.prompt_loader import load_prompt
from src.database_utils.sql_parser import get_sql_columns_dict
from src.database_utils.db_catalog.load_context import load_external_knowledge
from src.llm.parsers import get_parser
from src.threading_utils import ordered_concurrent_function_calls
from src.logging.logger import SessionLogger
SPIDER_PREPROCESSED_TABLES_PATH=os.environ.get("SPIDER_PREPROCESSED_TABLES_PATH")
tables_json = json.load(open(SPIDER_PREPROCESSED_TABLES_PATH, 'r', encoding='utf-8'))


def need_fixing(candidates: list[dict]):
    correct_samples = []
    incorrect_samples = []
    for query_meta_info in candidates:
        if query_meta_info['status']:
            correct_samples.append(query_meta_info)
        else:
            incorrect_samples.append(query_meta_info)
    return correct_samples, incorrect_samples


def _prepare_schema(db_id: str, instance_id: str, gold_query: str, model_name: str) -> tuple[str, dict]:
    """
    Prepares and filters database schema based on token limits and gold query if available.
    Returns filtered schema and token count dictionary.
    """
    token_count_dict = {}
    table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True, number_of_rows=1)
    token_count_dict["table_crt_stmnts"] = count_tokens("\n".join(table_crt_stmnts), model_name)
    token_count_dict["sample_rows"] = count_tokens("\n".join(sample_rows), model_name)
    
    if token_count_dict["sample_rows"] + token_count_dict["table_crt_stmnts"] > 100000:
        print(f"Schema is too long, disabling sample rows and descriptions for sample {instance_id}")
        table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=False, number_of_rows=1)
        sample_rows = [" " for i in range(len(table_crt_stmnts))]

    if gold_query:
        extracted_schema = get_sql_columns_dict(tables_json, db_id, gold_query)
        table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(
            db_id, tables_json, use_column_desc=True, seletected_schema=extracted_schema, number_of_rows=1
        )
        token_count_dict["filtered_table_crt_stmnts"] = count_tokens("\n".join(table_crt_stmnts), model_name)
        token_count_dict["filtered_sample_rows"] = count_tokens("\n".join(sample_rows), model_name)

    filtered_schema = create_input_schema(table_crt_stmnts, sample_rows)
    return filtered_schema, token_count_dict

def _generate_initial_candidates(llm, generation_prompt: str, num_candidates: int, 
                               instruction: str, db_id: str, filtered_schema: str, 
                               context: str, **kwargs) -> list[dict]:
    """
    Generates initial SQL query candidates using the LLM with parallel processing.
    Returns list of candidate dictionaries with queries and their execution results.
    """
    extract_sql_queries = get_parser("query_generation")
    
    # Prepare the function call list for concurrent execution
    call_list = []
    for _ in range(num_candidates):
        prompt = generation_prompt.format(
            QUESTION=instruction,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context
        )
        
        call_list.append({
            'function': invoke_engine,
            'kwargs': {
                'engine': llm,
                'prompt': prompt,
                'step_id': f"{kwargs.get('step_id', None)}_generation",
                'log_path': kwargs.get('log_path', None)
            }
        })
    
    generated_responses = ordered_concurrent_function_calls(call_list)
    return [_create_candidate_dict(i+1, resp, extract_sql_queries, db_id) for i, resp in enumerate(generated_responses)]

def _create_candidate_dict(candidate_id: str, llm_response: str, parser, db_id: str) -> dict:
    """
    Creates a candidate dictionary with query execution results.
    """
    generated_sql = parser(llm_response)
    result_dict = get_snowflake_sql_result(generated_sql, db_id)
    status = result_dict['status']
    data: pd.DataFrame = result_dict['data']
    message = result_dict['message']
    return {
        "candidate_id": candidate_id,
        "candidate_llm_response": llm_response,
        "generated_query": generated_sql,
        "result": data.head(5).to_markdown(index=False).replace("\\", "\\\\").replace('"', '\\"'),
        "status": status,
        "message": message
    }

def _refine_candidates(llm, incorrect_samples: list[dict], correct_samples: list[dict],
                      self_refine: str, instruction: str, db_id: str, 
                      filtered_schema: str, context: str, counter: int, **kwargs) -> list[dict]:
    """
    Refines incorrect query candidates using self-refinement with parallel processing.
    Returns updated list of candidates.
    """
    extract_sql_queries = get_parser("query_generation")
    
    # Prepare the function call list for concurrent execution
    call_list = []
    for sample in incorrect_samples:
        RESULT = (
            f"Execution Message: {sample['message']}\n"
            f"Execution Data: {sample['result'] if sample['result'] else 'No result'}"
        )
        prompt = self_refine.format(
            QUESTION=instruction,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context,
            QUERY=sample['generated_query'],
            RESULT=RESULT
        )
        
        call_list.append({
            'function': invoke_engine,
            'kwargs': {
                'engine': llm,
                'prompt': prompt,
                'step_id': f"{kwargs.get('step_id', None)}_revise_{counter}",
                'log_path': kwargs.get('log_path', None)
            }
        })
    
    llm_responses = ordered_concurrent_function_calls(call_list)
    # Create refined candidates with parent.child ID format
    fixed_queries = [_create_candidate_dict(
        f"{incorrect_samples[i]['candidate_id']}.{counter + 1}", 
        resp, 
        extract_sql_queries, 
        db_id
    ) for i, resp in enumerate(llm_responses)]
    return correct_samples + fixed_queries

def generate_queries(
        model_name: str,
        instance_id: str,
        db_id: str,
        instruction: str,
        external_knowledge: str,
        generation_prompt_template: str,
        refinement_prompt_template: str,
        num_candidates: int,
        max_refinement: int,
        gold_query: str = None,
        llm_config: dict = None,
        **kwargs
        ):
    """
    Main function to generate and refine SQL queries using LLM.
    """
    result_dict = {
        "instruction": instruction,
        "instance_id": instance_id,
        "db_id": db_id,
        "external_knowledge": external_knowledge,
        "query": gold_query if gold_query else ""
    }
    
    # Initialize LLM and load prompts
    llm = get_engine(model_name, **(llm_config or {}))
    generation_prompt = load_prompt(generation_prompt_template)
    self_refine = load_prompt(refinement_prompt_template)
    
    # Load and process context
    context = ""
    if external_knowledge:
        context = load_external_knowledge(external_knowledge)
        result_dict["context_before_filtering"] = context
        token_count_dict = {"context_before_filtering": count_tokens(context, model_name)}
    else:
        token_count_dict = {}
    
    # Prepare schema
    filtered_schema, schema_token_count = _prepare_schema(db_id, instance_id, gold_query, model_name)
    result_dict.update({
        "filtered_schema": filtered_schema,
        "token_count": {**token_count_dict, **schema_token_count}
    })
    
    # Generate initial candidates
    candidates = _generate_initial_candidates(
        llm, generation_prompt, num_candidates, instruction, 
        db_id, filtered_schema, context, **kwargs
    )
    full_candidates = candidates
    
    # Refine candidates if needed
    correct_samples, incorrect_samples = need_fixing(candidates)
    counter = 0
    while incorrect_samples and counter < max_refinement:
        candidates = _refine_candidates(
            llm, incorrect_samples, correct_samples, self_refine,
            instruction, db_id, filtered_schema, context, counter, **kwargs
        )
        full_candidates.extend(candidates)
        result_dict[f'candidates refinement {counter+1}'] = candidates
        correct_samples, incorrect_samples = need_fixing(candidates)
        counter += 1
    
    # Sort candidates based on their IDs (handles both integer IDs like 1,2 and decimal IDs like 1.1,1.2)
    full_candidates.sort(key=lambda x: tuple(
        map(float, x['candidate_id'].split('.')) if '.' in str(x['candidate_id'])
        else (float(x['candidate_id']), 0)
    ))
    result_dict["candidates"] = full_candidates
    
    for candidate in full_candidates:
        SessionLogger.log_to_md(f"logs/{instance_id}.md", 
                                (f"#### Candidate {candidate.get('candidate_id', 'N/A')}\n"
                                 f"```sql\n{candidate['generated_query']}\n```\n"
                                 f"#### Status\n{candidate['status']}\n"
                                 f"#### Message\n{candidate['message']}\n"
                                 f"#### Result\n{candidate['result']}\n"))
    
    return result_dict

def self_consistency(candidates: list[dict], db_id):
    correct_samples, incorrect_samples = need_fixing(candidates)
    if len(correct_samples) == 0:
        return incorrect_samples[0]['generated_query']
    else:
        results_clusters = {}
        for sample in correct_samples:
            result_dict = get_snowflake_sql_result(sample['generated_query'], db_id)
            data = result_dict['data']
            results_md = str(data.to_markdown())[:500]
            if results_md not in results_clusters:
                results_clusters[results_md] = []
            results_clusters[results_md].append(sample['generated_query'])
        sorted_clusters = sorted(
            results_clusters.items(), 
            key=lambda item: len(item[0]), 
            reverse=True
        )
        return sorted_clusters[0][1][0]

    