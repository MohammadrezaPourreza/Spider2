import duckdb

# Connect to the database
conn = duckdb.connect('playbook.duckdb')

# Print the column names of the 'sessions' table
print(conn.execute("PRAGMA table_info(sessions);").fetchall())
