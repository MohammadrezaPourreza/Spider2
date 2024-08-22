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
      SELECT
        items.item_name AS item_name,
        COUNT(*) AS count
      FROM
        `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
        UNNEST(items) AS items
      WHERE
        _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
        AND event_name = 'purchase'
      GROUP BY
        item_name
      ORDER BY
        count DESC
    """
    query_data(sql_query, is_save=True)
