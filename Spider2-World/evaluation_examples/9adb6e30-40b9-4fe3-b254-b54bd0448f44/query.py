import os
import pandas as pd
from google.cloud import bigquery

def query_data(sql_query, is_save, save_path="result.csv"):
    """
    Queries data from BigQuery based on the provided SQL query and handles the result.

    Args:
    sql_query (str): SQL query string to be executed.
    is_save (bool): If True, saves the query results to a CSV file at the specified save_path.
                    If False, prints the results to the console.
    save_path (str): The file path where the results will be saved if is_save is True. Defaults to 'result.csv'.
    """
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "bigquery_credential.json"
    client = bigquery.Client()
    query_job = client.query(sql_query)
    try:
      results = query_job.result().to_dataframe()
      if results.empty:
        print("No data found for the specified query.")
      else:
        if is_save:
            results.to_csv(save_path, index=False)
            print(f"Results saved to {save_path}")
        else:
            print(results)
    except Exception as e:
      print("Error occurred while fetching data: ", e)

if __name__ == "__main__":

    # # Complete the SQL query in the sql_query variable to interact with the database, partial SQL query is provided below
    sql_query = """
  SELECT 
    ANY_VALUE(ARRAY_LENGTH(inventor)) AS num_inventors,
    ANY_VALUE(country_code) AS country_code,
    ANY_VALUE(CAST(FLOOR(filing_date / (5 * 10000)) AS INT64)) * 5 AS filing_year
  FROM 
    `patents-public-data.patents.publications` AS pubs
    """
    query_data(sql_query, is_save=True, save_path="result.csv")
