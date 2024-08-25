import sqlite3
import json
import os
import random

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

    # Retrieve all column names from the table
    cursor.execute(f"PRAGMA table_info({table_name});")
    columns = cursor.fetchall()
    column_names = [col[1] for col in columns]  # Extracting the column names

    # Randomly select three columns if there are at least three columns
    if len(column_names) >= 3:
        sampled_columns = random.sample(column_names, 3)
    else:
        raise ValueError("The table does not have enough columns to sample three.")

    # Construct SQL to select all data from the sampled columns
    sql_query = f"SELECT {', '.join(sampled_columns)} FROM {table_name}"
    cursor.execute(sql_query)
    data = cursor.fetchall()

    # Close the connection
    conn.close()

    # Format data into a two-dimensional list where each sublist contains the values from a row
    formatted_data = [list(row) for row in data]

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
        column_names_original.append([-1, "*"])
        column_types = ["text"]
        
        tab_col_dict = {}
        
        primary_keys = []
        foreign_keys_origin = []
        foreign_keys = []
        table_names_original = table_names
        columns_count = []
        
        for i, tab in enumerate(table_names):
            col_names, col_types = local_db_columns(db, tab)
            tab_col_dict[tab] = col_names
            primary_keys_i, foreign_keys_i = get_keys(db, tab)
            primary_keys_i_new = [col_names.index(pk)+len(column_names_original) for pk in primary_keys_i]
            primary_keys.extend(primary_keys_i_new)
            if foreign_keys_i != []:
                foreign_keys_origin.extend(foreign_keys_i)
            column_types.extend(col_types)
            columns_count.append(len(column_names_original))
            for col in col_names:
                column_names_original.append([i, col])
            
        
        db_id = db.split("/")[-1].split(".")[0]
        
        for item in foreign_keys_origin:
            l_table = item[0]
            try:
                l_table_index = table_names_original.index(item[0])
            except:
                import pdb; pdb.set_trace()
            l_column = item[1]
            r_table = item[2]
            r_table_index = table_names_original.index(item[2])
            r_column = item[3]
            
            l_key = tab_col_dict[l_table].index(l_column) + columns_count[l_table_index]
            r_key = tab_col_dict[r_table].index(r_column) + columns_count[r_table_index]
            
            foreign_keys.append([l_key, r_key])

            
        output_dict = {}
        output_dict["db_id"] = db_id
        output_dict["table_names_original"] = table_names_original
        output_dict["column_names_original"] = column_names_original
        output_dict["column_types"] = column_types
        output_dict["primary_keys"] = primary_keys
        output_dict["foreign_keys"] = foreign_keys
        
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


    

def map_data_types(data_types):
    mapped_types = []

    for dtype in data_types:
        if "INT" in dtype.upper() or "NUM" in dtype.upper() or "FLOAT" in dtype.upper() or "DOUBLE" in dtype.upper() or "REAL" in dtype.upper():
            mapped_types.append("number")
        else:
            mapped_types.append("text")
    
    return mapped_types

def get_bq_metadata(db_name, output_path):
    source_path = "../databases/bigquery_metadata/"
    
    output_list = []
    
    for db in db_name:

        column_names_original = []
        column_names_original.append([-1, "*"])
        column_types = ["text"]

        primary_keys = []
        foreign_keys = []
        
        
        pkl_files = [file.split('.')[0] for file in os.listdir(f"/Users/leifangyu/workspace/DataAgentBench/benchmark/source/schema/bigquery/{db.split('.')[0]}") if file.endswith('.pkl')]
        if db.split(".")[1] in pkl_files:
            schema_data = read_pickle(f"/Users/leifangyu/workspace/DataAgentBench/benchmark/source/schema/bigquery/{db.split('.')[0]}/{db.split('.')[1]}.schema.pkl")
            output_dict = {}
            table_names_original =[item['table_name'] for item in schema_data]
            
            for i, table in enumerate(schema_data):
                column_names = [col['column_name'] for col in table['columns_info']]
                data_types = [col['data_type'] for col in table['columns_info']]
                column_types_i = data_types
                for col in column_names:
                    column_names_original.append([i, col])
                column_types.extend(column_types_i)
        else:
            source_path += db.split(".")[0] + "/" + db.split(".")[1] + "/"
            file_paths = [os.path.join(source_path, file) for file in os.listdir(source_path) if os.path.isfile(os.path.join(source_path, file))]
            table_names_original = [name.replace('.md','') for name in os.listdir(source_path)]
            for i, file in enumerate(file_paths):
                column_names, data_types = get_column_details(db.split(".")[0], db.split(".")[1], file.split("/")[-1].replace('.md','').split(".")[2])
                column_types_i = data_types
                for col in column_names:
                    column_names_original.append([i, col])
                column_types.extend(column_types_i)
            
        output_dict = {}
        output_dict["db_id"] = db
        output_dict["table_names_original"] = table_names_original
        output_dict["column_names_original"] = column_names_original
        output_dict["column_types"] = column_types
        output_dict["primary_keys"] = primary_keys
        output_dict["foreign_keys"] = foreign_keys
        

        
        output_list.append(output_dict)

    return output_list





if __name__ == "__main__":

    
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
            

    exist_tables = json.load(open('tables.json', 'r'))
    db_ids = [table['db_id'] for table in exist_tables]
    
    local_db_name = list(local_db_name - set(db_ids))
    bq_db_name = list(bq_db_name - set(db_ids))
    
    for root, dirs, files in os.walk('../databases/'):
        for file in files:
            if file.endswith(('.db', '.sqlite')) and os.path.splitext(file)[0] in local_db_name:
                full_path = os.path.join(root, file)
                local_db_path.append(full_path)

    
    output_path = "tables.json"
    
    local_output_list = get_local_metadata(local_db_path, output_path)
    bq_output_list = get_bq_metadata(bq_db_name, output_path)
    
    new_output_list = local_output_list + bq_output_list
    
    new_output_table_list = exist_tables + new_output_list

    with open('tables.json', 'w') as file:
        json.dump(new_output_table_list, file, indent=4)
    
    