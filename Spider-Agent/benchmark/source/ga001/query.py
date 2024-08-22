import os
import pandas as pd
from google.cloud import bigquery

def query_data():
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
    client = bigquery.Client()
    
    """
    -- SQL example
    SELECT
      *
    FROM
      `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE
      _TABLE_SUFFIX BETWEEN '20201201' AND '20201212'
    """
    
    query = """
    # TODO: Write your query here

    """

    query_job = client.query(query)
    try:
      results = query_job.result().to_dataframe() 
      if results.empty:
        print("No data found for the specified query.")
      else:
        results.to_csv("result.csv", index=False)
        print("Results saved to result.csv")
    except Exception as e:
      print("Error occurred while fetching data: ", e)

if __name__ == "__main__":
    query_data()
