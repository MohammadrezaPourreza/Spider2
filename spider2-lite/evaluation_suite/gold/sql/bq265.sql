WITH
  main AS (
  SELECT
    id AS user_id,
    email,
    gender,
    country,
    traffic_source
  FROM
    `bigquery-public-data.thelook_ecommerce.users` 
  WHERE
    created_at BETWEEN '2019-01-01' AND '2019-12-31'),

  daate AS (
  SELECT
    user_id,
    order_id,
    EXTRACT (date
    FROM
      created_at) AS order_date,
    num_of_item
  FROM
    `bigquery-public-data.thelook_ecommerce.orders` 
  WHERE
    created_at BETWEEN '2019-01-01' AND '2019-12-31' ),

  orders AS (
  SELECT
    user_id,
    order_id,
    product_id,
    sale_price,
    status
  FROM
    `bigquery-public-data.thelook_ecommerce.order_items` 
  WHERE 
    created_at BETWEEN '2019-01-01' AND '2019-12-31' ),

  nest AS (
  SELECT
    o.user_id,
    o.order_id,
    o.product_id,
    d.order_date,
    d.num_of_item,
    ROUND(o.sale_price,2)AS sale_price,
    ROUND(d.num_of_item*o.sale_price,2) AS total_sale,
  FROM
    orders o
  INNER JOIN
    daate d
  ON
    o.order_id = d.order_id
  ORDER BY
    o.user_id ),

  type AS (
  SELECT
    user_id,
    MIN(nest.order_date) AS cohort_date,
    MAX(nest.order_date) AS latest_shopping_date,
    DATE_DIFF(MAX(nest.order_date),MIN(nest.order_date),month) AS lifespan_months,
    ROUND(SUM(total_sale),2) AS ltv,
    COUNT(order_id) AS no_of_order
  FROM
    nest
  GROUP BY
    user_id ),

  kite AS (
  SELECT
    m.user_id,
    m.email,
    m.gender,
    m.country,
    m.traffic_source,
    extract(year from n.cohort_date) as cohort_year,
    n.latest_shopping_date,
    n.lifespan_months,
    n.ltv,
    n.no_of_order,
    ROUND(n.ltv/n.no_of_order, 2) as avg_order_value
  FROM
    main m
  INNER JOIN
    type n
  ON
    m.user_id = n.user_id )

SELECT
  email
FROM
  kite
ORDER BY avg_order_value DESC
LIMIT 10