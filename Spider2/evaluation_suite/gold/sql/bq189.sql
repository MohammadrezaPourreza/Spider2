WITH 
monthly_summary AS (
  SELECT 
    FORMAT_DATE('%m', oi.delivered_at) AS Month,
    FORMAT_DATE('%Y', oi.delivered_at) AS Year,
    p.category AS Product_category,
    SUM(oi.sale_price) AS TPV,
    COUNT(DISTINCT oi.order_id) AS TPO
  FROM 
    `bigquery-public-data.thelook_ecommerce.order_items` oi
  JOIN 
    `bigquery-public-data.thelook_ecommerce.products` p ON oi.product_id = p.id
  JOIN 
    `bigquery-public-data.thelook_ecommerce.orders` o ON oi.order_id = o.order_id
  WHERE
    oi.status = 'Complete'
  GROUP BY
    Month, Year, Product_category
  ORDER BY 
    Year, Month
),

lagged_summary AS (
  SELECT 
    month,
    year,
    Product_category,
    TPV,
    TPO,
    LAG(TPV) OVER(PARTITION BY Product_category ORDER BY year, month) AS Lagged_TPV,
    LAG(TPO) OVER(PARTITION BY Product_category ORDER BY year, month) AS Lagged_TPO
  FROM 
    monthly_summary
),

growth_summary AS (
  SELECT 
    month,
    year,
    Product_category,
    TPV,
    TPO,
    Lagged_TPV,
    Lagged_TPO,
    ROUND((TPV - Lagged_TPV) / NULLIF(Lagged_TPV, 0) * 100, 2) AS Revenue_growth,
    ROUND((TPO - Lagged_TPO) / NULLIF(Lagged_TPO, 0) * 100, 2) AS Order_growth
  FROM 
    lagged_summary
),

max_order_growth AS (
  SELECT 
    Product_category,
    AVG(Order_growth) AS avg_order_growth
  FROM 
    growth_summary
  GROUP BY 
    Product_category
  ORDER BY 
    avg_order_growth DESC
  LIMIT 1
)

SELECT 
  AVG(gs.Revenue_growth) AS average_revenue_growth
FROM 
  growth_summary gs
JOIN 
  max_order_growth mog ON gs.Product_category = mog.Product_category;