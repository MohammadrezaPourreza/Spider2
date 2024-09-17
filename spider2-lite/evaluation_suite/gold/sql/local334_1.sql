WITH login_status AS (
  SELECT
    session,
    user_id,
    action,
    CASE
      WHEN COALESCE(user_id, ' ') <> ' ' THEN 'login'
      ELSE 'guest'
    END AS login_status
  FROM action_log
),
action_counts AS (
  SELECT
    action,
    login_status,
    COUNT(*) AS action_count
  FROM login_status
  GROUP BY action, login_status
),
max_min_counts AS (
  SELECT
    MAX(action_count) AS max_action_count,
    MIN(action_count) AS min_action_count
  FROM action_counts
)
SELECT
  max_action_count - min_action_count AS action_count_difference
FROM
  max_min_counts;