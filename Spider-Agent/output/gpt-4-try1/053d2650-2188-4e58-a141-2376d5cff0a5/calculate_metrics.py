import duckdb

# Connect to the database
conn = duckdb.connect('playbook.duckdb')

# Join the tables and calculate the metrics
query = """
SELECT 
    s.utm_source,
    SUM(a.spend) AS total_spend,
    COUNT(c.customer_id) AS total_conversions,
    AVG(c.revenue) AS avg_conversion_value
FROM sessions s
LEFT JOIN customer_conversions c ON s.customer_id = c.customer_id
LEFT JOIN ad_spend a ON s.utm_source = a.utm_source AND s.utm_campaign = a.utm_campaign
GROUP BY s.utm_source;
"""

# Execute the query and fetch the results
results = conn.execute(query).fetchall()

# Print the results
for row in results:
    print(row)
