WITH RECURSIVE generate_series AS (
    SELECT 0 AS value
    UNION ALL
    SELECT value + 1
    FROM generate_series
    WHERE value < 3
),
closing_balance AS (
    SELECT
        customer_id,
        strftime('%Y-%m', DATE(txn_date, 'start of month')) AS txn_month,
        SUM(
            CASE
                WHEN txn_type = 'deposit' THEN txn_amount
                ELSE -txn_amount
            END
        ) AS transaction_amount
    FROM
        customer_transactions
    GROUP BY
        customer_id,
        txn_month
    ORDER BY
        customer_id
),
generate_months_cte AS (
    SELECT DISTINCT
        customer_id,
        strftime('%Y-%m', DATE('2020-01-01', '+' || value || ' month')) AS generated_month
    FROM
        customer_transactions, generate_series
)
SELECT 
    t1.customer_id,
    t1.generated_month,
    COALESCE(t2.transaction_amount, 0) AS balance_activity,
    SUM(COALESCE(t2.transaction_amount, 0)) OVER (
        PARTITION BY t1.customer_id
        ORDER BY t1.generated_month
    ) AS month_end_balance
FROM
    generate_months_cte AS t1
LEFT JOIN 
    closing_balance AS t2
ON
    t1.generated_month = t2.txn_month
AND
    t1.customer_id = t2.customer_id;