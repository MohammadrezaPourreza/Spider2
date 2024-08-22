import duckdb

# Connect to the database
conn = duckdb.connect('playbook.duckdb')

# Print the column names of the 'ad_spend' table
print(conn.execute("PRAGMA table_info(ad_spend);").fetchall())
