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
  -- Count of unique landing paths
  SELECT
    landing AS path
  FROM
    activity_log_with_landing_exit
  GROUP BY landing
),
exit_count AS (
  -- Count of unique exit paths
  SELECT
    exit AS path
  FROM
    activity_log_with_landing_exit
  GROUP BY exit
),
path_counts AS (
  SELECT 
    'landing' AS type, COUNT(DISTINCT path) AS path_count 
  FROM landing_count
  UNION ALL
  SELECT 
    'exit' AS type, COUNT(DISTINCT path) AS path_count 
  FROM exit_count
)
SELECT type
FROM path_counts
ORDER BY path_count ASC
LIMIT 1;