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

    # Complete the SQL query in the sql_query variable to interact with the database, partial SQL query is provided below
    sql_query = """
     SELECT
          t1.publication_number,
          t4.publication_number AS similar_publication_number,
          (SELECT SUM(element1 * element2)
          FROM t5.embedding_v1 element1 WITH OFFSET pos
          JOIN t6.embedding_v1 element2 WITH OFFSET pos USING (pos)) AS similarity
      FROM 
          (SELECT * FROM patents_sample LIMIT 1) t1
      LEFT JOIN (
          SELECT 
              x3.publication_number,
              EXTRACT(YEAR FROM PARSE_DATE('%Y%m%d', CAST(x3.filing_date AS STRING))) AS focal_filing_year
          FROM 
              `patents-public-data.patents.publications` x3
          WHERE 
              x3.filing_date != 0
      ) t3 ON t3.publication_number = t1.publication_number
      LEFT JOIN (
          SELECT 
              x4.publication_number,
              EXTRACT(YEAR FROM PARSE_DATE('%Y%m%d', CAST(x4.filing_date AS STRING))) AS filing_year
          FROM 
              `patents-public-data.patents.publications` x4
          WHERE 
              x4.filing_date != 0
      ) t4 ON
      t4.publication_number != t1.publication_number
      AND t3.focal_filing_year = t4.filing_year
      LEFT JOIN `patents-public-data.google_patents_research.publications` t5 ON t5.publication_number = t1.publication_number
      LEFT JOIN `patents-public-data.google_patents_research.publications` t6 ON t6.publication_number = t4.publication_number
      ORDER BY 
          t1.publication_number, similarity DESC
    """
    query_data(sql_query, is_save=True, save_path="result.csv")