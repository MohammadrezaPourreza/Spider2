
WITH first_orders AS (
  SELECT
    o.order_id,
    o.user_id,
    ROW_NUMBER() OVER (PARTITION BY o.user_id ORDER BY o.created_at ASC) order_sequence
  FROM
    `bigquery-public-data.thelook_ecommerce.orders` o
  WHERE
    o.status NOT IN ('Cancelled', 'Returned')
  QUALIFY order_sequence = 1
), 
category_stats AS (
  SELECT
    p.category,
    SUM(oi.sale_price) AS revenue,
    COUNT(DISTINCT fo.user_id) AS user_count
  FROM
    first_orders fo
  LEFT JOIN
    `bigquery-public-data.thelook_ecommerce.order_items` oi ON oi.order_id = fo.order_id
  LEFT JOIN
    `bigquery-public-data.thelook_ecommerce.products` p ON p.id = oi.product_id
  GROUP BY
    p.category
),

top_category AS (
  SELECT
    category
  FROM
    category_stats
  ORDER BY
    user_count DESC
  LIMIT 1
)

SELECT
  c.revenue
FROM
  category_stats c
JOIN
  top_category t ON c.category = t.category;