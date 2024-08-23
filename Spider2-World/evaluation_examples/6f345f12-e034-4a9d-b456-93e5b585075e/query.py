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
        FROM `pancancer-atlas.Filtered.INFORMATION_SCHEMA.TABLES` 
    """
    
    sql_query = """
        SELECT Tumor_SampleBarcode AS SampleBarcode   
        FROM `pancancer-atlas.Filtered.MC3_MAF_V5_one_per_tumor_sample`
    """
    
    query_data(sql_query, is_save=False)
