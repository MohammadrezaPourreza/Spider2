import os
import json

def process_sql_files(folder_path, output_jsonl):
    instance_ids = []

    # Traverse the folder and collect instance_ids
    for filename in os.listdir(folder_path):
        if filename.endswith(".sql"):
            instance_id = os.path.splitext(filename)[0]
            instance_ids.append(instance_id)

    # Write to JSONL file
    with open(output_jsonl, 'w') as jsonl_file:
        for instance_id in instance_ids:
            entry = {
                "instance_id": instance_id,
                "condition_cols": [],
                "ignore_order": True
            }
            jsonl_file.write(json.dumps(entry) + '\n')

# Example usage
folder_path = './gold/sql/'
output_jsonl = './gold/spider2sql_eval.jsonl'
process_sql_files(folder_path, output_jsonl)
