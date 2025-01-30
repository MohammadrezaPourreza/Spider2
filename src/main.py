import argparse
import os
import json
import os.path as osp
import time
import concurrent.futures

from tqdm import tqdm
from src.query_generator import generate_queries
from src.logging.logger import setup_logger, SessionLogger
from src.database_utils.db_info import get_preprocessed_data
from src.database_utils.evaluate import compare_sqls


def process_sample(instance_id, dag, args):
    external_knowledge = ""
    db_id = ""
    results = []
    preprocessed_data = get_preprocessed_data(instance_id)
    if preprocessed_data:
        external_knowledge = preprocessed_data["external_knowledge"]
        db_id = preprocessed_data["db_id"]

    SessionLogger.log_to_md(f"logs/{instance_id}.md", (f"# Instance ID: {instance_id}\n"
                                                        f"### DB ID: \n{db_id}\n"
                                                        f"### Instruction:\n{preprocessed_data['instruction']}"))

    for node in dag:
        node_id = node["id"]
        sql_query = node["sql_query"]
        question = node["equivalent_natural_question"]
        SessionLogger.log_to_md(f"logs/{instance_id}.md", (f"## Node: {node_id}\n"
                                                          f"### Question:\n{question}\n"
                                                          f"### SQL Query:\n```sql\n{sql_query}\n```"))
        
        candidate_queries = generate_queries(
            model_name=args.model_name,
            instance_id=instance_id,
            db_id=db_id,
            instruction=question,
            external_knowledge=external_knowledge,
            num_candidates=args.num_candidates,
            max_refinement=args.max_refinement,
            gold_query=sql_query,
            generation_prompt_template=args.generation_prompt,
            refinement_prompt_template=args.refinement_prompt,
            step_id=f"node_{node_id}",
            log_path=f"{SessionLogger.get_current_logger().log_dir}/llm_calls/node_{node_id}.log"
        )
        node["generated_queries"] = candidate_queries
        if candidate_queries:
            if candidate_queries['candidates']:
                for sql_meta_info in candidate_queries['candidates']:
                    score, error_info = compare_sqls(database_id=db_id, 
                                                          pred_sql_query=sql_meta_info['generated_query'], 
                                                          gold_sql_query=sql_query)
                    sql_meta_info['score'] = score
                    sql_meta_info['error_info'] = error_info
        results.append(node)
        SessionLogger.log_to_json(f"{instance_id}", results)
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

    setup_logger(run_id=f"generated_queries/{args.dag_log_dir}/{args.model_name}/{formatted_time}")
    all_json_dags = load_all_json_dags(args.dag_log_dir)
    
    results = []
    if args.num_workers == 1:
        for instance_id, sample in tqdm(all_json_dags.items(), total=len(all_json_dags)):
            result = process_sample(instance_id, sample, args)
            if result:
                results.append(result)
    else:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.num_workers) as executor:
            futures = [
                executor.submit(process_sample, instance_id, sample, args)
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
    
    
    