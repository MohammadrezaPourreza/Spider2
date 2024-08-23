WITH customer_balance AS (
    SELECT *,
           SUM(txn_amount) OVER (PARTITION BY customer_id ORDER BY month_ ASC) AS balance
    FROM (
        SELECT customer_id, strftime('%Y-%m-01', txn_date) AS month_, SUM(txn_group) AS txn_amount 
        FROM (
            SELECT *,
                   CASE WHEN txn_type = 'deposit' THEN txn_amount
                        ELSE -1 * txn_amount END AS txn_group
            FROM Customer_Transactions
            ORDER BY customer_id, txn_date
        ) AS update_txn_amount
        GROUP BY customer_id, strftime('%Y-%m-01', txn_date)
    ) AS monthly_totals
),
growth_rates AS (
    SELECT customer_id, month_, balance, previous_month_balance, 
           CASE WHEN previous_month_balance IS NULL THEN NULL
                WHEN previous_month_balance = 0 THEN balance * 100
                ELSE ROUND(((balance - previous_month_balance) * 1.0 / ABS(previous_month_balance)) * 100, 1) END AS growth_rate,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY month_ DESC) AS balance_index
    FROM (
        SELECT *,
               LAG(balance) OVER (PARTITION BY customer_id ORDER BY month_) AS previous_month_balance
        FROM customer_balance
    ) AS add_previous_month_balance
),
cust_last_balance AS (
    SELECT customer_id, month_, growth_rate,
           CASE WHEN growth_rate > 5 THEN 1 ELSE 0 END AS growth_rate_check 
    FROM growth_rates
    WHERE balance_index = 1
)
SELECT ROUND((SUM(growth_rate_check) * 1.0 / COUNT(*) * 100), 2) || '%' AS percentage_growth_check
FROM cust_last_balance;
