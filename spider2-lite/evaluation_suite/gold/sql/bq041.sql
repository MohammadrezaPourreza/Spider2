DECLARE yr, conversion_window INT64;
SET (yr, conversion_window) = (2021, 30);

WITH users AS (
  SELECT *
  FROM `bigquery-public-data.stackoverflow.users`
  WHERE EXTRACT(YEAR FROM creation_date) = yr
),

users_questions AS (
  SELECT 
    u.display_name, 
    u.id AS user_id, 
    u.creation_date AS signup, 
    COUNT(q.id) AS questions, 
    MIN(q.creation_date) AS first_question
  FROM users u
  LEFT JOIN `bigquery-public-data.stackoverflow.posts_questions` q 
    ON q.owner_user_id = u.id 
    AND DATE_DIFF(q.creation_date, u.creation_date, DAY) <= conversion_window
  GROUP BY 
    u.display_name, 
    u.id, 
    u.creation_date
),

users_questions_answers AS (
  SELECT 
    display_name, 
    user_id, 
    signup, 
    questions, 
    first_question, 
    COUNT(a.id) AS answers_after_question
  FROM users_questions uq
  LEFT JOIN `bigquery-public-data.stackoverflow.posts_answers` a 
    ON a.owner_user_id = uq.user_id 
    AND a.creation_date > uq.first_question
    AND DATE_DIFF(a.creation_date, uq.first_question, DAY) <= conversion_window
  GROUP BY 
    display_name, 
    user_id, 
    signup, 
    questions, 
    first_question
)

SELECT 
  EXTRACT(MONTH FROM signup) AS month,
  COUNT(user_id) AS new_users,
  COUNT(DISTINCT CASE WHEN questions > 0 THEN user_id ELSE NULL END) AS asked,
  ROUND(COUNT(DISTINCT CASE WHEN questions > 0 THEN user_id ELSE NULL END) / COUNT(user_id) * 100, 2) AS pct_asked,
  COUNT(DISTINCT CASE WHEN answers_after_question > 0 THEN user_id ELSE NULL END) AS then_answered,
  ROUND(COUNT(DISTINCT CASE WHEN answers_after_question > 0 THEN user_id ELSE NULL END) / COUNT(user_id) * 100, 2) AS pct_then_answered
FROM users_questions_answers
GROUP BY 
  EXTRACT(MONTH FROM signup)
ORDER BY 
  month ASC;