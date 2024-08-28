import sqlite3
import json
import os
import random
from tqdm import tqdm
import numpy as np

def local_db_tables(db_name):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()
    output_tables = []
    for table in tables:
        output_tables.append(table[0])
    return output_tables

def local_db_columns(db_name, table_name):
    conn = sqlite3.connect(db_name)

    cursor = conn.cursor()


    cursor.execute(f"PRAGMA table_info({table_name});")

    column_names = []
    column_types = []

    columns = cursor.fetchall()

    for col in columns:
        column_names.append(col[1])
        column_types.append(col[2])
    return column_names, column_types

def sample_three_columns(db_name, table_name):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    # Get column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = cursor.fetchall()
    column_names = [column[1] for column in columns]

    # Fetch all rows from the table
    cursor.execute(f"SELECT * FROM {table_name}")
    all_rows = cursor.fetchall()

    # Determine number of rows to sample based on available rows
    num_rows_to_sample = min(3, len(all_rows))

    # If no rows available, return empty list
    if num_rows_to_sample == 0:
        conn.close()
        return []

    # Sample rows
    sampled_rows = random.sample(all_rows, num_rows_to_sample)

    # Close the connection
    conn.close()

    # Create a list of dictionaries for each row
    formatted_data = [{column_names[i]: row[i] for i in range(len(row))} for row in sampled_rows]

    return formatted_data


def get_keys(db_name, table_name):
    conn = sqlite3.connect(db_name)

    cursor = conn.cursor()

    cursor.execute(f"PRAGMA table_info({table_name});")
    columns = cursor.fetchall()

    primary_keys = [col[1] for col in columns if col[5] != 0]

    cursor.execute(f"PRAGMA foreign_key_list({table_name});")
    output_info = cursor.fetchall()
    foreign_keys = []

    for fk in output_info:
        foreign_keys.append((table_name, fk[3], fk[2], fk[4]))

    return primary_keys, foreign_keys
    
def map_data_types(data_types):
    mapped_types = []

    for dtype in data_types:
        if "INT" in dtype.upper() or "NUM" in dtype.upper() or "FLOAT" in dtype.upper() or "DOUBLE" in dtype.upper() or "REAL" in dtype.upper():
            mapped_types.append("number")
        else:
            mapped_types.append("text")
    
    return mapped_types



def get_local_metadata(db_name, output_path):
    output_list = []
    
    for db in db_name:
        table_names = local_db_tables(db)
        
        column_names_original = []
        output_three_rows = {}

        table_names_original = table_names
        
        for i, tab in enumerate(table_names):
            col_names, _ = local_db_columns(db, tab)
            sample_3rows = sample_three_columns(db, tab)

            output_three_rows[tab] = sample_3rows
            
            column_names_original.append(col_names)
            
        
        db_id = db.split("/")[-1].split(".")[0]
        

            
        output_dict = {}
        output_dict["db_id"] = db_id
        output_dict["table_names_original"] = table_names_original
        output_dict["column_names_original"] = column_names_original
        output_dict["sample_rows"] = output_three_rows
        
        output_list.append(output_dict)
            
    return output_list



from google.cloud import bigquery
import pickle
def read_pickle(file_path):
    with open(file_path, 'rb') as f:
        data = pickle.load(f)
    return data
def get_column_details(database_name, schema_name, table_name):
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
    client = bigquery.Client()

    query = f"""
    SELECT
        column_name,
        data_type
    FROM
        `{database_name}.{schema_name}.INFORMATION_SCHEMA.COLUMNS`
    WHERE
        table_name = '{table_name}'
    """

    query_job = client.query(query)
    results = query_job.result().to_dataframe()

    column_names = results['column_name'].tolist()
    column_types = results['data_type'].tolist()

    return column_names, column_types


def get_bq_sample_rows(database_name, schema_name, table_name):
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
    client = bigquery.Client()

    query = f"""
    SELECT table_name
    FROM `{database_name}.{schema_name}.INFORMATION_SCHEMA.TABLES`
    """

    query_job = client.query(query)
    
    table_names = query_job.result().to_dataframe()['table_name'].tolist()

    
    output_schema_list = []
    output_sample_row_list = []
    
    
    for table_name in tqdm(table_names):
        sample_rows_info = []
        sample_rows_str = ""
        try:
            query = f"""
                    SELECT * 
                        FROM 
                        `{database_name}.{schema_name}.{table_name}` 
                        LIMIT 3; 
                    """
            query_job = client.query(query)
            results = query_job.result().to_dataframe()
            sample_rows_str = results.to_markdown(index=False)
            sample_rows_info = results.to_dict(orient='records')
        except Exception as e:
            error_message = traceback.format_exc()
            if "does not exist or not authorized" in error_message:
                continue
            elif "exceeded quota for free query bytes" in error_message:
                print(error_message)
                sample_rows_str = ""
                sample_rows_info = []
            else:
                print(error_message)
                pass
        
        query = f"""
        SELECT
        column_name,
        data_type,
        description
        FROM
        `{database_name}.{schema_name}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
        WHERE
        table_schema = '{schema_name}' AND table_name = '{table_name}'
        """
        
        query_job = client.query(query)
        df = query_job.result().to_dataframe()
        schema_markdown_str = df.to_markdown(index=False)
                
        columns_info = df.to_dict(orient='records')
        # output_schema_list.append({"table_name": table_name, "columns_info": columns_info})
        output_sample_row_list.append({"table_name": table_name, "sample_rows_str": sample_rows_info})
    
        
    # with open(f"bigquery/{database_name}/{schema_name}.md", 'w') as file:
    #     file.write(output_str)
    
    # with open(f"bigquery/{database_name}/{schema_name}.schema.pkl", 'wb') as f:
    #     pickle.dump(output_schema_list, f)
        
    # with open(f"bigquery/{database_name}/{schema_name}.sample.pkl", 'wb') as f:
    #     pickle.dump(output_sample_row_list, f)
    return table_names, output_sample_row_list

    

def map_data_types(data_types):
    mapped_types = []

    for dtype in data_types:
        if "INT" in dtype.upper() or "NUM" in dtype.upper() or "FLOAT" in dtype.upper() or "DOUBLE" in dtype.upper() or "REAL" in dtype.upper():
            mapped_types.append("number")
        else:
            mapped_types.append("text")
    
    return mapped_types

def get_bq_metadata(db_name, output_path):
    source_path = "../../databases/bigquery_metadata/"
    
    output_list = []
    

    
    for db in db_name:

        column_names_original = []
        
        output_dict = {}
        
        if not os.path.exists("/Users/leifangyu/workspace/DataAgentBench/benchmark/source/schema/bigquery"):
            pkl_files = []
        else:
            pkl_files = [file.split('.')[0] for file in os.listdir(f"/Users/leifangyu/workspace/DataAgentBench/benchmark/source/schema/bigquery/{db.split('.')[0]}") if file.endswith('.pkl')]
        if db.split(".")[1] in pkl_files:
            sample_data = read_pickle(f"/Users/leifangyu/workspace/DataAgentBench/benchmark/source/schema/bigquery/{db.split('.')[0]}/{db.split('.')[1]}.sample.pkl")
            
            output_three_rows = {}
            
            table_names_original = [item['table_name'] for item in sample_data]
            
            for item in sample_data:
                output_three_rows[item['table_name']] = item['sample_rows_str']
            
        else:
            
            output_three_rows = {}
            table_names_original, sample_data = get_bq_sample_rows(db.split(".")[0], db.split(".")[1], file.split("/")[-1].replace('.md','').split(".")[2])

            table_names_original = [item['table_name'] for item in sample_data]
            
            for item in sample_data:
                output_three_rows[item['table_name']] = item['sample_rows_str']
            
            
        output_dict = {}
        output_dict["db_id"] = db
        output_dict["table_names_original"] = table_names_original
        output_dict["sample_rows"] = output_three_rows

        output_list.append(output_dict)

    return output_list





if __name__ == "__main__":
    output_path = "tables_rows.pkl"
    
    with open("spider2_dev.json", 'r', encoding='utf-8') as file:
        spider2_data = json.load(file)
        
    local_db_name, bq_db_name = set(), set()
    local_db_path = []
    for data in spider2_data:
        if '.' not in data['db']:
            local_db_name.add(data['db'])
        else:
            if '\n' in data['db']:
                bq_db_name.update(data['db'].split('\n'))
            else:
                bq_db_name.add(data['db'])
            
    
    if not os.path.exists(output_path):
        # If the file does not exist, create an empty list or default structure
        exist_tables = []
        with open(output_path, 'wb') as file:
            pickle.dump(exist_tables, file)
        db_ids = []
    else:
        with open(output_path, 'rb') as file:
            exist_tables = pickle.load(file)
        db_ids = [table['db_id'] for table in exist_tables]

    
    local_db_name = list(local_db_name - set(db_ids))
    bq_db_name = list(bq_db_name - set(db_ids))
    
    
    for root, dirs, files in os.walk('../../databases/'):
        for file in files:
            if file.endswith(('.db', '.sqlite')) and os.path.splitext(file)[0] in local_db_name:
                full_path = os.path.join(root, file)
                local_db_path.append(full_path)

    
    local_output_list = get_local_metadata(local_db_path, output_path)
    bq_output_list = get_bq_metadata(bq_db_name, output_path)
    
    
    new_output_list = local_output_list + bq_output_list
    
    new_output_table_list = exist_tables + new_output_list

    with open(output_path, 'wb') as file:
        pickle.dump(new_output_table_list, file)