import pandas as pd
import snowflake.connector


snowflake_credential= {
    "user": "pourreza",
    "password": "Sefteghoot@1378",
    "account": "RSRSBDK-YDB67606",
    "warehouse": "COMPUTE_WH_PARTICIPANT"
}


def get_snowflake_sql_result(sql_query, database_id):
    """
    is_save = True, output a 'result.csv'
    if_save = False, output a string
    """
    conn = snowflake.connector.connect(
        database=database_id,
        **snowflake_credential
    )
    cursor = conn.cursor()
    
    try:
        cursor.execute(sql_query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        df = pd.DataFrame(results, columns=columns)
        if df.empty:
            print("No data found for the specified query.")
        # return markdown_table(df)
        return True, df.to_markdown()
    except Exception as e:
        print("Error occurred while fetching data: ", e)  
        return False, str(e)