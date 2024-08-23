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
most_frequent_action AS (
  SELECT
    login_status,
    action,
    action_count,
    ROW_NUMBER() OVER (PARTITION BY login_status ORDER BY action_count DESC) AS rank
  FROM action_counts
)
SELECT
  action_count
FROM
  most_frequent_action
WHERE
  rank = 1;