import pandas as pd
import snowflake.connector
import os
import re


snowflake_credential= {
    "user": "pourreza",
    "password": "Sefteghoot@1378",
    "account": "RSRSBDK-YDB67606",
    "warehouse": "COMPUTE_WH_PARTICIPANT"
}

RESULTS_CACHE = {}
QUERY_TIMEOUT = 60
DB_CONNECTIONS = {}

def get_snowflake_db_connection(database_id):
    if database_id in DB_CONNECTIONS:
        return DB_CONNECTIONS[database_id]
    try:
        conn = snowflake.connector.connect(
        database=database_id,
        **snowflake_credential
        )
        DB_CONNECTIONS[database_id] = conn
        return conn
    except Exception as e:
        print("Error occurred while fetching data: ", e) 
        return None


# def get_snowflake_sql_result(sql_query, database_id):
#     """
#     is_save = True, output a 'result.csv'
#     if_save = False, output a string
#     """
#     if sql_query in RESULTS_CACHE:
#         return RESULTS_CACHE[sql_query]
#     try:
#         conn = snowflake.connector.connect(
#         database=database_id,
#         **snowflake_credential
#         )
#         cursor = conn.cursor()
#         cursor.execute(sql_query)
#         results = cursor.fetchall()
#         columns = [desc[0] for desc in cursor.description]
#         df = pd.DataFrame(results, columns=columns)
#         if df.empty:
#             print("No data found for the specified query.")
#         # return markdown_table(df)
#         RESULTS_CACHE[sql_query] = (True, df)
#         return True, df
#     except Exception as e:
#         print("Error occurred while fetching data: ", e) 
#         RESULTS_CACHE[sql_query] = (False, str(e)) 
#         return False, str(e)
    
def get_snowflake_sql_result(sql_query, database_id, is_save=False, save_dir=None, file_name="result.csv"):
    """
    is_save = True, output a 'result.csv'
    if_save = False, output a string
    """
    conn = get_snowflake_db_connection(database_id)
    cursor = conn.cursor()
    
    try:
        cursor.execute(sql_query, timeout=QUERY_TIMEOUT)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        df = pd.DataFrame(results, columns=columns)
        if is_save:
            df.to_csv(os.path.join(save_dir, file_name), index=False)
        if df.empty:
            return {"status": False,
                    "message": "No data found for the specified query.",
                    "data": pd.DataFrame()}
        else:
            return {"status": True,
                    "message": "Data fetched successfully.",
                    "data": df}
    except Exception as e:
        # print(f"Error occurred while fetching data for {database_id}\n" 
        #       f"```sql\n{sql_query}\n```: ", e)  
        return {"status": False,
                "message": f"Error: {e}",
                "data": pd.DataFrame()}
    
def dump_sql_execution_results(sql_query, database_id, save_dir=None, file_name="result.csv"):
    """
    is_save = True, output a 'result.csv'
    if_save = False, output a string
    """
    try:
        conn = get_snowflake_db_connection(database_id)
        cursor = conn.cursor()
        cursor.execute(sql_query, timeout=QUERY_TIMEOUT)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        df = pd.DataFrame(results, columns=columns)
        if df.empty:
            print("No data found for the specified query.")
            df.to_csv(os.path.join(save_dir, file_name), index=False)
            return None, None
        else:
            df.to_csv(os.path.join(save_dir, file_name), index=False)
            return None, None
    except Exception as e:
        print(f"Error occurred while fetching data for {file_name}: ", e)  
        return False, str(e)