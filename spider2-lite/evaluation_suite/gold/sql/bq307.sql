SELECT badge_name AS First_Gold_Badge,
       COUNT(1) AS Num_Users,
       ROUND(AVG(tenure_in_days)) AS Avg_Num_Days
FROM
(
  SELECT
    badges.user_id AS user_id,
    badges.name AS badge_name,
    TIMESTAMP_DIFF(badges.date, users.creation_date, DAY) AS tenure_in_days,
    ROW_NUMBER() OVER (PARTITION BY badges.user_id
                       ORDER BY badges.date) AS row_number
  FROM
    `bigquery-public-data.stackoverflow.badges` badges
  JOIN
    `bigquery-public-data.stackoverflow.users` users
  ON badges.user_id = users.id
  WHERE badges.class = 1
)
WHERE row_number = 1
GROUP BY First_Gold_Badge
ORDER BY Num_Users DESC
LIMIT 10;