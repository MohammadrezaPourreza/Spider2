WITH activity_log_with_landing_exit AS (
  SELECT
    session,
    path,
    stamp,
    FIRST_VALUE(path) OVER (
      PARTITION BY session
      ORDER BY stamp ASC
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS landing,
    LAST_VALUE(path) OVER (
      PARTITION BY session
      ORDER BY stamp ASC
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS exit
  FROM activity_log
),
landing_count AS (
  SELECT
    landing AS path,
    COUNT(DISTINCT session) AS count
  FROM
    activity_log_with_landing_exit
  GROUP BY landing
),
exit_count AS (
  SELECT
    exit AS path,
    COUNT(DISTINCT session) AS count
  FROM
    activity_log_with_landing_exit
  GROUP BY exit
),
combined_counts AS (
  SELECT path, SUM(count) AS total_count
  FROM (
    SELECT path, count FROM landing_count
    UNION ALL
    SELECT path, count FROM exit_count
  ) AS combined
  GROUP BY path
)
SELECT path
FROM combined_counts
ORDER BY total_count DESC
LIMIT 1;