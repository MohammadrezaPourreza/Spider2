# import debugpy; debugpy.connect(('127.0.0.1', 5688))
import os
import json
import re
import os.path as osp
import argparse

proj_dir = osp.dirname(osp.dirname(osp.abspath(__file__)))

def load_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

def replace_table_names(sql_content, selected_tables_to_dbid):
    # logic checked at 0902
    table_names = list(selected_tables_to_dbid.keys())  
    table_names = sorted(table_names, key=len, reverse=True)
    for table_name in table_names:
        pattern = re.compile(r'\b' + re.escape(table_name) + r'\b(?!\.)')  
        new_table_name = f"{selected_tables_to_dbid[table_name]}.{table_name}"
        sql_content = pattern.sub(new_table_name, sql_content)
    return sql_content

def main(root_path, dev_json, table_json):
    json1 = load_json(dev_json)
    json2 = load_json(table_json)

    dbid_to_tables = {item["db_id"]: item["table_names_original"] for item in json2}
    instance_id_to_db_id = {item["instance_id"]: item["db_id"] for item in json1}

    new_root_path = root_path + "-postprocessed"
    os.makedirs(new_root_path, exist_ok=True)

    for root, _, files in os.walk(root_path):
        for file_name in files:
            if file_name.endswith('.sql'):
                instance_id = file_name.split('.')[0].split('@')[0]  # for pass-mode
                assert instance_id in instance_id_to_db_id, "check the dev.json"

                db_id = instance_id_to_db_id[instance_id]
                if isinstance(db_id, str): db_id = [db_id]
                selected_tables_to_dbid = {}        
                for k, v in dbid_to_tables.items():
                    if k in db_id:
                        for vv in v:
                            if vv in selected_tables_to_dbid.keys():  # should assure no tables with duplicated names. 
                                print(f"WARNING: Key '{vv}' already exists in 'selected_tables_to_dbid'.")
                            else:
                                selected_tables_to_dbid[vv] = k  

                sql_file_path = os.path.join(root, file_name)
                with open(sql_file_path, 'r', encoding='utf-8') as sql_file:
                    sql_content = sql_file.read()

                if file_name.startswith("local"):  # 
                    new_sql_content = sql_content
                elif file_name.startswith("bq"):  # bq
                    new_sql_content = replace_table_names(sql_content, selected_tables_to_dbid)
                elif file_name.startswith("sf"):  # snowflake
                    raise NotImplementedError
                else:
                    raise ValueError(f"Unknown database type: {file_name}")

                new_sql_file_path = os.path.join(new_root_path, file_name)
                with open(new_sql_file_path, 'w', encoding='utf-8') as sql_file:
                    sql_file.write(new_sql_content)

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    parser.add_argument('--model', default='gpt-3.5-turbo', type=str)
    parser.add_argument('--max_tokens', type=int, default=200)
    parser.add_argument("--is_sql_debug", action="store_true", default=False)
    args = parser.parse_args()

    DEBUG_PREFIX = "SQL_DEBUG_" if args.is_sql_debug else ""
    root_path = osp.join(proj_dir, f'postprocessed_data/{args.dev}_CTX-{args.max_tokens}/{DEBUG_PREFIX}RESULTS_MODEL-{args.model}-SQL')
    dev_json = osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json')
    table_json = osp.join(proj_dir, f'preprocessed_data/{args.dev}/tables_preprocessed.json')

    main(root_path, dev_json, table_json)


