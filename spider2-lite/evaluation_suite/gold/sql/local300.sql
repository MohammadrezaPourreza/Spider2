WITH RECURSIVE customer_date_series AS (
    SELECT customer_id, MIN(txn_date) AS date_series, MAX(txn_date) AS last_date
    FROM customer_transactions
    GROUP BY customer_id
    UNION ALL
    SELECT customer_id, date(date_series, '+1 day') AS date_series, last_date
    FROM customer_date_series
    WHERE date(date_series, '+1 day') <= last_date
),
customer_txn AS (
    SELECT *,
           CASE WHEN txn_type = 'deposit' THEN txn_amount
                ELSE -1 * txn_amount END AS txn_group
    FROM customer_transactions
),
customer_balance AS (
    SELECT s.customer_id, s.date_series, COALESCE(b.txn_group, 0) AS txn_group,
           SUM(COALESCE(b.txn_group, 0)) OVER (PARTITION BY s.customer_id ORDER BY s.date_series) AS balance
    FROM customer_date_series s
    LEFT JOIN customer_txn b ON s.customer_id = b.customer_id AND s.date_series = b.txn_date
    ORDER BY s.customer_id, s.date_series
),
customer_data AS (
    SELECT customer_id, date_series,
           CASE WHEN balance < 0 THEN 0
                ELSE balance END AS data_storage
    FROM customer_balance
)
SELECT month, ROUND(SUM(data_allocation), 1) AS total_allocation
FROM (
    SELECT customer_id,
           strftime('%Y-%m', date_series) AS month,
           MAX(data_storage) AS data_allocation
    FROM customer_data
    GROUP BY customer_id, strftime('%Y-%m', date_series)
) AS tmp
GROUP BY month
ORDER BY month;
