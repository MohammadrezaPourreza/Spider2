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

    # Write your SQL query in the sql_query variable to interact with the database, the SQL here is just an example
    sql_query = """
    SELECT
        pubs.publication_number AS citing_publication_number,
        cite.publication_number AS cited_publication_number,
        citing_assignee_s.name AS citing_assignee,
        SUBSTR(cpcs.code, 0, 4) AS citing_cpc_subclass
    FROM 
        `patents-public-data.patents.publications` AS pubs,
        UNNEST(citation) AS cite,
        UNNEST(assignee_harmonized) AS citing_assignee_s,
        UNNEST(cpc) AS cpcs
    WHERE
        cpcs.first = TRUE
    """
    query_data(sql_query, is_save=True, save_path="result.csv")
