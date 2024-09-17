import os
import json
import shutil

import argparse

jsonl_path = 'examples/spider2.jsonl'



def setup_bigquery():

    credential_path = 'bigquery_credential.json'
    instance_ids = []
    with open(jsonl_path, 'r') as file:
        for line in file:
            record = json.loads(line)
            if record.get('type') == 'Bigquery':
                instance_id = record.get('instance_id')
                if instance_id:
                    instance_ids.append(instance_id)
    for instance_id in instance_ids:
        folder_path = f'examples/{instance_id}'
        target_credential_path = os.path.join(folder_path, 'bigquery_credential.json')
        # Check if the folder exists
        if not os.path.exists(folder_path):
            os.makedirs(folder_path)
        # Replace the credential file if it exists, or copy a new one if it doesn't
        if os.path.exists(target_credential_path):
            os.remove(target_credential_path)
        shutil.copy(credential_path, target_credential_path)
    print("Finished BigQuery setup...")


def setup_snowflake():

    credential_path = 'snowflake_credential.json'
    instance_ids = []
    with open(jsonl_path, 'r') as file:
        for line in file:
            record = json.loads(line)
            if record.get('type') == 'Snowflake':
                instance_id = record.get('instance_id')
                if instance_id:
                    instance_ids.append(instance_id)
    for instance_id in instance_ids:
        folder_path = f'examples/{instance_id}'
        target_credential_path = os.path.join(folder_path, 'snowflake_credential.json')
        if os.path.exists(target_credential_path):
            os.remove(target_credential_path)
        shutil.copy(credential_path, target_credential_path)
    print("Finished Snowflake setup...")

def setup_local():
    with open('./resource/databases/local/local-map.jsonl', 'r') as infile:
        for line in infile:
            local_map = json.loads(line)
    instance_ids = []
    with open(jsonl_path, 'r') as file:
        for line in file:
            record = json.loads(line)
            if record.get('type') == 'Local':
                instance_id = record.get('instance_id')
                if instance_id:
                    instance_ids.append(instance_id)    
    for instance_id in instance_ids:
        try:
            db_name = local_map[instance_id]
        except:
            print(f"Coundn't setup example {instance_id}.")
            continue
        folder_path = f'examples/{instance_id}'
        db_path = os.path.join('./resource/databases/local', f"{db_name}.sqlite") 
        target_db_path = os.path.join(folder_path, f"{db_name}.sqlite")
        if not os.path.exists(folder_path):
            os.makedirs(folder_path)
        if os.path.exists(target_db_path):
            os.remove(target_db_path)
        shutil.copy(db_path, target_db_path)
        print(f"successfully copied {db_name}.sqlite to {folder_path}")
    
    print("Finished local setup...")
    

def setup_dbt():
    print("Finished dbt setup...")
    
    
def setup_add_schema():
    instance_ids = []
    with open(jsonl_path, 'r') as file:
        for line in file:
            record = json.loads(line)
            instance_id = record.get('instance_id')
            instance_ids.append(instance_id)
    with open('./resource/databases/local/local-map.jsonl', 'r') as infile:
        for line in infile:
            local_map = json.loads(line)
            
    schema_root = '../spider2-lite/resource/databases/'
            
    for instance_id in instance_ids:
        if 'bq' not in instance_id and 'ga' not in instance_id and 'local' not in instance_id: continue
        
        example_folder = f'examples/{instance_id}'
        assert os.path.exists(example_folder)
        dest_folder = os.path.join(example_folder, 'DB_schema')
        if os.path.exists(dest_folder):
            shutil.rmtree(dest_folder)
        else:
            os.makedirs(dest_folder)

        databases = local_map[instance_id].split('\n')
        if instance_id.startswith('bq') or instance_id.startswith('ga'):
            for db in databases:
                src_folder = os.path.join(schema_root, 'bigquery', db)
                shutil.copytree(src_folder, os.path.join(dest_folder, os.path.basename(src_folder)))
                print(f"successfully copied {db} to {dest_folder}")
        elif instance_id.startswith('sf'):
            for db in databases:
                src_folder = os.path.join(schema_root, 'snowflake', db)
                shutil.copytree(src_folder, os.path.join(dest_folder, os.path.basename(src_folder)))
                print(f"successfully copied {db} to {dest_folder}")
        

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Setup for Spider 2.0")
    parser.add_argument("--bigquery", action="store_true", help="Setup BigQuery")
    parser.add_argument("--snowflake", action="store_true", help="Setup Snowflake")
    parser.add_argument("--local", action="store_true", help="Setup local environment")
    parser.add_argument("--dbt", action="store_true", help="Setup dbt")
    parser.add_argument("--add_schema", action="store_true", help="Add schema")

    args = parser.parse_args()

    if args.bigquery:
        setup_bigquery()
    if args.snowflake:
        setup_snowflake()
    if args.local:
        setup_local()
    if args.dbt:
        setup_dbt()

    if not (args.bigquery or args.snowflake or args.local or args.dbt):
        setup_bigquery()
        setup_snowflake()
        setup_local()
        setup_dbt()
        
    if args.add_schema:
        setup_add_schema()

