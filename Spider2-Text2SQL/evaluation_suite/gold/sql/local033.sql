with delivery_stats as (
  select
    c.customer_state,
    strftime('%Y', o.order_delivered_customer_date) as Year,
    sum(case when o.order_status != 'delivered' then 1 else 0 end) * 1.0 / count(o.order_status) as Delivery_Failure_Rate
  from
    olist_customers c
    join olist_orders o on o.customer_id = c.customer_id
  group by
    c.customer_state,
    strftime('%Y', o.order_delivered_customer_date)
)

select
  avg(Delivery_Failure_Rate) as Avg_Delivery_Failure_Rate
from
  delivery_stats;