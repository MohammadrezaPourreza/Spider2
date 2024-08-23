BQ_GET_TABLES_TEMPLATE = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

query = f\"\"\"
SELECT
    table_name, ddl
FROM
    `{project_name}.{dataset_name}.INFORMATION_SCHEMA.TABLES`
WHERE
    table_type != 'VIEW'
\"\"\"

query_job = client.query(query)

try:
    results = query_job.result().to_dataframe() 
    if results.empty:
        print("No data found for the specified query.")
    else:
        results.to_csv("{save_path}", index=False)
        print(f"DB metadata is saved to {save_path}")
except Exception as e:
    print("Error occurred while fetching data: ", e)
"""

BQ_GET_TABLE_INFO = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

query = f\"\"\"
    SELECT field_path, data_type, description
    FROM `{project_name}.{dataset_name}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
    WHERE table_name = '{table}';
\"\"\"

query_job = client.query(query)

try:
    output = query_job.result().to_dataframe() 
    if output.empty:
        print("No data found for the specified query.")
    else:
        output.to_csv("{save_path}", index=False)
        print(f"Results saved to {save_path}")
except Exception as e:
    print("Error occurred while fetching data: ", e)
"""

BQ_SAMPLE_ROWS = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

query = f\"\"\"
    SELECT
    *
    FROM
    `{project_name}.{dataset_name}.{table}`
    TABLESAMPLE SYSTEM (0.0001 PERCENT)
    LIMIT {row_number};
\"\"\"

query_job = client.query(query)

try:
    output = query_job.result().to_dataframe() 
    if output.empty:
        print("No data found for the specified query.")
    else:
        sample_rows = output.to_dict(orient='records')
        with open("{save_path}", 'w') as json_file:
            import json
            json.dump(sample_rows, json_file, indent=4)
        print(f"Sample rows saved to {save_path}")
except Exception as e:
    print("Error occurred while fetching data: ", e)
"""

BQ_GET_COLUMN_DISTINCT_VALUE = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

query = f\"\"\"
    SELECT DISTINCT {column_name}
    FROM `{project_name}.{dataset_name}.{table}`
\"\"\"

query_job = client.query(query)

try:
    output = query_job.result().to_dataframe() 
    if output.empty:
        print("No distinct values found for the specified column.")
    else:
        output.to_csv("{save_path}", index=False)
        print(f"Distinct values saved to {save_path}")
except Exception as e:
    print("Error occurred while fetching data: ", e)
"""



BQ_EXEC_SQL_QUERY_TEMPLATE = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

sql_file_path = "{sql_file_path}"

with open(sql_file_path, 'w') as file:
    file.write(f\"\"\"{sql_query}\"\"\")

with open(sql_file_path, 'r') as file:
    sql_query = file.read()

query_job = client.query(sql_query)

try:
    results = query_job.result().to_dataframe()
    if results.empty:
        print("No data found for the specified query.")
    else:
        if {is_save}:
            results.to_csv("{save_path}", index=False)
            print(f"Results saved to {save_path}")
        else:
            print(results)
except Exception as e:
    print("Error occurred while fetching data: ", e)
"""
