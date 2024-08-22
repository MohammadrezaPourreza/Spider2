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
WITH EventData AS (
    SELECT 
        user_pseudo_id, 
        event_timestamp, 
        param
    FROM 
        `firebase-public-project.analytics_153293282.events_20180915`,
        UNNEST(event_params) AS param
    WHERE 
        event_name = "level_complete_quickplay"
        AND (param.key = "value" OR param.key = "board")
),
ProcessedData AS (
    SELECT 
        user_pseudo_id, 
        event_timestamp, 
        MAX(IF(param.key = "value", param.value.int_value, NULL)) AS score,
        MAX(IF(param.key = "board", param.value.string_value, NULL)) AS board_type
    FROM 
        EventData
    GROUP BY 
        user_pseudo_id, 
        event_timestamp
),
AverageScores AS (
    SELECT 
        board_type, 
        AVG(score) AS average_score
    FROM 
        ProcessedData
    GROUP BY 
        board_type
)
SELECT * FROM AverageScores
    """
    query_data(sql_query, is_save=True)
