SELECT User_Tenure,
       COUNT(1) AS Num_Users,
       ROUND(AVG(reputation)) AS Avg_Reputation,
       ROUND(AVG(num_badges)) AS Avg_Num_Badges
FROM (
  SELECT users.id AS user,
         ROUND(TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), ANY_VALUE(users.creation_date), DAY)/365) AS user_tenure,
         ANY_VALUE(users.reputation) AS reputation,
         SUM(IF(badges.user_id IS NULL, 0, 1)) AS num_badges
  FROM `bigquery-public-data.stackoverflow.users` users
  LEFT JOIN `bigquery-public-data.stackoverflow.badges` badges
  ON users.id = badges.user_id
  GROUP BY user
)
GROUP BY User_Tenure
ORDER BY User_Tenure