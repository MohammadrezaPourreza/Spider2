# import debugpy; debugpy.connect(('127.0.0.1', 5690))

import argparse
import os
import json

import openai
from tqdm import tqdm

from llm.chatgpt import init_chatgpt, ask_llm
from utils.enums import LLM
from torch.utils.data import DataLoader

from utils.post_process import process_duplication, get_sqls, get_sqls_without_exec

QUESTION_FILE = "questions.json"


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--question", type=str)
    parser.add_argument("--openai_api_key", type=str)
    # parser.add_argument("--openai_group_id", type=str, default="org-ktBefi7n9aK7sZjwc2R9G1Wo")
    parser.add_argument("--openai_group_id", type=str, default=None)
    parser.add_argument("--model", type=str, choices=[LLM.TEXT_DAVINCI_003, 
                                                      LLM.GPT_35_TURBO,
                                                      LLM.GPT_35_TURBO_0613,
                                                      # LLM.TONG_YI_QIAN_WEN,
                                                      LLM.GPT_35_TURBO_16K,
                                                      LLM.GPT_4],
                        default=LLM.GPT_35_TURBO)
    parser.add_argument("--start_index", type=int, default=0)
    parser.add_argument("--end_index", type=int, default=1000000)  # 设置这个，以仅对前n个问题进行处理，节省token消耗
    parser.add_argument("--temperature", type=float, default=0)
    parser.add_argument("--mini_index_path", type=str, default="")
    parser.add_argument("--batch_size", type=int, default=1)
    parser.add_argument("--n", type=int, default=5, help="Size of self-consistent set")  # 得到5个sql
    parser.add_argument("--db_dir", type=str, default=None)
    args = parser.parse_args()

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

    if args.mini_index_path:
        mini_index = json.load(open(args.mini_index_path, 'r'))
        questions = [questions[i] for i in mini_index]
        out_file = f"{args.question}/RESULTS_MODEL-{args.model}_MINI.txt"
        json_out_file = f"{args.question}/RESULTS_MODEL-{args.model}_MINI.json"
    else:
        out_file = f"{args.question}/RESULTS_MODEL-{args.model}.txt"
        json_out_file = f"{args.question}/RESULTS_MODEL-{args.model}.json"

    # Create submit folder if not exists
    submit_folder = os.path.join(args.question, f'RESULTS_MODEL-{args.model}-SQL')
    os.makedirs(submit_folder, exist_ok=True)

    question_loader = DataLoader(questions, batch_size=args.batch_size, shuffle=False, drop_last=False)

    token_cnt = 0
    results_json = []

    with open(out_file, mode) as f, open(json_out_file, mode) as json_f:
        for i, batch in enumerate(tqdm(question_loader)):
            if i < args.start_index:
                continue
            if i >= args.end_index:
                break
            try:
                res = ask_llm(args.model, batch["prompt"], args.temperature, args.n)
            except openai.error.InvalidRequestError:
                print(f"The {i}-th question has too much tokens! Return \"SELECT\" instead")
                res = {"response": ["SELECT"] * len(batch)}

            # parse result
            token_cnt += res["total_tokens"]
            if args.n == 1:  # 不根据exec结果执行投票
                for j, sql in enumerate(res["response"]):
                    instance_id = batch["instance_id"][j]
                    sql = " ".join(sql.replace("\n", " ").split())
                    sql = process_duplication(sql)
                    if not sql.startswith("SELECT"):
                        sql = "SELECT " + sql
                    
                    # output to .txt
                    writted = f"{instance_id}: {sql}\n"
                    f.write(writted)
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
                        if not sql.startswith("SELECT"):
                            sql = "SELECT " + sql
                        processed_sqls.append(sql)
                    result = {
                        'db_id': db_id,
                        'p_sqls': processed_sqls,
                        'instance_id': instance_id
                    }
                    final_sqls = get_sqls_without_exec([result], args.n, args.db_dir)

                    for sql in final_sqls:
                        # output to .txt
                        writted = f"{instance_id}: {sql}\n"
                        f.write(writted)
                        # output to .json
                        results_json.append({
                            "instance_id": instance_id,
                            "sql": sql
                        })
                        # output to .sql
                        with open(os.path.join(submit_folder, f"{instance_id}.sql"), "w") as submit_file:
                            submit_file.write(sql)

        json.dump(results_json, json_f, ensure_ascii=False, indent=4)

