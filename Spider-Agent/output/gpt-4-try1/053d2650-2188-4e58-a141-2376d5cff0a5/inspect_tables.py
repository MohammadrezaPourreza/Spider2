import duckdb

# Connect to the database
conn = duckdb.connect('playbook.duckdb')

# Get a list of all tables in the database
tables = conn.execute("SELECT name FROM sqlite_master WHERE type='table';").fetchall()

# Function to print the first few rows of a table
def print_table_preview(conn, table_name):
    print(f"Table: {table_name}")
    print(conn.execute(f"SELECT * FROM {table_name} LIMIT 5;").fetchall())
    print("\n")

# Print the first few rows of each table
for table in tables:
    print_table_preview(conn, table[0])
