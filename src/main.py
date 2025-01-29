import argparse
import os
import json
import os.path as osp
import time
import concurrent.futures

from tqdm import tqdm
from src.query_generator import generate_queries
from src.logging.logger import setup_logger
from src.database_utils.evaluate import compare_sqls

SPIDER_PREPROCESSED_DATASET_PATH=os.environ.get("SPIDER_PREPROCESSED_DATASET_PATH")
text2sql_data = json.load(open(SPIDER_PREPROCESSED_DATASET_PATH, 'r', encoding='utf-8'))

{
        "id": "A",
        "description": "This component retrieves the geometric data for Philadelphia from the PLACES_PENNSYLVANIA table.",
        "equivalent_natural_question": "What is the geometric shape of Philadelphia as defined in the PLACES_PENNSYLVANIA table?",
        "sql_query": "SELECT\n        *\n    FROM\n        GEO_OPENSTREETMAP_CENSUS_PLACES.GEO_US_CENSUS_PLACES.PLACES_PENNSYLVANIA\n    WHERE\n        \"place_name\" = 'Philadelphia'",
        "dag_dependencies": []
    }

def process_sample(instance_id, dag, args, logger):
    external_knowledge = ""
    original_gold_query = ""
    db_id = ""
    results = []
    for sample in text2sql_data:
        if sample["instance_id"] == instance_id:
            external_knowledge = sample["external_knowledge"]
            original_gold_query = sample["query"]
            db_id = sample["db_id"]
            break
    for node in dag:
        sql_query = node["sql_query"]
        question = node["equivalent_natural_question"]
        candidate_queries = generate_queries(
            model_name=args.model_name,
            instance_id=instance_id,
            instruction=question,
            db_id=db_id,
            external_knowledge=external_knowledge,
            num_candidates=args.num_candidates,
            max_refinement=args.max_refinement,
            gold_query=sql_query,
            generation_prompt_template=args.generation_prompt,
            refinement_prompt_template=args.refinement_prompt,
        )
        node["generated_queries"] = candidate_queries
        sql_meta_data_info = []
        if candidate_queries:
            if candidate_queries['candidates']:
                for query in candidate_queries['candidates']:
                    sql_meta_data_info.append(
                        {
                            "query": query['generated_query'],
                            "label": compare_sqls(instance_id,query['generated_query'], sql_query, db_id)
                        }
                    )
            node["sql_meta_data_info"] = sql_meta_data_info
        results.append(node)
        logger.log_to_json(f"{instance_id}", results)
    return results

def load_all_json_dags(dag_log_dir):
    all_json_dags = {}
    for file in os.listdir(dag_log_dir):
        if file.endswith(".json"):
            with open(osp.join(dag_log_dir, file)) as f:
                dag = json.load(f)
                query_id = file.split("_", 1)[1].split(".")[0]
                all_json_dags[query_id] = dag
    return all_json_dags

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dag_log_dir", type=str)
    parser.add_argument("--model_name", type=str)
    parser.add_argument("--generation_prompt", type=str, default="simple_sql_generation")
    parser.add_argument("--refinement_prompt", type=str, default="self_refiner_prompt")
    parser.add_argument("--num_candidates", type=int, default=5)
    parser.add_argument("--max_refinement", type=int, default=3)
    parser.add_argument("--num_workers", type=int, default=8, help="Number of workers for data processing")
    args = parser.parse_args()
    formatted_time = time.strftime("%Y%m%d-%H%M%S")

    logger = setup_logger(run_id=f"generated_queries/{args.dag_log_dir}/{args.model_name}-{formatted_time}")
    all_json_dags = load_all_json_dags(args.dag_log_dir)
    
    results = []
    if args.num_workers == 1:
        for instance_id, sample in tqdm(all_json_dags.items(), total=len(all_json_dags)):
            result = process_sample(instance_id, sample, args, logger)
            if result:
                results.append(result)
    else:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.num_workers) as executor:
            futures = [
                executor.submit(process_sample, instance_id, sample, args, logger)
                 for instance_id, sample in all_json_dags.items()
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
    os.remove("temp")
    
    
    