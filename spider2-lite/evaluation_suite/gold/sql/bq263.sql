with d as(
    select
        a.order_id, 
        format_date('%Y-%m', a.created_at) as month,
        format_date('%Y', a.created_at) as year,
        b.product_id, b.sale_price, c.category, c.cost
    from bigquery-public-data.thelook_ecommerce.orders as a
    JOIN
        bigquery-public-data.thelook_ecommerce.order_items as b
    on a.order_id = b.order_id
    JOIN bigquery-public-data.thelook_ecommerce.products as c
    on b.order_id = c.id
    where a.status = 'Complete'
    and a.created_at BETWEEN TIMESTAMP('2023-01-01') AND TIMESTAMP('2023-12-31')
    and c.category = 'Sleep & Lounge'
),

e as (
    select month, year, sale_price, category, cost,
        sum(sale_price) over(partition by month, category) as TPV,
        sum(cost) over(partition by month, category) as total_cost,
        count(distinct order_id) over(partition by month, category) as TPO,
        sum(sale_price-cost) over(partition by month, category) as total_profit,
        sum((sale_price-cost)/cost) over(partition by month, category) as Profit_to_cost_ratio
    from d
)

select distinct month, category, TPV, total_cost, TPO, total_profit, Profit_to_cost_ratio
from e
order by month