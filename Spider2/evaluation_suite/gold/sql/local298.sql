WITH customer_balance AS (
    SELECT *,
           SUM(txn_amount) OVER (PARTITION BY customer_id ORDER BY month_ ASC) AS balance
    FROM (
        SELECT customer_id, 
               strftime('%Y-%m-01', txn_date) AS month_, 
               SUM(txn_group) AS txn_amount 
        FROM (
            SELECT *,
                   CASE 
                     WHEN txn_type = 'deposit' THEN txn_amount
                     ELSE -1 * txn_amount 
                   END AS txn_group
            FROM Customer_Transactions
            ORDER BY customer_id, txn_date
        ) AS update_txn_amount
        GROUP BY customer_id, strftime('%Y-%m-01', txn_date)
    ) AS monthly_totals
),
growth_rates AS (
    SELECT customer_id, 
           month_, 
           balance, 
           previous_month_balance,
           CASE 
             WHEN previous_month_balance < 0 THEN 0 
             ELSE previous_month_balance 
           END AS data_storage
    FROM (
        SELECT *, 
               LAG(balance) OVER (PARTITION BY customer_id ORDER BY month_) AS previous_month_balance
        FROM customer_balance
    ) AS add_previous_month_balance
)
SELECT month_, 
       SUM(data_storage) AS total_data_storage
FROM growth_rates
GROUP BY month_
ORDER BY month_;
