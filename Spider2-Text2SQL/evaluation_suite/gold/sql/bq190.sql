WITH 
female_age AS (
  SELECT 
    MIN(age) AS min_age, 
    MAX(age) AS max_age
  FROM 
    `bigquery-public-data.thelook_ecommerce.users`
  WHERE 
    gender = 'F' 
    AND created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
),
male_age AS (
  SELECT 
    MIN(age) AS min_age, 
    MAX(age) AS max_age
  FROM 
    `bigquery-public-data.thelook_ecommerce.users`
  WHERE 
    gender = 'M' 
    AND created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
),
young_old_group AS (
  SELECT t1.first_name, t1.last_name, t1.gender, t1.age
  FROM `bigquery-public-data.thelook_ecommerce.users` AS t1
  JOIN female_age AS t2 ON t1.age = t2.min_age OR t1.age = t2.max_age
  WHERE t1.gender = 'F' AND t1.created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
  UNION ALL
  SELECT t3.first_name, t3.last_name, t3.gender, t3.age
  FROM `bigquery-public-data.thelook_ecommerce.users` AS t3
  JOIN male_age AS t4 ON t3.age = t4.min_age OR t3.age = t4.max_age
  WHERE t3.gender = 'M' AND t3.created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
),
age_tag AS (
  SELECT *, 
    CASE 
      WHEN age IN (SELECT MIN(age) 
                   FROM `bigquery-public-data.thelook_ecommerce.users`
                   WHERE gender = 'F' AND created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00') 
           OR age IN (SELECT MIN(age) 
                      FROM `bigquery-public-data.thelook_ecommerce.users`
                      WHERE gender = 'M' AND created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00') 
           THEN 'Youngest'
      ELSE 'Oldest'
    END AS tag
  FROM young_old_group 
),
count_summary AS (
  SELECT 
    gender, 
    tag, 
    COUNT(*) AS user_count
  FROM 
    age_tag
  GROUP BY 
    gender, tag
)
SELECT 
  gender, 
  tag, 
  user_count
FROM 
  count_summary
ORDER BY 
  gender, tag;