import numpy as np
import json
import os
import os.path as osp
import corenlp
import spacy
import requests
import argparse
from datetime import date
import sys

proj_dir = osp.dirname(osp.dirname(osp.abspath(__file__)))
sys.path = [osp.join(proj_dir, '../')] + sys.path

from utils.utils import walk_metadata, get_special_function_summary

import glob
import json
import os
import matplotlib.pyplot as plt


def process_table_json(args):
    os.makedirs(osp.join(proj_dir, f'preprocessed_data/{args.dev}'), exist_ok=True)
    db_stats_list = walk_metadata(args.dev)

    for item in db_stats_list:
        if 'table_names_original' in item:
            item['table_names'] = item['table_names_original']
            item['column_names'] = item['column_names_original']
 
    with open(osp.join(proj_dir, f"preprocessed_data/{args.dev}/tables_preprocessed.json"), "w", encoding="utf-8") as json_file:
        json.dump(db_stats_list, json_file, indent=4, ensure_ascii=False)

    # with open("tables_toy.json", "w", encoding="utf-8") as json_file:
    #     json.dump([db_stats_list[5]], json_file, indent=4, ensure_ascii=False)


def process_dev_json(args):
    def get_questionTok_and_gold_query_for_dev_json(data):
        nlp = spacy.load("en_core_web_sm")
        
        os.makedirs(osp.join(proj_dir, f'preprocessed_data/{args.dev}'), exist_ok=True)
        for item in data:
            # step1. 
            doc = nlp(item['question'])
            item['question_toks'] = [token.text for token in doc]

            # step2. 
            gold_sql_file = osp.join(proj_dir, f"../../evaluation_suite/gold/sql/{item['instance_id']}.sql")
            if not os.path.exists(gold_sql_file):
                item['query'] = ''
            else:
                with open(gold_sql_file, 'r', encoding='utf-8') as file:
                    gold_sql = file.read().strip()
                    item['query'] = gold_sql

            item['db_id'] = item['db']
            del item['db']
        return data
    
    with open(osp.join(proj_dir, f'../..//{args.dev}.json'), 'r', encoding='utf-8') as file:
        data = json.load(file)

    with open(osp.join(proj_dir, f"preprocessed_data/{args.dev}/tables_preprocessed.json"), "r", encoding="utf-8") as json_file:
        table_json = json.load(json_file)

    data = get_questionTok_and_gold_query_for_dev_json(data)
    data = get_special_function_summary(data)

    # option
    avaiable_dbs = [table['db_id'] for table in table_json]
    new_data = []
    for entry in data:
        FLAG1 = '\n' not in entry['db_id']
        FLAG2 = entry['db_id'] in avaiable_dbs
        
        if FLAG1 and FLAG2:
            new_data.append(entry)


    with open(osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json'), 'w', encoding='utf-8') as file:
        json.dump(new_data, file, ensure_ascii=False, indent=4)



if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    args = parser.parse_args()

    process_table_json(args)
    process_dev_json(args)






