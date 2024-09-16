WITH monthly_order_counts AS (
    SELECT
        strftime('%Y', order_delivered_customer_date) AS Year,
        strftime('%m', order_delivered_customer_date) AS Month,
        COUNT(*) AS MonthlyOrderCount
    FROM olist_orders
    WHERE order_status = 'delivered'
      AND order_delivered_customer_date IS NOT NULL
    GROUP BY Year, Month
),
yearly_order_counts AS (
    SELECT
        Year,
        SUM(MonthlyOrderCount) AS TotalOrderCount
    FROM monthly_order_counts
    WHERE Year IN ('2016', '2017', '2018')
    GROUP BY Year
),
min_order_year AS (
    SELECT
        Year
    FROM yearly_order_counts
    ORDER BY TotalOrderCount ASC
    LIMIT 1
)
SELECT
    MAX(MonthlyOrderCount) AS max_monthly_order_count
FROM monthly_order_counts
WHERE Year = (SELECT Year FROM min_order_year);