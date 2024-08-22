WITH total AS (
    SELECT 
        name, COUNT(*) AS count
    FROM
        solution
    GROUP BY name
),
step_counts AS (
    SELECT 
        A.name,
        SUM(CASE WHEN A.step = 1 AND A.max_test_score < B.stack_score THEN 1 ELSE 0 END) AS count_step_1,
        SUM(CASE WHEN A.step = 2 AND A.max_test_score < B.stack_score THEN 1 ELSE 0 END) AS count_step_2,
        SUM(CASE WHEN A.step = 3 AND A.max_test_score < B.stack_score THEN 1 ELSE 0 END) AS count_step_3
    FROM (
        SELECT 
            name, version, step, MAX(test_score) AS max_test_score
        FROM
            model_score
        WHERE
            model NOT IN ('Stack')
        GROUP BY name, version, step
    ) AS A
    INNER JOIN (
        SELECT 
            name, version, step, test_score AS stack_score
        FROM
            model_score
        WHERE
            model = 'Stack'
    ) AS B ON A.name = B.name AND A.version = B.version AND A.step = B.step
    GROUP BY A.name
)
SELECT 
    total.name AS problem
FROM 
    total
INNER JOIN 
    step_counts ON total.name = step_counts.name
WHERE 
    (count_step_1 + count_step_2 + count_step_3) > total.count;