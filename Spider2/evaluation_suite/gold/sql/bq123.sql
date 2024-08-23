WITH question_answer_stats AS (
  SELECT
    EXTRACT(DAYOFWEEK FROM q.creation_date) AS question_day,
    COUNT(DISTINCT a.id) AS count_answers,
    COUNT(DISTINCT q.id) AS count_questions,
    ROUND(COUNT(DISTINCT a.id) * 1.0 / COUNT(DISTINCT q.id) * 100, 2) AS percent_questions
  FROM 
    `bigquery-public-data.stackoverflow.posts_questions` q
  LEFT JOIN
    `bigquery-public-data.stackoverflow.posts_answers` a 
  ON 
    q.id = a.parent_id 
    AND a.creation_date < TIMESTAMP_ADD(q.creation_date, INTERVAL 1 HOUR) 
  GROUP BY
    EXTRACT(DAYOFWEEK FROM q.creation_date)
  ORDER BY 
    percent_questions DESC
)

SELECT 
  question_day, 
  percent_questions
FROM 
  question_answer_stats
ORDER BY 
  percent_questions DESC
LIMIT 1 OFFSET 2;