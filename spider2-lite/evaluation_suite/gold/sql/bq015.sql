SELECT 
    tag, 
    SUM(c) AS c 
FROM (
    SELECT 
        CONCAT('stackoverflow.com/questions/', CAST(b.id AS STRING)) AS url,
        title, 
        c, 
        answer_count, 
        favorite_count, 
        view_count, 
        score, 
        SPLIT(tags, '|') AS tags 
    FROM 
        `bigquery-public-data.stackoverflow.posts_questions` AS a 
    JOIN (
        SELECT 
            CAST(REGEXP_EXTRACT(text, r'stackoverflow.com/questions/([0-9]+)/') AS INT64) AS id,
            COUNT(*) AS c 
        FROM 
            `fh-bigquery.hackernews.comments` 
        WHERE 
            text LIKE '%stackoverflow.com/questions/%' 
            AND EXTRACT(YEAR FROM time_ts) >= 2014 
        GROUP BY 
            1 
        ORDER BY 
            2 DESC
    ) AS b ON a.id = b.id
), UNNEST(tags) AS tag 
GROUP BY 
    1 
ORDER BY 
    2 DESC 
LIMIT 10