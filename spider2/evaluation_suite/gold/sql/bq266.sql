WITH cte AS (
  SELECT 
    t1.id AS product_id,
    t1.name,
    t1.cost,
    t1.retail_price,
    t2.created_at,
   CONCAT(EXTRACT(YEAR FROM t2.created_at), '-', LPAD(CAST(EXTRACT(MONTH FROM t2.created_at) AS STRING), 2, '0')) AS year_month,
    (t1.retail_price - t1.cost) AS profit
  FROM 
    `bigquery-public-data.thelook_ecommerce.products` AS t1
  LEFT JOIN 
    `bigquery-public-data.thelook_ecommerce.order_items` AS t2
  ON 
    t1.id = t2.product_id
  WHERE
    t2.created_at BETWEEN '2020-01-01' AND '2020-12-31'
),

ranked_cte AS (
  SELECT
    year_month,
    product_id,
    name,
    cost,
    retail_price AS sale,
    profit,
    DENSE_RANK() OVER (PARTITION BY year_month ORDER BY profit asc) AS rank
  FROM 
    cte
)
SELECT
  name
FROM 
  ranked_cte
WHERE 
  rank = 1 and year_month is not null
ORDER BY year_month