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
      WITH
        Params AS (
          SELECT 'Google Navy Speckled Tee' AS selected_product
        ),
        PurchaseEvents AS (
          SELECT
            user_pseudo_id,
            items
          FROM
            `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
          WHERE
            _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
            AND event_name = 'purchase'
        ),
        FilteredEvents AS (
          SELECT
            user_pseudo_id,
            item.item_name AS product_name,
            item.quantity
          FROM
            PurchaseEvents,
            UNNEST(items) AS item
          WHERE
            item.item_name = (SELECT selected_product FROM Params)
        ),
        CoPurchased AS (
          SELECT
            pe.user_pseudo_id,
            item.item_name AS co_purchased_product,
            item.quantity
          FROM
            PurchaseEvents pe,
            UNNEST(pe.items) AS item
          WHERE
            pe.user_pseudo_id IN (SELECT user_pseudo_id FROM FilteredEvents)
            AND item.item_name != (SELECT selected_product FROM Params)
        )
      SELECT
        co_purchased_product,
        SUM(quantity) AS total_quantity
      FROM
        CoPurchased
      GROUP BY
        co_purchased_product
      ORDER BY
        total_quantity DESC
      LIMIT 1
    """
    query_data(sql_query, is_save=True, save_path="result.csv")
