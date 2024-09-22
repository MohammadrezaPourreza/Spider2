WITH
  main AS (
    SELECT
      browser,
      user_id,
      session_id,
      DATE_DIFF(MAX(created_at), MIN(created_at), SECOND) AS user_duration
    FROM
      bigquery-public-data.thelook_ecommerce.events
    GROUP BY
      user_id,
      session_id,
      browser
  ),
  
  browser_stats AS (
    SELECT
      browser,
      AVG(user_duration) AS avg_user_duration,
      COUNT(session_id) AS total_sessions
    FROM
      main
    GROUP BY
      browser
    HAVING
      COUNT(session_id) > 10
  )

SELECT
  browser,
  avg_user_duration
FROM
  browser_stats
ORDER BY
  avg_user_duration ASC
LIMIT 3;