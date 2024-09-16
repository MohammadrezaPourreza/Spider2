import argparse
import os
import torch
import json
import time

from transformers import AutoModelForCausalLM, AutoTokenizer
from utils.load_sft_dataset import SFTSQLGenerationDataset
from utils.db_utils import check_sql_executability, detect_special_char
from torch.utils.data import DataLoader
from tqdm import tqdm


def post_process(sql, schema_items):
    sql = sql.replace("\n", " ")
    for table in schema_items:
        for column_name in table["column_names"]:
            if detect_special_char(column_name) and column_name in sql:
                sql = sql.replace(column_name, "`"+column_name+"`")

    while "``" in sql:
        sql = sql.replace("``", "`")

    return sql

def text2sql_func(model, inputs, tokenizer, max_new_tokens):
    input_length = inputs["input_ids"].shape[1]
    
    with torch.no_grad():
        generate_ids = model.generate(
            **inputs,
            max_new_tokens = max_new_tokens,
            num_beams = 1,  # 4
            num_return_sequences = 1  # 4
        )

    # print(tokenizer.decode(generate_ids[0]))
    generated_sqls = tokenizer.batch_decode(generate_ids[:, input_length:], skip_special_tokens = True, clean_up_tokenization_spaces = False)
    # print(generated_sqls)

    return generated_sqls

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument('--llm_path', type = str)
    parser.add_argument('--sic_path', type = str)
    parser.add_argument('--table_num', type = int, default = 6)
    parser.add_argument('--column_num', type = int, default = 10)

    parser.add_argument('--dataset_path', type = str)

    parser.add_argument('--max_tokens', type = int, default = 4096)
    parser.add_argument('--max_new_tokens', type = int, default = 256)    

    parser.add_argument("--use_external_knowledge", action="store_false", default=True)
    parser.add_argument("--use_few_shot", action="store_true", default=False)
    parser.add_argument("--use_special_function", action="store_true", default=False)
    parser.add_argument("--use_plan", action="store_true", default=False)

    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    parser.add_argument("--comment", type=str, default='')

    args = parser.parse_args()

    print(args)
    max_tokens = args.max_tokens
    max_new_tokens = args.max_new_tokens

    tokenizer = AutoTokenizer.from_pretrained(args.llm_path)
    raw_dataset = json.load(open(args.dataset_path))
    eval_set = SFTSQLGenerationDataset(
        args.dataset_path,
        tokenizer,
        max_tokens - max_new_tokens,
        "eval",
        args.table_num,
        args.column_num,
        args.sic_path,
        args
    ) 

    # TODO: current, we only support batch size = 1
    dataloader = DataLoader(eval_set, batch_size = 1)
    model = AutoModelForCausalLM.from_pretrained(args.llm_path, device_map = "auto", torch_dtype = torch.float16)
    
    model.eval()
    start_time = time.time()
    predicted_sqls = []
    for raw_data, batch_data in tqdm(zip(raw_dataset, dataloader)):
        for key in batch_data:
            batch_data[key] = batch_data[key].to(model.device)
        generated_sqls = text2sql_func(model, batch_data, tokenizer, max_new_tokens)
        generated_sqls = [post_process(generated_sql, raw_data["schema"]["schema_items"]) for generated_sql in generated_sqls]

        '''
        final_generated_sql = None
        for generated_sql in generated_sqls:
            execution_error = check_sql_executability(generated_sql, raw_data["db_path"])
            if execution_error is None: # the generated sql has no execution errors, we will return it as the final generated sql
                final_generated_sql = generated_sql
                break

        if final_generated_sql is None:
            if generated_sqls[0].strip() != "":
                final_generated_sql = generated_sqls[0]
            else:
                final_generated_sql = "SQL placeholder"
        '''

        final_generated_sql = generated_sqls[0] if generated_sqls[0].strip() != "" else "SQL placeholder"
    

        print(final_generated_sql)
        predicted_sqls.append(final_generated_sql)
    end_time = time.time()
    print("LLM name: {} | Total time: {}s | Example number: {} | Average time: {}s".format(
        args.llm_path, 
        end_time - start_time,
        len(raw_dataset),
        (end_time - start_time) / len(raw_dataset)
        )
    )

    submit_folder = os.path.join("postprocessed_data", f"{args.comment}-{args.dev}/{args.dev}-pred-sqls")
    os.makedirs(submit_folder, exist_ok=True)

    for idx, (data, predicted_sql) in enumerate(zip(raw_dataset, predicted_sqls)):
        instance_id = data.get("instance_id", f"instance_{idx}")
        sql_file_path = os.path.join(submit_folder, f"{instance_id}.sql")
        with open(sql_file_path, "w", encoding='utf-8') as submit_file:
            submit_file.write(predicted_sql)

    print(f"SQL files saved in {submit_folder}")

