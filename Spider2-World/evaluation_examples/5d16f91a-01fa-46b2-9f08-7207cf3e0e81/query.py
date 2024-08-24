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
CREATE TEMPORARY FUNCTION highest_moving_avg(yearcnt ARRAY<STRUCT<filing_year INT64, cnt INT64>>)
RETURNS STRUCT<filing_year INT64, avg INT64>
LANGUAGE js AS \"\"\"
    let a = 0.2;
    let avg = yearcnt.length > 0 ? yearcnt[0].cnt : 0;
    let highest = {filing_year: -1, avg: -1};
    for (let x of yearcnt) {
        avg = a * x.cnt + (1 - a) * avg;
        if (avg > highest.avg) {
                highest = {filing_year: x.filing_year, avg: avg};
        }
    }
    return highest;
\"\"\";
    
WITH patent_cpcs AS (
    SELECT
        cd.parents,
        CAST(FLOOR(filing_date/10000) AS INT64) AS filing_year
    FROM (
        SELECT
            ANY_VALUE(cpc) AS cpc,
            ANY_VALUE(filing_date) AS filing_date
        FROM
            `patents-public-data.patents.publications`
        WHERE 
            application_number != ""
        GROUP BY
            application_number
        ), UNNEST(cpc) AS cpcs
    JOIN
        `patents-public-data.cpc.definition` cd
    ON cd.symbol = cpcs.code
    WHERE
        cpcs.first = TRUE
        AND filing_date > 0
)
    """
    query_data(sql_query, is_save=True, save_path="result.csv")
