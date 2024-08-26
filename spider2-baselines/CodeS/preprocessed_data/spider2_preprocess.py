# import debugpy; debugpy.connect(('127.0.0.1', 5696))
import glob
import json
import pickle
import os
import os.path as osp
import numpy as np
from datetime import date
import argparse

proj_dir = osp.dirname(osp.dirname(osp.abspath(__file__)))

def preprocess_table_json_old():
    # 读取tables.json文件
    with open(osp.join(proj_dir, '../data/tables.json'), 'r') as f:
        tables = json.load(f)
    # 读取data.pkl文件
    with open(osp.join(proj_dir, '../data/tables_rows.pkl'), 'rb') as f:
        data = pickle.load(f)

    # 处理data中的sample_rows，将不可序列化的对象转换为字符串格式
    for item in data:
        sample_rows = item.get('sample_rows', {})
        for table in sample_rows.keys():
            for row in sample_rows[table]:
                for col in row.keys():
                    if isinstance(row[col], np.ndarray):
                        # print('存在np.array格式的value，转换为字符串格式')
                        row[col] = str(row[col].tolist())
                    elif isinstance(row[col], dict):
                        # print('存在dict格式的value，转换为字符串格式')
                        row[col] = str(row[col])
                    elif isinstance(row[col], date):
                        # print('存在date格式的value，转换为YYYY-MM-DD字符串格式')
                        row[col] = row[col].strftime('%Y-%m-%d')
                

    # 准备输出JSON数据结构
    output = []

    # 遍历tables.json中的数据
    for table_data in tables:
        db_id = table_data.get("db_id", "")
        table_names = table_data.get("table_names_original", [])
        column_names = table_data.get("column_names_original", [])
        column_types = table_data.get("column_types", [])
        primary_keys = table_data.get("primary_keys", [])
        foreign_keys_indices = table_data.get("foreign_keys", [])
        
        # 找到与db_id匹配的sample_rows数据
        matching_data = None
        for item in data:
            if item.get("db_id", "") == db_id:
                matching_data = item
                break
        
        # 准备schema_items列表
        schema_items = []
        
        for table_index, table_name in enumerate(table_names):
            # 获取表的列名和类型
            col_names = [col[1] for col in column_names if col[0] == table_index]
            col_types = [column_types[i] for i, col in enumerate(column_names) if col[0] == table_index]
            
            # 获取主键指示器
            pk_indicators = [1 if column_names.index(col) in primary_keys else 0 for col in column_names if col[0] == table_index]
            
            # 获取列内容和列注释
            sample_rows = matching_data.get("sample_rows", {}).get(table_name, [])
            col_contents = [[] for _ in col_names]
            
            for row in sample_rows:
                for col_index, col_name in enumerate(col_names):
                    col_contents[col_index].append(str(row.get(col_name, "")))
            
            col_comments = [""] * len(col_names)
            
            # 创建单个表的schema_item
            schema_item = {
                "table_name": table_name,
                "table_comment": "",
                "column_names": col_names,
                "column_types": col_types,
                "column_comments": col_comments,
                "column_contents": col_contents,
                "pk_indicators": pk_indicators
            }
            
            schema_items.append(schema_item)
        
        # 处理foreign_keys部分
        foreign_keys = []
        for fk in foreign_keys_indices:
            start_column_index, end_column_index = fk
            start_table_index = column_names[start_column_index][0]
            end_table_index = column_names[end_column_index][0]
            
            start_table_name = table_names[start_table_index]
            start_column_name = column_names[start_column_index][1]
            
            end_table_name = table_names[end_table_index]
            end_column_name = column_names[end_column_index][1]
            
            foreign_keys.append([start_table_name, start_column_name, end_table_name, end_column_name])
        
        # 生成输出的单个数据库项
        output_item = {
            "db_id": db_id,
            "db_path": None,
            "schema": {
                "schema_items": schema_items,
                "foreign_keys": foreign_keys,
            }
        }
        
        output.append(output_item)

    # 将生成的JSON数据输出到外存
    output_file = osp.join(proj_dir, 'preprocessed_data/tables_preprocessed.json') 
    with open(output_file, 'w') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    print(f"【预处理】完成，保存到 {output_file}")


def preprocess_table_json():
    # 定义db_stats_list用于存储新的数据结构
    db_stats_list = []

    # 定义路径
    db_base_path = "../../spider2/databases/bigquery/metadata/"
    json_glob_path = "**/*.json"

    # 遍历所有项目
    for project_path in glob.glob(os.path.join(db_base_path, "*"), recursive=False):
        project_name = os.path.basename(os.path.normpath(project_path))

        # 遍历项目中的所有数据库
        for db_path in glob.glob(os.path.join(project_path, "*"), recursive=False):
            db_name = os.path.basename(os.path.normpath(db_path)) 

            table_count = 0
            total_column_count = 0

            table_names_original = []
            column_names_original = []
            column_types = []
            descriptions = []
            sample_rows = {}

            # 查找该数据库中的所有JSON文件
            for json_file in glob.glob(os.path.join(db_path, json_glob_path), recursive=True):
                with open(json_file, 'r', encoding='utf-8') as file:
                    try:
                        data = json.load(file)

                        # 获取table和column信息
                        table_count += 1
                        table_name = data.get("table_name", "")
                        table_names_original.append(table_name)

                        # 获取列名和列类型
                        columns = data.get("column_names", [])
                        column_types_in_table = data.get("column_types", [])
                        descriptions_in_table = data.get("description", [])

                        total_column_count += len(columns)

                        # 将列名存储为 [table_index, column_name]
                        for col_index, col_name in enumerate(columns):
                            column_names_original.append([table_count - 1, col_name])

                        # 将列类型存储
                        column_types.extend(column_types_in_table)

                        # 将description存储为 [table_index, description]
                        for desc in descriptions_in_table:
                            descriptions.append([table_count - 1, desc])

                        # 将sample_rows存储
                        if "sample_rows" in data:
                            sample_rows[table_name] = data["sample_rows"]

                    except json.JSONDecodeError:
                        print(f"Error reading {json_file}")

            # 计算平均列数量
            avg_column_per_table = total_column_count / table_count if table_count > 0 else 0

            # 将数据库的统计信息添加到db_stats_list中
            db_stats_list.append({
                "db_id": f"{project_name}.{db_name}",  # project.db格式
                "db_stats": {
                    "No. of tables": table_count,
                    "No. of columns": total_column_count,
                    "Avg. No. of columns per table": avg_column_per_table
                },
                "table_names_original": table_names_original,
                "column_names_original": column_names_original,
                "column_types": column_types,
                "column_descriptions": descriptions,
                "sample_rows": sample_rows,
                "primary_keys": [],  # 这里你可以根据需要填写primary keys的生成逻辑
                "foreign_keys": []  # 这里你可以根据需要填写foreign keys的生成逻辑
            })

    # 处理data中的sample_rows，将不可序列化的对象转换为字符串格式
    for item in db_stats_list:
        sample_rows = item.get('sample_rows', {})
        for table in sample_rows.keys():
            for row in sample_rows[table]:
                for col in row.keys():
                    if isinstance(row[col], np.ndarray):
                        # print('存在np.array格式的value，转换为字符串格式')
                        row[col] = str(row[col].tolist())
                    elif isinstance(row[col], dict):
                        # print('存在dict格式的value，转换为字符串格式')
                        row[col] = str(row[col])
                    elif isinstance(row[col], date):
                        # print('存在date格式的value，转换为YYYY-MM-DD字符串格式')
                        row[col] = row[col].strftime('%Y-%m-%d')

    # 准备输出JSON数据结构
    output = []

    # 遍历db_stats_list中的数据
    for table_data in db_stats_list:
        db_id = table_data.get("db_id", "")
        table_names = table_data.get("table_names_original", [])
        column_names = table_data.get("column_names_original", [])
        column_types = table_data.get("column_types", [])
        primary_keys = table_data.get("primary_keys", [])
        foreign_keys_indices = table_data.get("foreign_keys", [])
        
        # 准备schema_items列表
        schema_items = []
        
        for table_index, table_name in enumerate(table_names):
            # 获取表的列名和类型
            col_names = [col[1] for col in column_names if col[0] == table_index]
            col_types = [column_types[i] for i, col in enumerate(column_names) if col[0] == table_index]
            
            # 获取主键指示器
            pk_indicators = [1 if column_names.index(col) in primary_keys else 0 for col in column_names if col[0] == table_index]
            
            # 获取列内容和列注释
            sample_rows = table_data.get("sample_rows", {}).get(table_name, [])
            col_contents = [[] for _ in col_names]
            
            for row in sample_rows:
                for col_index, col_name in enumerate(col_names):
                    col_contents[col_index].append(str(row.get(col_name, "")))
            
            col_comments = [""] * len(col_names)
            
            # 创建单个表的schema_item
            schema_item = {
                "table_name": table_name,
                "table_comment": "",
                "column_names": col_names,
                "column_types": col_types,
                "column_comments": col_comments,
                "column_contents": col_contents,
                "pk_indicators": pk_indicators
            }
            
            schema_items.append(schema_item)
        
        # 处理foreign_keys部分
        foreign_keys = []
        for fk in foreign_keys_indices:
            start_column_index, end_column_index = fk
            start_table_index = column_names[start_column_index][0]
            end_table_index = column_names[end_column_index][0]
            
            start_table_name = table_names[start_table_index]
            start_column_name = column_names[start_column_index][1]
            
            end_table_name = table_names[end_table_index]
            end_column_name = column_names[end_column_index][1]
            
            foreign_keys.append([start_table_name, start_column_name, end_table_name, end_column_name])
        
        # 生成输出的单个数据库项
        output_item = {
            "db_id": db_id,
            "db_path": None,
            "schema": {
                "schema_items": schema_items,
                "foreign_keys": foreign_keys,
            }
        }
        
        output.append(output_item)

    # 将生成的JSON数据输出到外存
    output_file = osp.join(proj_dir, 'preprocessed_data/tables_preprocessed.json') 
    with open(output_file, 'w', encoding="utf-8") as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    print(f"【预处理】完成，保存到 {output_file}")


def preprocess_dev_json(args):

    with open(osp.join(proj_dir, f'../../spider2/{args.dev}.json'), 'r', encoding='utf-8') as file:
        data = json.load(file)

    os.makedirs(osp.join(proj_dir, f'preprocessed_data/{args.dev}'), exist_ok=True)
    # 处理每个字典
    for item in data:
        # step. 获取gold_sql

        gold_sql_file = osp.join(proj_dir, f"../../spider2/evaluation_suite/gold/sql/{item['instance_id']}.sql")
        if not os.path.exists(gold_sql_file):
            print(f"找不到文件：{gold_sql_file}")
            item['sql'] = ''
        else:
            with open(gold_sql_file, 'r', encoding='utf-8') as file:
                gold_sql = file.read().strip()
                item['sql'] = gold_sql

        # step. 键名的修改
        item['text'] = item['question']
        item['db_id'] = item['db']
        del item['db']
        item['evidence'] = (item.get('plan', '') or '') + (item.get('external_knowledge', '') or '')  # TODO: 看下evidence的读逻辑，这样拼接是否合理
        if 'plan' in item:
            del item['plan']
        if 'external_knowledge' in item:
            del item['external_knowledge']
        item['table_labels'] = None
        item['column_labels'] = None
        item['matched_contents'] = {}
        item['source'] = 'spider2'

    # 将修改后的数据写回到新的 JSON 文件中
    with open(osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json'), 'w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=4)
    print(f"【预处理】完成，保存到{args.dev}/{args.dev}_preprocessed.json")


def combine_table_dev_json(args):

    with open(osp.join(proj_dir, 'preprocessed_data/tables_preprocessed.json'), 'r') as tables_file:
        tables_data = json.load(tables_file)

    with open(osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json'), 'r') as dev_file:
        dev_data = json.load(dev_file)

    # 创建一个字典，以db_id为键，其他信息为值
    tables_dict = {table['db_id']: table for table in tables_data}

    # 遍历dev.json并将相应的tables.json信息添加进去
    keeped_data = []
    for item in dev_data:
        # print(item['instance_id'])
        db_ids = item['db_id'].split('\n')  # 应对db_id有多个的情况
        for db_id in db_ids:
            if db_id in tables_dict:
                # 将tables.json中的其他键值对添加到dev.json对应项
                for key, value in tables_dict[db_id].items():
                    if key not in item:
                        item[key] = value
                keeped_data.append(item)
        
    # 输出新的json
    with open(osp.join(proj_dir, f'preprocessed_data/{args.dev}/sft_{args.dev}_preprocessed.json'), 'w') as new_dev_file:
        json.dump(keeped_data, new_dev_file, indent=4)

    print(f"合并后的文件保存到sft_{args.dev}_preprocessed.json")



if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    args = parser.parse_args()

    preprocess_table_json()
    preprocess_dev_json(args)
    combine_table_dev_json(args)
