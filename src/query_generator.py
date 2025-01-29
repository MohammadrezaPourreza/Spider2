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


def generate_queries(
        model_name: str,
        instance_id: str,
        instruction: str,
        db_id: str,
        external_knowledge: str,
        num_candidates: int = 5,
        max_refinement: int = 3,
        gold_query: str = None,
        generation_prompt_template: str = "simple_sql_generation",
        refinement_prompt_template: str = "self_refiner_prompt",
        llm_config: dict = None,
        ):
    result_dict = {}
    token_count_dict = {}

    llm = get_engine(model_name, **llm_config)
    sample = {
        "instruction": instruction,
        "instance_id": instance_id,
        "db_id": db_id,
        "external_knowledge": external_knowledge,
        "query": gold_query if gold_query else ""
    }
    result_dict.update(sample)
    generation_prompt = load_prompt(generation_prompt_template)
    self_refine = load_prompt(refinement_prompt_template)

    extract_sql_queries = get_parser("query_generation")

    context = ""
    if external_knowledge:
        context = load_external_knowledge(external_knowledge)
        result_dict["context_before_filtering"] = context
        token_count_dict["context_before_filtering"] = count_tokens(context, model_name)

    table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True, number_of_rows=1)
    token_count_dict["table_crt_stmnts"] = count_tokens("\n".join(table_crt_stmnts), model_name)
    token_count_dict["sample_rows"] = count_tokens("\n".join(sample_rows), model_name)
    
    if token_count_dict["sample_rows"]  +  token_count_dict["table_crt_stmnts"] > 100000:
        print(f"Schema is too long, disabling sample rows and descriptions for sample {instance_id}")
        table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=False, number_of_rows=1)
        sample_rows = [" " for i in range(len(table_crt_stmnts))]

    if gold_query:
        extracted_schema = get_sql_columns_dict(tables_json, db_id, gold_query)
        table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True, seletected_schema=extracted_schema, number_of_rows=1)
        token_count_dict["filtered_table_crt_stmnts"] = count_tokens("\n".join(table_crt_stmnts), model_name)
        token_count_dict["filtered_sample_rows"] = count_tokens("\n".join(sample_rows), model_name)

    filtered_schema = create_input_schema(table_crt_stmnts, sample_rows)
    result_dict["filtered_schema"] = filtered_schema
    result_dict["token_count"] = token_count_dict

    requests = []
    for i in range(num_candidates):
        requests.append(generation_prompt.format(
            QUESTION=instruction,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context
        ))
    generated_responses = invoke_engine_batch(llm, requests)
    candidates = []
    for llm_response in generated_responses:
        generated_sql = extract_sql_queries(llm_response)
        query_is_correct, result = get_snowflake_sql_result(generated_sql, db_id)
        result = str(result)[:500]
        candidates.append(
            {
                "candidate_llm_response": llm_response,
                "generated_query": generated_sql,
                "result": result,
                "no_syntax_error": query_is_correct
            }
        )
    result_dict["candidates"] = candidates

    correct_samples, incorrect_samples = need_fixing(candidates)
    counter = 0
    while len(incorrect_samples) > 0 and counter < max_refinement:
        requests = []
        for sample in incorrect_samples:
            requests.append(self_refine.format(
                QUESTION=instruction,
                DB_ID=db_id,
                DATABASE_SCHEMA=filtered_schema,
                CONTEXT=context,
                QUERY=sample['generated_query'],
                RESULT=sample['result']
            ))
        llm_responses = invoke_engine_batch(llm, requests)
        fixed_queries = []
        for llm_resp in llm_responses:
            generated_sql = extract_sql_queries(llm_resp)
            query_is_correct, result = get_snowflake_sql_result(generated_sql, db_id)
            result = str(result)[:500]
            fixed_queries.append(
                {
                    "candidate_llm_response": llm_response,
                    "generated_query": generated_sql,
                    "result": result,
                    "no_syntax_error": query_is_correct
                }
            )
        candidates = correct_samples + fixed_queries
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
            query_is_correct, result = get_snowflake_sql_result(sample['generated_query'], db_id)
            if result not in results_clusters:
                results_clusters[result] = []
            results_clusters[result].append(sample['generated_query'])
        sorted_clusters = sorted(
            results_clusters.items(), 
            key=lambda item: len(item[0]), 
            reverse=True
        )
        return sorted_clusters[0][1][0]

    