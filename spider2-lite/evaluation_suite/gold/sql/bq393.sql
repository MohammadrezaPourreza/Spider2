WITH
  all_months AS (
    SELECT DISTINCT
      timestamp_trunc(timestamp, month) AS month
    FROM
      `bigquery-public-data.hacker_news.full`
    WHERE
      timestamp <= '2024-09-10'  -- Date limit added
  ),
  
  active_months AS (
    SELECT DISTINCT
      `by` AS userid,
      timestamp_trunc(timestamp, month) AS month
    FROM
      `bigquery-public-data.hacker_news.full`
    WHERE
      timestamp <= '2024-09-10'  -- Date limit added
  ),
  
  users AS (
    SELECT
      `by` AS userid,
      MIN(timestamp_trunc(timestamp, month)) AS first_month,
      MAX(timestamp_trunc(timestamp, month)) AS last_month
    FROM
      `bigquery-public-data.hacker_news.full`
    WHERE
      timestamp <= '2024-09-10'  -- Date limit added
    GROUP BY
      userid
  ),
  
  user_activity AS (
    SELECT
      u.userid,
      m.month,
      CAST(u.first_month AS STRING) AS cohort_month_str,
      DATE_DIFF(DATE(m.month), DATE(u.first_month), MONTH) AS month_number,
      IF(m.month <= u.last_month, 1.0, 0.0) AS unbounded_active,
      IF(a.month IS NOT NULL, 1.0, 0.0) AS active
    FROM
      users AS u
    CROSS JOIN
      all_months AS m
    LEFT JOIN
      active_months AS a
    ON
      a.userid = u.userid AND a.month = m.month
    WHERE
      m.month >= u.first_month
      AND m.month <= '2024-09-10'  -- Date limit added
  ),
  
  unbounded_active_users AS (
    SELECT
      userid,
      month_number
    FROM
      user_activity
    WHERE
      unbounded_active = 1.0
      AND active = 0.0
  ),
  
  max_month_number AS (
    SELECT
      MAX(month_number) AS max_month_number
    FROM
      unbounded_active_users
  )

SELECT
  u.userid,
  u.month_number
FROM
  unbounded_active_users AS u
JOIN
  max_month_number AS m
ON
  u.month_number = m.max_month_number;