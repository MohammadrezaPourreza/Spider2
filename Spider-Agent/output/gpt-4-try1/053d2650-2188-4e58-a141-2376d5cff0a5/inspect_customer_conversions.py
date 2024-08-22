import duckdb

# Connect to the database
conn = duckdb.connect('playbook.duckdb')

# Print the column names of the 'customer_conversions' table
print(conn.execute("PRAGMA table_info(customer_conversions);").fetchall())
