import os
import json

from src.database_utils.schema_generator import get_sql_for_database_from_tables_json, create_input_schema
from src.llm.engines import get_engine, invoke_engine_batch
from src.database_utils.execution import get_snowflake_sql_result
from src.llm.tokenizer import count_tokens
from src.llm.prompt_loader import load_prompt
from src.database_utils.sql_parser import get_sql_columns_dict
from src.database_utils.db_catalog.load_context import load_external_knowledge
from src.llm.parsers import get_parser

SPIDER_PREPROCESSED_TABLES_PATH=os.environ.get("SPIDER_PREPROCESSED_TABLES_PATH")
tables_json = json.load(open(SPIDER_PREPROCESSED_TABLES_PATH, 'r', encoding='utf-8'))


def need_fixing(candidates: list[dict]):
    correct_samples = []
    incorrect_samples = []
    for query in candidates:
        if query['no_syntax_error']:
            correct_samples.append(query)
        else:
            incorrect_samples.append(query)
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
    Generates initial SQL query candidates using the LLM.
    Returns list of candidate dictionaries with queries and their execution results.
    """
    extract_sql_queries = get_parser("query_generation")
    requests = [
        generation_prompt.format(
            QUESTION=instruction,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context
        ) for _ in range(num_candidates)
    ]
    
    generated_responses = invoke_engine_batch(llm, requests, 
                                           step_id=kwargs.get("step_id", None) + "_generation",
                                           log_path=kwargs.get("log_path", None))
    
    return [_create_candidate_dict(resp, extract_sql_queries, db_id) for resp in generated_responses]

def _create_candidate_dict(llm_response: str, parser, db_id: str) -> dict:
    """
    Creates a candidate dictionary with query execution results.
    """
    generated_sql = parser(llm_response)
    query_is_correct, results_df = get_snowflake_sql_result(generated_sql, db_id)
    results_md = str(results_df.to_markdown())[:500]
    return {
        "candidate_llm_response": llm_response,
        "generated_query": generated_sql,
        "result": results_md,
        "no_syntax_error": query_is_correct
    }

def _refine_candidates(llm, incorrect_samples: list[dict], correct_samples: list[dict],
                      self_refine: str, instruction: str, db_id: str, 
                      filtered_schema: str, context: str, counter: int, **kwargs) -> list[dict]:
    """
    Refines incorrect query candidates using self-refinement.
    Returns updated list of candidates.
    """
    extract_sql_queries = get_parser("query_generation")
    requests = [
        self_refine.format(
            QUESTION=instruction,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context,
            QUERY=sample['generated_query'],
            RESULT=sample['result']
        ) for sample in incorrect_samples
    ]
    
    llm_responses = invoke_engine_batch(llm, requests, 
                                      step_id=kwargs.get("step_id", None) + f"_revise_{counter}",
                                      log_path=kwargs.get("log_path", None))
    
    fixed_queries = [_create_candidate_dict(resp, extract_sql_queries, db_id) for resp in llm_responses]
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
    result_dict["candidates"] = candidates
    
    # Refine candidates if needed
    correct_samples, incorrect_samples = need_fixing(candidates)
    counter = 0
    while incorrect_samples and counter < max_refinement:
        candidates = _refine_candidates(
            llm, incorrect_samples, correct_samples, self_refine,
            instruction, db_id, filtered_schema, context, counter, **kwargs
        )
        result_dict[f'candidates_refine_{counter}'] = candidates
        correct_samples, incorrect_samples = need_fixing(candidates)
        counter += 1
    
    return result_dict

def self_consistency(candidates: list[dict], db_id):
    correct_samples, incorrect_samples = need_fixing(candidates)
    if len(correct_samples) == 0:
        return incorrect_samples[0]['generated_query']
    else:
        results_clusters = {}
        for sample in correct_samples:
            query_is_correct, results_df = get_snowflake_sql_result(sample['generated_query'], db_id)
            results_md = str(results_df.to_markdown())[:500]
            if results_md not in results_clusters:
                results_clusters[results_md] = []
            results_clusters[results_md].append(sample['generated_query'])
        sorted_clusters = sorted(
            results_clusters.items(), 
            key=lambda item: len(item[0]), 
            reverse=True
        )
        return sorted_clusters[0][1][0]

    