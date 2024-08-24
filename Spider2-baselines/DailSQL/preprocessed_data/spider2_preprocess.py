# import debugpy; debugpy.connect(('127.0.0.1', 5696))


import json
import os
import os.path as osp
import corenlp
import spacy
import requests
import argparse


proj_dir = osp.dirname(osp.dirname(osp.abspath(__file__)))


import glob
import json
import os
import matplotlib.pyplot as plt


def column_description_length_histogram():
    # 定义路径
    json_path = "../../Spider2/databases/bigquery/metadata/bigquery-public-data/**/*.json"

    # 用于存储描述字符串长度的列表
    description_lengths = []

    # 遍历所有的json文件
    all_count, valid_count = 0, 0
    for json_file in glob.glob(json_path, recursive=True):
        with open(json_file, 'r', encoding='utf-8') as file:
            try:
                data = json.load(file)
                if "description" in data:
                    for desc in data["description"]:
                        all_count += 1
                        if desc is not None and desc != '':
                            valid_count += 1
                            description_lengths.append(len(desc))
            except json.JSONDecodeError:
                print(f"Error reading {json_file}")

    print(f"Total number of column descriptions: {all_count}")
    print(f"Number of valid column descriptions: {valid_count}")
    print(f"Ratio of valid column descriptions: {valid_count / all_count}")            

    # 绘制直方图
    plt.hist(description_lengths, bins=20, edgecolor='black')
    plt.xlabel('Description Length')
    plt.ylabel('Frequency')
    plt.title('Distribution of Column Description Lengths')
    plt.savefig('description_length_histogram.png')
    # plt.show()


def db_statistic(args):

    with open(osp.join(proj_dir, f'../data/{args.dev}.json'), 'r', encoding='utf-8') as file:
        dev_data = json.load(file)
    # all db_ids
    db_ids = set([item['db'] for item in dev_data])

    # 定义路径
    db_base_path = "../../Spider2/databases/bigquery/metadata/"
    json_glob_path = "**/*.json"

    # 定义用于存储统计结果的列表
    db_stats_list = []

    # 遍历所有项目
    for project_path in glob.glob(os.path.join(db_base_path, "*"), recursive=False):
        project_name = os.path.basename(os.path.normpath(project_path))

        # 遍历项目中的所有数据库
        for db_path in glob.glob(os.path.join(project_path, "*"), recursive=False):

            db_name = os.path.basename(os.path.normpath(db_path)) 
            if f"{project_name}.{db_name}" not in db_ids: 
                continue  # 仅保存在dev.json中的数据库

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


            # 将数据库的统计信息添加到列表中
            db_stats_list.append({
                "db_id": f"{project_name}.{db_name}",  # 改为project.db格式
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
                "primary_keys": [],
                "foreign_keys": []
            })

    # 计算所有数据库的平均统计量
    total_table_count = sum(item['db_stats']["No. of tables"] for item in db_stats_list)
    total_column_count = sum(item['db_stats']["No. of columns"] for item in db_stats_list)
    total_avg_column_per_table = sum(item['db_stats']["Avg. No. of columns per table"] for item in db_stats_list)

    num_dbs = len(db_stats_list)

    avg_table_count_per_db = total_table_count / num_dbs if num_dbs > 0 else 0
    avg_total_column_count_per_db = total_column_count / num_dbs if num_dbs > 0 else 0
    avg_avg_column_per_table_per_db = total_avg_column_per_table / num_dbs if num_dbs > 0 else 0

    # 打印结果
    print(f"Average No. of tables across all database: {avg_table_count_per_db:.2f}")
    print(f"Average No. of columns across all Database: {avg_total_column_count_per_db:.2f}")
    print(f"Average Avg. No. of columns per table across all Databases: {avg_avg_column_per_table_per_db:.2f}")

    # 将统计数据保存为JSON文件（以列表形式存储）
    with open(f"preprocessed_data/{args.dev}/tables.json", "w", encoding="utf-8") as json_file:
        json.dump(db_stats_list, json_file, indent=4, ensure_ascii=False)

    # with open("tables_toy.json", "w", encoding="utf-8") as json_file:
    #     json.dump([db_stats_list[5]], json_file, indent=4, ensure_ascii=False)

    # 绘制柱状图
    db_names = [item['db_id'] for item in db_stats_list]
    table_counts = [item['db_stats']["No. of tables"] for item in db_stats_list]
    total_columns = [item['db_stats']["No. of columns"] for item in db_stats_list]
    avg_columns = [item['db_stats']["Avg. No. of columns per table"] for item in db_stats_list]

    fig, ax = plt.subplots(3, 1, figsize=(10, 10))

    # Plot for table count
    ax[0].bar(db_names, table_counts, color='blue')
    ax[0].set_title("No. of tables")
    ax[0].set_ylabel("#")
    ax[0].tick_params(axis='x', rotation=45)
    for label in ax[0].get_xticklabels():
        label.set_ha('right')

    # Plot for total column count
    ax[1].bar(db_names, total_columns, color='green')
    ax[1].set_title("No. of columns")
    ax[1].set_ylabel("#")
    ax[1].tick_params(axis='x', rotation=45)
    for label in ax[1].get_xticklabels():
        label.set_ha('right')

    # Plot for average columns per table
    ax[2].bar(db_names, avg_columns, color='orange')
    ax[2].set_title("Avg. No. of columns per table")
    ax[2].set_ylabel("#")
    ax[2].tick_params(axis='x', rotation=45)
    for label in ax[2].get_xticklabels():
        label.set_ha('right')

    plt.tight_layout()
    plt.show()
    plt.savefig('db_statistic.png')





def convert_original_for_table_json(args): 
    '''
    根据table_names_original得到table_names，放入dev.json
    '''

    with open(f"preprocessed_data/{args.dev}/tables.json", 'r', encoding='utf-8') as file:
        data = json.load(file)

    # 处理每个字典
    for item in data:
        if 'table_names_original' in item:
            item['table_names'] = item['table_names_original']
            item['column_names'] = item['column_names_original']


    # 将修改后的数据写回到新的 JSON 文件中
    with open(f"preprocessed_data/{args.dev}/tables_preprocessed.json", 'w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=4)

    print(f"【预处理】完成，结果已保存到preprocessed_data/{args.dev}/tables_preprocessed.json")

    


def process_dev_json(args):
    def get_questionTok_and_gold_query_for_dev_json(data):
        '''
        使用分词器，将分词后的question放入dev.json
        '''
        nlp = spacy.load("en_core_web_sm")
        
        os.makedirs(osp.join(proj_dir, f'preprocessed_data/{args.dev}'), exist_ok=True)
        # 处理每个字典
        for item in data:
            # step1. 分词
            # item['question_toks'] = corenlp_instance.tokenize_sentence(item['question'])
            doc = nlp(item['question'])
            item['question_toks'] = [token.text for token in doc]

            # step2. 获取gold_sql
            gold_sql_file = osp.join(proj_dir, f"../../Spider2/evaluation_suite/gold/sql/{item['instance_id']}.sql")
            # gold_sql_file = osp.normpath(gold_sql_file)
            if not os.path.exists(gold_sql_file):
                print(f"找不到文件：{gold_sql_file}")
                item['query'] = ''
            else:
                with open(gold_sql_file, 'r', encoding='utf-8') as file:
                    gold_sql = file.read().strip()
                    item['query'] = gold_sql

            # step3. 将db改名为db_id
            item['db_id'] = item['db']
            del item['db']
        return data
    
    def get_potential_functions_summary(data):
        with open(osp.join(proj_dir, '../../Spider2/externel_information/bigquery_functions.json'), 'r', encoding='utf-8') as file:
            bigquery_functions = json.load(file)

        # 创建一个字典，方便快速查找summary
        function_summaries = {}
        for category_entry in bigquery_functions:
            category = category_entry.get("category", "")
            for function_name, function_details in category_entry.get("functions", {}).items():
                function_summaries[f"{category}/{function_name}"] = function_details.get("summary", "")
                function_summaries[function_name] = function_details.get("summary", "")  # 处理单独函数情况

        # 填充summary
        for item in data:
            if item.get("potential_functions") is None:
                continue
            updated_potential_functions = []
            for function_name in item.get("potential_functions", []):
                # 查找对应的summary
                summary = function_summaries.get(function_name, "No summary found")
                # 将function_name和summary组合
                updated_potential_functions.append(
                    {
                        'name':function_name,
                        'summary':summary
                    }
                )
            # 将修改后的列表赋值回potential_functions字段
            item["potential_functions"] = updated_potential_functions

        return data

    with open(osp.join(proj_dir, f'../data/{args.dev}.json'), 'r', encoding='utf-8') as file:
        data = json.load(file)

    data = get_questionTok_and_gold_query_for_dev_json(data)
    data = get_potential_functions_summary(data)

    # option: 仅支持gt db数量为1的题目
    data = [item for item in data if '\n' not in item.get('db_id', '')]

    # 将修改后的数据写回到新的 JSON 文件中
    with open(osp.join(proj_dir, f'preprocessed_data/{args.dev}/{args.dev}_preprocessed.json'), 'w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=4)

    print(f"【预处理】完成，结果已保存到{args.dev}/{args.dev}_preprocessed.json")



if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('--dev', default='spider2_dev', type=str, help='the name of dev file')
    args = parser.parse_args()

    # column_description_length_histogram()
    db_statistic(args)
    convert_original_for_table_json(args)
    process_dev_json(args)






