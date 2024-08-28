with youngest as (SELECT
        gender, id,
        first_name,
        last_name,
        age,
        'youngest' AS tag,
  FROM `bigquery-public-data.thelook_ecommerce.users`
  WHERE age = (SELECT MIN(age) FROM `bigquery-public-data.thelook_ecommerce.users`)
        AND (created_at BETWEEN '2019-01-01' AND '2022-04-30')
  GROUP BY gender, id, first_name, last_name, age
  order by gender),

  oldest as (SELECT
        gender, id,
        first_name,
        last_name,
        age,
        'oldest' AS tag
  FROM `bigquery-public-data.thelook_ecommerce.users`
  WHERE age = (SELECT MAX(age) FROM `bigquery-public-data.thelook_ecommerce.users`)
        AND (created_at BETWEEN '2019-01-01' AND '2022-04-30')
  GROUP BY gender, id, first_name, last_name, age
  order by gender),

  TEMP_record as (
  select *
  from youngest 
  union all 
  select *
  from oldest)
 
select 
      sum( CASE
        WHEN age = (SELECT MAX(age) FROM `bigquery-public-data.thelook_ecommerce.users`) THEN 1
      END)- sum( CASE
        WHEN age = (SELECT MIN(age) FROM `bigquery-public-data.thelook_ecommerce.users`) THEN 1
      END) as diff
 from TEMP_record