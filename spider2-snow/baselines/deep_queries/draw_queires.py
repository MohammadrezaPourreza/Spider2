import argparse
import json
import os.path as osp
from utils.sql_tree_builder import draw_query_tree


proj_dir = osp.dirname(osp.abspath(__file__))


if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data_dir", type=str, default="preprocessed_data/spider2-snow/spider2-snow_preprocessed.json")
    parser.add_argument("--table_file", type=str, default="preprocessed_data/spider2-snow/tables_preprocessed.json")
    args = parser.parse_args()
    tables_json = json.load(open(osp.join(proj_dir, args.table_file), 'r', encoding='utf-8'))
    text2sql_data = json.load(open(osp.join(proj_dir, args.data_dir), 'r', encoding='utf-8'))
    filtered_text2sql_data = []
    for sample in text2sql_data:
        if sample['query']:
            filtered_text2sql_data.append(sample)
    text2sql_data = filtered_text2sql_data

    for sample in text2sql_data:
         gold_query = sample['query']
         print(gold_query)
         graph = draw_query_tree(gold_query)
         graph.render("query_tree", view=True) 