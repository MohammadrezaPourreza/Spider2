with 
orders as (
  select
    order_id, 
    user_id, 
    created_at,
    date_trunc(delivered_at, MONTH) as delivery_month,
    status 
  from bigquery-public-data.thelook_ecommerce.orders 
),

order_items as (
  select 
    order_id, 
    product_id, 
    sale_price 
  from bigquery-public-data.thelook_ecommerce.order_items 
),

products as (
  select 
    id, 
    cost
  from bigquery-public-data.thelook_ecommerce.products
),

users as (
  select
    id, 
    traffic_source 
  from bigquery-public-data.thelook_ecommerce.users 
),

filter_join as (
  select 
    orders.order_id,
    orders.user_id,
    order_items.product_id,
    orders.delivery_month,
    orders.status,
    order_items.sale_price,
    products.cost,
    users.traffic_source
  from orders
  join order_items on orders.order_id = order_items.order_id
  join products on order_items.product_id = products.id
  join users on orders.user_id = users.id
  where orders.status = 'Complete' 
      and users.traffic_source = 'Facebook'
      and orders.created_at between '2022-01-01' and '2023-06-30'
),

monthly_sales as (
 select 
    delivery_month,
    traffic_source,
    sum(sale_price) as total_revenue,
    sum(sale_price) - sum(cost) as total_profit,
    count(distinct product_id) as product_quantity,
    count(distinct order_id) as orders_quantity,
    count(distinct user_id) as users_quantity
  from filter_join
  group by delivery_month, traffic_source
)
select 
  monthly_sales.delivery_month,
  monthly_sales.total_profit - lag(monthly_sales.total_profit, 1) over(partition by monthly_sales.traffic_source order by monthly_sales.delivery_month) 
    as profit_vs_prior_month
from monthly_sales
order by profit_vs_prior_month DESC
limit 5;
