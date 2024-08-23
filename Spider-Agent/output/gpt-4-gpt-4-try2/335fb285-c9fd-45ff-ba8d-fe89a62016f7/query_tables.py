import os
from google.cloud import bigquery

def query_data(sql_query):
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
    client = bigquery.Client()
    query_job = client.query(sql_query)
    try:
      results = query_job.result().to_dataframe() 
      if results.empty:
        print("No data found for the specified query.")
      else:
        print(results)
    except Exception as e:
      print("Error occurred while fetching data: ", e)

if __name__ == "__main__":
    sql_query = """
        SELECT table_name
        FROM `bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.TABLES` 
    """
    query_data(sql_query)
