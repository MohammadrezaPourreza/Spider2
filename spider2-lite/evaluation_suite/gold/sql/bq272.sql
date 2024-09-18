WITH product_profit AS (
  SELECT
    DATE(DATE_TRUNC(oi.created_at, month)) AS month,
    oi.product_id,
    p.name,
    p.category,
    ROUND(SUM(oi.sale_price), 2) AS sum_sales,
    ROUND(SUM(p.cost),2) AS sum_cost,
    ROUND(SUM(oi.sale_price)-SUM(p.cost),2) AS profit
  FROM
    `bigquery-public-data.thelook_ecommerce.order_items` oi
    LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p ON oi.product_id = p.id
  WHERE
    DATE(oi.created_at) BETWEEN '2019-01-01' AND '2022-09-30'
    AND oi.status NOT IN ('Cancelled', 'Returned')
  GROUP BY
    month,
    product_id,
    name,
    category
), 

profit_rank AS (
  SELECT
  month,
  product_id,
  name,
  category,
  sum_sales,
  sum_cost,
  profit,
  RANK() OVER(PARTITION BY month ORDER BY profit DESC) AS profit_rank_per_month
FROM 
  product_profit
QUALIFY
  profit_rank_per_month <= 3
ORDER BY 
  month,
  profit DESC
)

SELECT name
FROM profit_rank
