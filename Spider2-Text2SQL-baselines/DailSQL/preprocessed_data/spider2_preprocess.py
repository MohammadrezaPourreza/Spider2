# import debugpy; debugpy.connect(('127.0.0.1', 5688))


import json
import os
import os.path as osp
import corenlp
import spacy
import requests


proj_dir = osp.dirname(osp.dirname(osp.abspath(__file__)))

def convert_original_for_table_json(): 
    '''
    根据table_names_original得到table_names，放入dev.json
    '''

    with open(osp.join(proj_dir, 'data/tables.json'), 'r', encoding='utf-8') as file:
        data = json.load(file)

    # 处理每个字典
    for item in data:
        if 'table_names_original' in item:
            item['table_names'] = item['table_names_original']
            item['column_names'] = item['column_names_original']

    # 将修改后的数据写回到新的 JSON 文件中
    with open(osp.join(proj_dir, 'preprocessed_data/tables_preprocessed.json'), 'w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=4)

    print("【预处理】完成，结果已保存到preprocessed_data/tables_preprocessed.json")



# class CoreNLP:
#     def __init__(self):
#         if not os.environ.get('CORENLP_HOME'):
#             os.environ['CORENLP_HOME'] = osp.abspath(osp.join(proj_dir, 'third_party/stanford-corenlp-full-2018-10-05'))
#             print('>>> Set CORENLP_HOME to', os.environ['CORENLP_HOME'])
#         if not os.path.exists(os.environ['CORENLP_HOME']):
#             raise Exception(
#                 f'''Please install Stanford CoreNLP and put it at {os.environ['CORENLP_HOME']}.
#                 Direct URL: http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip
#                 Landing page: https://stanfordnlp.github.io/CoreNLP/''')
#         self.client = corenlp.CoreNLPClient(endpoint="http://localhost:9000")

#     def test_connection(self):
#         try:
#             response = requests.get("http://localhost:9000")
#             if response.status_code == 200:
#                 print("CoreNLP server is running.")
#             else:
#                 print("CoreNLP server is not responding correctly.")
#         except requests.exceptions.RequestException as e:
#             print(f"Error connecting to CoreNLP server: {e}")

#     def tokenize_sentence(self, sentence):
#         ann = self.client.annotate(sentence, properties={
#             'annotators': 'tokenize,ssplit,pos',
#             'outputFormat': 'json'
#         })
#         tokens = [token['word'] for s in ann['sentences'] for token in s['tokens']]
#         return tokens


def get_questionTok_and_gold_query_for_dev_json():
    '''
    使用分词器，将分词后的question放入dev.json
    '''
    # corenlp_instance = CoreNLP()
    # corenlp_instance.test_connection()
    nlp = spacy.load("en_core_web_sm")
    
    with open(osp.join(proj_dir, 'data/spider2_dev.json'), 'r', encoding='utf-8') as file:
        data = json.load(file)

    # 处理每个字典
    for item in data:
        # step1. 分词
        # item['question_toks'] = corenlp_instance.tokenize_sentence(item['question'])
        doc = nlp(item['question'])
        item['question_toks'] = [token.text for token in doc]

        # step2. 获取gold_sql
        gold_sql_file = osp.join(proj_dir, f"../evaluation_suite/gold/sql/{item['instance_id']}.sql")
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

    # 将修改后的数据写回到新的 JSON 文件中
    with open(osp.join(proj_dir, 'preprocessed_data/spider2_dev_preprocessed.json'), 'w', encoding='utf-8') as file:
        json.dump(data, file, ensure_ascii=False, indent=4)

    print("【预处理】完成，结果已保存到preprocessed_data/spider2_dev_preprocessed.json")



if __name__ == '__main__':
    convert_original_for_table_json()
    get_questionTok_and_gold_query_for_dev_json()






