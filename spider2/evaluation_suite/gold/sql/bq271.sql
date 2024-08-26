WITH
orders_x_order_items AS (
  SELECT orders.*,
         order_items.inventory_item_id,
         order_items.sale_price
  FROM `bigquery-public-data.thelook_ecommerce.orders` AS orders
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
  ON orders.order_id = order_items.order_id
  WHERE orders.created_at BETWEEN '2021-01-01' AND '2021-12-31'
),

orders_x_inventory AS (
  SELECT orders_x_order_items.*,
         inventory_items.product_category,
         inventory_items.product_department,
         inventory_items.product_retail_price,
         inventory_items.product_distribution_center_id,
         inventory_items.cost,
         distribution_centers.name
  FROM orders_x_order_items
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.inventory_items` AS inventory_items
  ON orders_x_order_items.inventory_item_id = inventory_items.id
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.distribution_centers` AS distribution_centers
  ON inventory_items.product_distribution_center_id = distribution_centers.id
  WHERE inventory_items.created_at BETWEEN '2021-01-01' AND '2021-12-31'
),

orders_x_users AS (
  SELECT orders_x_inventory.*,
         users.country AS users_country,
  FROM orders_x_inventory 
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.users` AS users
  ON orders_x_inventory.user_id = users.id
  WHERE users.created_at BETWEEN '2021-01-01' AND '2021-12-31'
),

monthly_order_product_category AS (
  SELECT DATE_TRUNC(DATE(created_at),MONTH) AS reporting_month,
         users_country,
         product_department,
         product_category,
         COUNT(DISTINCT order_id) AS n_order,
         COUNT(DISTINCT user_id) AS n_purchasers,
         SUM(product_retail_price) AS total_product_retail_price,
         SUM(cost) AS total_cost
  FROM orders_x_users
  GROUP BY 1,2,3,4
  ORDER BY 1,2,3,4
)

SELECT users_country, total_product_retail_price - total_cost AS profit
FROM monthly_order_product_category
ORDER BY profit DESC
LIMIT 1;