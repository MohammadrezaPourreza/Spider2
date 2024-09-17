WITH ttl_rep_rgn AS (
    SELECT 
        MAX(total_usd) total_usd,
        region,
        rep
    FROM (
        SELECT 
            r.name region,
            s.name rep,
            SUM(o.total_amt_usd) total_usd
        FROM accounts a
        JOIN orders o ON a.id = o.account_id
        JOIN sales_reps s ON a.sales_rep_id = s.id
        JOIN region r ON s.region_id = r.id
        GROUP BY r.name, s.name
    ) x
    GROUP BY region
)
SELECT 
    region,
    rep
FROM ttl_rep_rgn
ORDER BY total_usd DESC;