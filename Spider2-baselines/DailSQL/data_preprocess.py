# import debugpy; debugpy.connect(('127.0.0.1', 5688))

import argparse
import json
import os
import os.path as osp
import pickle
from pathlib import Path
import sqlite3
from tqdm import tqdm
import random

from utils.linking_process import SpiderEncoderV2Preproc
from utils.pretrained_embeddings import GloVe
from utils.datasets.spider import load_tables

proj_dir = osp.dirname(osp.abspath(__file__))


def schema_linking_producer(test, train, table, db, dataset_dir, compute_cv_link=False, args=None):
    '''
    compute_cv_link=False, 对于cloud db无法拿到table的cell value，不执行
    '''

    # load data
    test_data = json.load(open(os.path.join(dataset_dir, test)))
    train_data = json.load(open(os.path.join(dataset_dir, train)))

    # load schemas
    schemas, _ = load_tables([os.path.join(dataset_dir, table)])

    # Backup in-memory copies of all the DBs and create the live connections
    '''  # 注释掉需要访问db文件的逻辑
    for db_id, schema in tqdm(schemas.items(), desc="DB connections"):
        # sqlite_path = Path(dataset_dir) / db / db_id / f"{db_id}.sqlite"  
        sqlite_path = Path(db) / f"{db_id}.db"
        source: sqlite3.Connection
        with sqlite3.connect(str(sqlite_path)) as source:
            dest = sqlite3.connect(':memory:')
            dest.row_factory = sqlite3.Row
            source.backup(dest)
        schema.connection = dest
    '''

    word_emb = GloVe(kind='42B', lemmatize=True)
    linking_processor = SpiderEncoderV2Preproc(dataset_dir,
            min_freq=4,
            max_count=5000,
            include_table_name_in_column=False,
            word_emb=word_emb,
            fix_issue_16_primary_keys=True,
            compute_sc_link=True,
            compute_cv_link=compute_cv_link,
            # compute_sc_link=False, 
            # compute_cv_link=False,
            args=args
            )

    # build schema-linking
    for data, section in zip([test_data, train_data],['test', 'train']):
        for item in tqdm(data, desc=f"{section} section linking"):
            db_id = item["db_id"]
            schema = schemas[db_id]
            to_add, validation_info = linking_processor.validate_item(item, schema, section)
            if to_add:
                linking_processor.add_item(item, schema, section, validation_info)

    # save
    linking_processor.save()




if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--data_type", type=str, choices=["spider", "bird"], default="spider")
    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    parser.add_argument("--debug", action='store_true')
    args = parser.parse_args()

    data_type = args.data_type
    if data_type == "spider":
        # schema-linking between questions and databases for Spider
        spider_dev = osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json')
        spider_train = osp.join(proj_dir, '../data/dummy.json')
        spider_table = osp.join(proj_dir, 'preprocessed_data/tables_preprocessed.json') 
        spider_db = osp.join(proj_dir, '../databases')  
        schema_linking_producer(spider_dev, spider_train, spider_table, spider_db, proj_dir, args=args)
    elif data_type == "bird":
        raise NotImplementedError
