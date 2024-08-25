# import debugpy; debugpy.connect(('127.0.0.1', 5696))
import os
import json
import re
import os.path as osp
import argparse

proj_dir = osp.dirname(osp.dirname(osp.abspath(__file__)))

# 读取JSON数据
def load_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

def replace_table_names(sql_content, db_id, table_names):
    # 按表名长度降序排序，确保较长的表名优先匹配
    table_names = sorted(table_names, key=len, reverse=True)
    for table_name in table_names:
        # 使用正则表达式进行捕获和替换
        pattern = re.compile(r'\b' + re.escape(table_name) + r'\b(?!\.)')  # 捕获不跟随列名的表名
        new_table_name = f"{db_id}.{table_name}"
        sql_content = pattern.sub(new_table_name, sql_content)
    return sql_content

def main(root_path, dev_json, table_json):
    # 加载JSON文件
    json1 = load_json(dev_json)
    json2 = load_json(table_json)

    # 构建db_id到table_names的映射
    db_id_to_tables = {item["db_id"]: item["table_names_original"] for item in json2}

    # 构建instance_id到db_id的映射
    instance_id_to_db_id = {item["instance_id"]: item["db_id"] for item in json1}
    # instance_id_to_project = {item["instance_id"]: item["db_id"].split('.')[0] for item in json1}

    # 创建新的保存路径
    new_root_path = root_path + "-postprocessed"
    os.makedirs(new_root_path, exist_ok=True)

    # 遍历root路径下的所有.sql文件
    for root, _, files in os.walk(root_path):
        for file_name in files:
            if file_name.endswith('.sql'):
                instance_id = file_name.split('.')[0]
                if instance_id in instance_id_to_db_id:
                    db_id = instance_id_to_db_id[instance_id]
                    table_names = db_id_to_tables.get(db_id, [])

                    sql_file_path = os.path.join(root, file_name)
                    with open(sql_file_path, 'r', encoding='utf-8') as sql_file:
                        sql_content = sql_file.read()

                    if file_name.startswith("local"):  # localDB
                        new_sql_content = sql_content
                    else:  # cloudDB
                        # 替换表名
                        new_sql_content = replace_table_names(sql_content, db_id, table_names)

                    # 保存修改后的SQL文件到新路径
                    new_sql_file_path = os.path.join(new_root_path, file_name)
                    with open(new_sql_file_path, 'w', encoding='utf-8') as sql_file:
                        sql_file.write(new_sql_content)

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    parser.add_argument('--model', default='gpt-3.5-turbo', type=str)
    parser.add_argument("--is_sql_debug", action="store_true", default=False)
    args = parser.parse_args()

    DEBUG_PREFIX = "SQL_DEBUG_" if args.is_sql_debug else ""
    root_path = osp.join(proj_dir, f'postprocessed_data/{args.dev}_CTX-200/{DEBUG_PREFIX}RESULTS_MODEL-{args.model}-SQL')
    dev_json = osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json')
    table_json = osp.join(proj_dir, f'preprocessed_data/{args.dev}/tables_preprocessed.json')

    main(root_path, dev_json, table_json)


