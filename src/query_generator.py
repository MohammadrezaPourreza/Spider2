import argparse
import os
import json
import os.path as osp
import re
import time
import concurrent.futures
import random

from utils.datasets.spider import load_tables
from utils.utils import get_sql_for_database_from_tables_json
from utils.engines import get_engine, invoke_engine, invoke_engine_batch
from utils.execution import get_snowflake_sql_result, dump_sql_execution_results
from utils.tokenizer import count_tokens
from prompt.prompt_loader import load_prompt
from utils.sql_parser import get_sql_columns_dict
from tqdm import tqdm
from utils.logger import SessionLogger, setup_logger

from src.database_utils.db_catalog.load_context import load_external_knowledge
from src.llm.parsers import get_parser


proj_dir = osp.dirname(osp.abspath(__file__))
external_knwoledge_dir = osp.abspath(osp.join(proj_dir, '..', '..')) + "/resource/documents"
submission_dir = osp.abspath(osp.join(proj_dir, '..', '..')) + "/evaluation_suite"
log_dir = osp.join(proj_dir, "logs")


def need_fixing(candidates: list[dict]):
    correct_samples = []
    incorrect_samples = []
    for query in candidates:
        if query['label']:
            correct_samples.append(query)
        else:
            incorrect_samples.append(query)
    return correct_samples, incorrect_samples


    
def process_sample(sample: dict, args, tables_json, formatted_time, logger):
    """Process a single sample"""
    result_dict = {}
    schema_linker_llm = get_engine("gemini-1.5-pro-002", temperature = 0.2)
    llm = get_engine(args.model_name)
    question = sample['instruction']
    instance_id = sample['instance_id']
    db_id = sample['db_id']
    external_knowledge = sample["external_knowledge"]
    gold_query = sample['query']
    result_dict.update(sample)
    token_count_dict = {}


    logging_path = osp.join(log_dir, f"{args.model_name}_{formatted_time}/")
    os.makedirs(logging_path, exist_ok=True)
    logging_path = osp.join(logging_path, f"{instance_id}.log")
                          

    generation_prompt = load_prompt(args.generation_prompt)
    context_extractor = load_prompt("context_extractor")
    self_refine = load_prompt("self_refiner_prompt")

    context = ""
    if external_knowledge:
        context = load_external_knowledge(external_knowledge)
        result_dict["context_before_filtering"] = context
        token_count_dict["context_before_filtering"] = count_tokens(context, args.model_name)
        if args.filter_context:
            context_extractor_prompt = context_extractor.format(
                CONTEXT=context,
                QUESTION=question
            )
            context =  invoke_engine(llm, context_extractor_prompt, log_path=logging_path, step_id="extract_context")
            result_dict["context_after_filtering"] = context
            token_count_dict["context_after_filtering"] = count_tokens(context, args.model_name)

    table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True, number_of_rows=1)
    token_count_dict["table_crt_stmnts"] = count_tokens("\n".join(table_crt_stmnts), args.model_name)
    token_count_dict["sample_rows"] = count_tokens("\n".join(sample_rows), args.model_name)
    
    if token_count_dict["sample_rows"]  +  token_count_dict["table_crt_stmnts"] > 100000:
        print(f"Schema is too long, disabling sample rows and descriptions for sample {instance_id}")
        table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=False, number_of_rows=1)
        sample_rows = [" " for i in range(len(table_crt_stmnts))]

    if args.use_gold_schema:
        extracted_schema = get_sql_columns_dict(tables_json, db_id, gold_query)
        table_crt_stmnts, sample_rows = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True, seletected_schema=extracted_schema, number_of_rows=1)
        token_count_dict["filtered_table_crt_stmnts"] = count_tokens("\n".join(table_crt_stmnts), args.model_name)
        token_count_dict["filtered_sample_rows"] = count_tokens("\n".join(sample_rows), args.model_name)

    filtered_schema = create_input_schema(table_crt_stmnts, sample_rows)
    result_dict["filtered_schema"] = filtered_schema
    result_dict["token_count"] = token_count_dict

    requests = []
    for i in range(args.num_candidates):
        requests.append(generation_prompt.format(
            QUESTION=question,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context
        ))
    generated_responses = invoke_engine_batch(llm, requests, log_path=logging_path, step_id="generate_sql")
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
                "label": query_is_correct
            }
        )
    result_dict["candidates"] = candidates

    correct_samples, incorrect_samples = need_fixing(candidates)
    counter = 0
    while len(incorrect_samples) > 0 and counter < args.max_refinement:
        requests = []
        for sample in incorrect_samples:
            requests.append(self_refine.format(
                QUESTION=question,
                DB_ID=db_id,
                DATABASE_SCHEMA=filtered_schema,
                CONTEXT=context,
                QUERY=sample['generated_query'],
                RESULT=sample['result']
            ))
        llm_responses = invoke_engine_batch(llm, requests, log_path=logging_path, step_id="refine_sql")
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
                    "label": query_is_correct
                }
            )
        candidates = correct_samples + fixed_queries
        result_dict[f'candidates_refine_{counter}'] = candidates
        correct_samples, incorrect_samples = need_fixing(candidates)
        counter += 1
    logger.log_to_json(f"{instance_id}", result_dict)
    return {
       "question": question,
        "gold_query": gold_query,
        "candidates": candidates,
        "instance_id": instance_id,
        "db_id": db_id,
        "external_knowledge": external_knowledge
    }

def create_submission_folder(results: list, args, formatted_time_now):
    # create a folder
    submission_folder = osp.join(submission_dir, f"{args.model_name}-{formatted_time_now}")
    os.makedirs(submission_folder, exist_ok=True)
    # create a sql file with the instance_id as the name
    for result in results:
        instance_id = result['instance_id']
        selected_query = self_consistency(result['candidates'], result['db_id'])
        dump_sql_execution_results(selected_query, result['db_id'], save_dir=submission_folder, file_name=f"{instance_id}.csv")
    print(f"Submission folder created at {submission_folder}")

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
    

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data_dir", type=str, default="preprocessed_data/spider2-snow/spider2-snow_preprocessed.json")
    parser.add_argument("--table_file", type=str, default="preprocessed_data/spider2-snow/tables_preprocessed.json")
    parser.add_argument("--model_name", type=str, default="gemini-1.5-pro-002")
    parser.add_argument("--generation_prompt", type=str, default="dc_sql_generation")
    parser.add_argument("--num_candidates", type=int, default=5)
    parser.add_argument("--max_refinement", type=int, default=3)
    parser.add_argument("--num_workers", type=int, default=8, help="Number of workers for data processing")
    parser.add_argument("--use_gold_schema",  type=bool, default=True)
    parser.add_argument("--filter_context", type=bool, default=False)
    args = parser.parse_args()
    tables_json = json.load(open(osp.join(proj_dir, args.table_file), 'r', encoding='utf-8'))

    formatted_time = time.strftime("%Y%m%d-%H%M%S")


    # load the dataset
    text2sql_data = json.load(open(osp.join(proj_dir, args.data_dir), 'r', encoding='utf-8'))
    if args.use_gold_schema:
        filtered_text2sql_data = []
        for sample in text2sql_data:
            if sample['query']:
                filtered_text2sql_data.append(sample)
        text2sql_data = filtered_text2sql_data

    logger = setup_logger(run_id=f"{args.model_name}-{formatted_time}")
    
    results = []
    if args.num_workers == 1:
        for sample in tqdm(text2sql_data, total=len(text2sql_data)):
            result = process_sample(sample, args, tables_json, formatted_time, logger)
            if result:
                results.append(result)
    else:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.num_workers) as executor:
            futures = [
                executor.submit(process_sample, sample, args, tables_json, formatted_time, logger)
                for sample in text2sql_data
            ]
            
            for future in tqdm(
                concurrent.futures.as_completed(futures),
                total=len(futures),
                desc="Processing rows (multithreaded)"
            ):
                try:
                    result = future.result()
                    if result:
                        results.append(result)
                except Exception as e:
                    print(f"An error occurred: {e}")
    
    create_submission_folder(results, args, formatted_time)
    
    