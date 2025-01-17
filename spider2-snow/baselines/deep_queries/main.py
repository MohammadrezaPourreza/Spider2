import argparse
import os
import json
import os.path as osp
import logging
import re
import time
import concurrent.futures

from utils.datasets.spider import load_tables
from utils.utils import get_sql_for_database_from_tables_json
from utils.engines import get_engine, invoke_engine
from utils.execution import get_snowflake_sql_result
from tqdm import tqdm


proj_dir = osp.dirname(osp.abspath(__file__))
external_knwoledge_dir = osp.abspath(osp.join(proj_dir, '..', '..')) + "/resource/documents"
submission_dir = osp.abspath(osp.join(proj_dir, '..', '..')) + "/evaluation_suite"
log_dir = osp.join(proj_dir, "logs")



def load_prompt(template_name: str) -> str:
  """Loads a template from a file.

  Args:
      template_name (str): The name of the template to load.

  Returns:
      str: The content of the template.
  """

  file_name = f"{template_name}.txt"
  template_path = os.path.join(proj_dir, file_name)

  try:
    with open(template_path, "r") as file:
      template = file.read()
    logging.info("Template %s loaded successfully.", template_name)
    return template
  except FileNotFoundError:
    logging.exception("Template file not found: %s", template_path)
    raise
  except Exception as e:
    logging.exception("Error loading template %s: %s", template_name, e)
    raise


def load_external_knowledge(data_file_name):
    """Reading the md file and return its contents"""
    with open(osp.join(external_knwoledge_dir, data_file_name), 'r', encoding='utf-8') as f:
        return f.read()
    

def extract_json_from_output(llm_output: str) -> str:
    """
    Extracts the JSON content between the ```json and ``` tags from the given LLM output.

    Parameters:
        llm_output (str): The complete LLM output string.

    Returns:
        str: The extracted JSON string. If no JSON block is found, returns an empty string.
    """
    pattern = re.compile(r"```json\s*(.*?)\s*```", re.DOTALL)
    match = pattern.search(llm_output)
    if match:
        # Extract the captured JSON string
        json_content = match.group(1)
        return json_content.strip()  # remove any extraneous whitespace
    return ""

def extract_sql_queries(text):
    """
    Extracts SQL queries enclosed within <FINAL_ANSWER> and </FINAL_ANSWER> tags.


    Parameters:
        text (str): The large text containing SQL queries within code blocks.

    Returns:
        a SQL query
    """
    if "<FINAL_ANSWER>" in text and "</FINAL_ANSWER>" in text:
        pattern = re.compile(r"<FINAL_ANSWER>(.*?)</FINAL_ANSWER>", re.DOTALL)
        return pattern.findall(text)[-1]
    return text


    
def process_sample(sample: dict, args, tables_json, formatted_time):
    """Process a single sample"""
    schema_linker_llm = get_engine("gemini-1.5-pro-002", temperature = 0.2)
    llm = get_engine(args.model_name)
    question = sample['instruction']
    instance_id = sample['instance_id']
    db_id = sample['db_id']
    external_knowledge = sample["external_knowledge"]
    gold_query = sample['query']

    logging_path = osp.join(log_dir, f"{args.model_name}_{formatted_time}/")
    os.makedirs(logging_path, exist_ok=True)
    logging_path = osp.join(logging_path, f"{instance_id}.log")
                          

    generation_prompt = load_prompt("simple_sql_generation")
    gold_schema_extractor = load_prompt("extract_correct_schema")
    self_refine = load_prompt("self_refiner_prompt")

    context = ""
    if external_knowledge:
        context = load_external_knowledge(external_knowledge)

        # TODO remove this and token counter
        context = context[:1000000]

    full_schema = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True)
    full_schema = "\n\n".join(full_schema)

    # TODO remove this and token counter
    full_schema = full_schema[:1000000]
    
    gold_schema_extractor_user_message = gold_schema_extractor.format(
       DATABASE_SCHEMA=full_schema,
       QUERY = gold_query
    )
    extracted_schema = invoke_engine(schema_linker_llm, gold_schema_extractor_user_message, log_path=logging_path, step_id="extract_schema")
    extracted_schema = extract_json_from_output(extracted_schema)

    filtered_schema = get_sql_for_database_from_tables_json(db_id, tables_json, use_column_desc=True, seletected_schema=json.loads(extracted_schema), number_of_rows=1)
    filtered_schema = "\n\n".join(filtered_schema)

    # TODO remove this and token counter
    filtered_schema = filtered_schema[:1000000]


    generation_user_message = generation_prompt.format(
            QUESTION=question,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context
        )
    generated_sql = invoke_engine(llm, generation_user_message, log_path=logging_path, step_id="generate_sql")
    generated_sql = extract_sql_queries(generated_sql)
    query_is_correct, result = get_snowflake_sql_result(generated_sql, db_id)


    query_is_correct = False
    counter = 0

    while not query_is_correct and counter < args.max_refinement:
        generation_user_message = self_refine.format(
            QUESTION=question,
            DB_ID=db_id,
            DATABASE_SCHEMA=filtered_schema,
            CONTEXT=context,
            QUERY=generated_sql,
            RESULT=result
        )
        generated_sql = invoke_engine(llm, generation_user_message, log_path=logging_path, step_id="refine_sql")
        generated_sql = extract_sql_queries(generated_sql)
        query_is_correct, result = get_snowflake_sql_result(generated_sql, db_id)
        counter += 1

    return {
       "question": question,
        "gold_query": gold_query,
        "generated_query": generated_sql,
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
        with open(osp.join(submission_folder, f"{instance_id}.sql"), 'w', encoding='utf-8') as f:
            f.write(result['generated_query'])
    print(f"Submission folder created at {submission_folder}")


if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data_dir", type=str, default="preprocessed_data/spider2-snow/spider2-snow_preprocessed.json")
    parser.add_argument("--table_file", type=str, default="preprocessed_data/spider2-snow/tables_preprocessed.json")
    parser.add_argument("--model_name", type=str, default="gemini-1.5-pro-002")
    parser.add_argument("--max_refinement", type=int, default=3)
    parser.add_argument("--num_workers", type=int, default=8, help="Number of workers for data processing")
    args = parser.parse_args()
    tables_json = json.load(open(osp.join(proj_dir, args.table_file), 'r', encoding='utf-8'))

    formatted_time = time.strftime("%Y%m%d-%H%M%S")


    # load the dataset
    data = json.load(open(osp.join(proj_dir, args.data_dir), 'r', encoding='utf-8'))
    text2sql_data = []
    for sample in data:
        if sample['query']:
            text2sql_data.append(sample)
    
    results = []
    if args.num_workers == 1:
        for sample in tqdm(text2sql_data, total=len(text2sql_data)):
            result = process_sample(sample, args, tables_json, formatted_time)
            if result:
                results.append(result)
    else:
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.num_workers) as executor:
            futures = [
                executor.submit(process_sample, sample, args, tables_json, formatted_time)
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
    
    