import duckdb

# Connect to the database
conn = duckdb.connect('playbook.duckdb')

# Get a list of all tables in the database
tables = conn.execute("SELECT name FROM sqlite_master WHERE type='table';").fetchall()

# Print the table names
for table in tables:
    print(table[0])
