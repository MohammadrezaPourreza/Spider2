with a as(
  select
    user_id,
    format_date('%Y-%m',first_purchase_date) as cohort_date,
    created_at,
    (extract(year from created_at) - extract(year from first_purchase_date))*12
    + (extract(month from created_at) - extract(month from first_purchase_date)) + 1 as index
  from (
  select
    user_id,
    min(created_at) over(partition by user_id) as first_purchase_date,
    created_at,
    from bigquery-public-data.thelook_ecommerce.order_items
    where created_at < TIMESTAMP "2024-01-01 00:00:00 UTC"
  ) b
),

xxx as (
  select 
        cohort_date,
        index,
        count(distinct user_id) as total_user,
  from a 
  group by cohort_date, index
), 

user_cohort as(
select
  cohort_date,
  sum(case when index=1 then total_user else 0 end) as index_0,
  sum(case when index=2 then total_user else 0 end) as index_1,
  sum(case when index=3 then total_user else 0 end) as index_2,
  sum(case when index=4 then total_user else 0 end) as index_3,
from xxx
group by cohort_date
order by cohort_date)

select cohort_date,
100.00 * index_1 / index_0 as First,
100.00 * index_2 / index_0 as Second,
100.00 * index_3 / index_0 as Third,
from user_cohort