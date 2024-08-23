import os
import pandas as pd
from google.cloud import bigquery

def query_data(sql_query, is_save):
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
    client = bigquery.Client()
    query_job = client.query(sql_query)
    try:
      results = query_job.result().to_dataframe() 
      if results.empty:
        print("No data found for the specified query.")
      else:
        if is_save:
            results.to_csv("result.csv", index=False)
            print("Results saved to result.csv")
        else:
            print(results)
    except Exception as e:
      print("Error occurred while fetching data: ", e)

if __name__ == "__main__":
    sql_query = """
        SELECT table_name
        FROM `patents-public-data.patents.INFORMATION_SCHEMA.TABLES` 
    """
    
    sql_query = """
        SELECT
        column_name,
        data_type,
        description
        FROM
        `patents-public-data.patents.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
        WHERE
        table_schema = 'patents' AND table_name = '{table_name}'
    """

    query_data(sql_query, is_save=False)




