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
    `{database_name}.{dataset_name}.INFORMATION_SCHEMA.TABLES`
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

BQ_GET_TABLE_INFO_TEMPLATE = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

query = f\"\"\"
    SELECT field_path, data_type, description
    FROM `{database_name}.{dataset_name}.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
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

BQ_SAMPLE_ROWS_TEMPLATE = """
import os
import pandas as pd
from google.cloud import bigquery
import json
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

query = f\"\"\"
    SELECT
    *
    FROM
    `{database_name}.{dataset_name}.{table}`
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
        json_data = json.dumps(sample_rows, indent=4, default=str)
        with open("{save_path}", 'w') as json_file: 
            json_file.write(json_data)
        print(f"Sample rows saved to {save_path}")
except Exception as e:
    print("Error occurred while fetching data: ", e)
"""

BQ_EXEC_SQL_QUERY_TEMPLATE = """
import os
import pandas as pd
from google.cloud import bigquery

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
client = bigquery.Client()

sql_query = f\"\"\"{sql_query}\"\"\"

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


LOCAL_SQL_TEMPLATE = """
import sqlite3
import pandas as pd
import os

def execute_sql(file_path, command, output_path):
    # make sure the file path is correct
    if not os.path.exists(file_path):
        print(f"ERROR: File not found: {{file_path}}")
        return

    # Connect to the SQLite database
    conn = sqlite3.connect(file_path)
    
    try:
        # Execute the SQL command and fetch the results
        df = pd.read_sql_query(command, conn)
        
        # Check if the output should be saved to a CSV file or printed directly
        if output_path.lower().endswith(".csv"):
            df.to_csv(output_path, index=False)
            print(f"Output saved to: {{output_path}}")
        else:
            print(df)
    except Exception as e:
        print(f"ERROR: {{e}}")
    finally:
        # Close the connection to the database
        conn.close()

# Example usage
file_path = "{file_path}"  # Path to your SQLite database file
command = "{code}"             # SQL command to be executed
output_path = "{output}" # Path to save the output as a CSV or "directly"

execute_sql(file_path, command, output_path)

"""