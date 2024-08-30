import os
import json
import shutil

# Set the path for the credential file in the root directory
credential_path = 'bigquery_credential.json'

# Path to the jsonl file to be processed
jsonl_path = 'examples/spider2.jsonl'

# Read the jsonl file and filter records where type is "Bigquery", then save the corresponding instance_ids to a list
instance_ids = []
with open(jsonl_path, 'r') as file:
    for line in file:
        record = json.loads(line)
        if record.get('type') == 'Bigquery':
            instance_id = record.get('instance_id')
            if instance_id:
                instance_ids.append(instance_id)

# Iterate over the instance_ids list to process corresponding folders
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

print("Processing completed.")
