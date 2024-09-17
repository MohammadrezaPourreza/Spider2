# import debugpy; debugpy.connect(("127.0.0.1", 5688))
import argparse
import os
import json

import openai
from tqdm import tqdm

from llm.chatgpt import init_chatgpt, ask_llm
from utils.enums import LLM
from torch.utils.data import DataLoader

from utils.post_process import process_duplication, get_sqls, get_sqls_without_exec




if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--question", type=str)
    parser.add_argument("--openai_api_key", type=str)
    parser.add_argument("--openai_group_id", type=str, default=None)
    parser.add_argument("--model", type=str, choices=[LLM.TEXT_DAVINCI_003, 
                                                      LLM.GPT_35_TURBO,
                                                      LLM.GPT_35_TURBO_0613,
                                                      LLM.GPT_35_TURBO_16K,
                                                      LLM.GPT_4, 
                                                      LLM.GPT_4o,
                                                      ],
                        default=LLM.GPT_35_TURBO)
    parser.add_argument("--start_index", type=int, default=0)
    parser.add_argument("--end_index", type=int, default=1000000) 
    parser.add_argument("--temperature", type=float, default=0)
    parser.add_argument("--mini_index_path", type=str, default="")
    parser.add_argument("--batch_size", type=int, default=1)
    parser.add_argument("--n", type=int, default=5, help="Size of self-consistent set")  
    parser.add_argument("--db_dir", type=str, default=None)

    parser.add_argument('--max_tokens', type=int, default=1000)  # since spider2 is challenging

    parser.add_argument("--is_sql_debug", action="store_true", default=False)
    args = parser.parse_args()

    if args.is_sql_debug:
        QUESTION_FILE = "debug_questions.json"
    else:
        QUESTION_FILE = "questions.json"

    # check args
    assert args.model in LLM.BATCH_FORWARD or \
           args.model not in LLM.BATCH_FORWARD and args.batch_size == 1, \
        f"{args.model} doesn't support batch_size > 1"

    questions_json = json.load(open(os.path.join(args.question, QUESTION_FILE), "r"))
    questions = [{"prompt": item["prompt"], "instance_id": item["instance_id"]} for item in questions_json["questions"]]
    db_ids = [item["db_id"] for item in questions_json["questions"]]

    # init openai api
    init_chatgpt(args.openai_api_key, args.openai_group_id, args.model)

    if args.start_index == 0:
        mode = "w"
    else:
        mode = "a"

    DEBUG_PREFIX = "SQL_DEBUG_" if args.is_sql_debug else ""
    if args.mini_index_path:
        mini_index = json.load(open(args.mini_index_path, 'r'))
        questions = [questions[i] for i in mini_index]
    
    # Create submit folder if not exists
    submit_folder = os.path.join(args.question, f'{DEBUG_PREFIX}RESULTS_MODEL-{args.model}-SQL')
    os.makedirs(submit_folder, exist_ok=True)

    question_loader = DataLoader(questions, batch_size=args.batch_size, shuffle=False, drop_last=False)

    token_cnt = 0
    results_json = []

    for i, batch in enumerate(tqdm(question_loader)):
        if i < args.start_index:
            continue
        if i >= args.end_index:
            break
        try:
            res = ask_llm(args.model, batch["prompt"], args.temperature, args.n, args.max_tokens)
        except openai.error.InvalidRequestError:
            print(f"The {i}-th question has too much tokens! Return \"SELECT\" instead")
            res = {"response": ["SELECT"] * len(batch)}

        # parse result
        token_cnt += res["total_tokens"]
        if args.n == 1: 
            for j, sql in enumerate(res["response"]):
                instance_id = batch["instance_id"][j]
                sql = " ".join(sql.replace("\n", " ").split())
                sql = process_duplication(sql)
                
                # crucial: In spider2, not every SQL startswith "SELECT". they might startswith "WITH".
                # if not sql.startswith("SELECT"):
                #     sql = "SELECT " + sql
                
                # output to .json
                results_json.append({
                    "instance_id": instance_id,
                    "sql": sql
                })
                # output to .sql
                with open(os.path.join(submit_folder, f"{instance_id}.sql"), "w") as submit_file:
                    submit_file.write(sql)
        else:
            cur_db_ids = db_ids[i * args.batch_size: i * args.batch_size + len(batch)]
            for sqls, db_id, instance_id in zip(res["response"], cur_db_ids, batch["instance_id"]):
                processed_sqls = []
                for sql in sqls:
                    sql = " ".join(sql.replace("\n", " ").split())
                    sql = process_duplication(sql)
                    # crucial: In spider2, not every SQL startswith "SELECT". they might startswith "WITH".
                    # if not sql.startswith("SELECT"):
                    #     sql = "SELECT " + sql
                    processed_sqls.append(sql)
                result = {
                    'db_id': db_id,
                    'p_sqls': processed_sqls,
                    'instance_id': instance_id
                }
                final_sqls = get_sqls_without_exec([result], args.n, args.db_dir)

                for sql in final_sqls:
                    # output to .json
                    results_json.append({
                        "instance_id": instance_id,
                        "sql": sql
                    })
                    # output to .sql
                    with open(os.path.join(submit_folder, f"{instance_id}.sql"), "w") as submit_file:
                        submit_file.write(sql)


