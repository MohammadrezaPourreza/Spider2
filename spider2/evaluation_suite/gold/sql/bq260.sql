WITH filtered_users AS (
    SELECT 
        first_name, 
        last_name, 
        gender, 
        age,
        created_at
    FROM 
        bigquery-public-data.thelook_ecommerce.users
    WHERE 
        created_at BETWEEN '2019-01-01' AND '2022-04-30'
),
youngest_ages AS (
    SELECT 
        gender, 
        MIN(age) AS age
    FROM 
        filtered_users
    GROUP BY 
        gender
),
oldest_ages AS (
    SELECT 
        gender, 
        MAX(age) AS age
    FROM 
        filtered_users
    GROUP BY 
        gender
),
youngest_oldest AS (
    SELECT 
        u.first_name, 
        u.last_name, 
        u.gender, 
        u.age, 
        'youngest' AS tag
    FROM 
        filtered_users u
    JOIN 
        youngest_ages y
    ON 
        u.gender = y.gender AND u.age = y.age
    UNION ALL
    SELECT 
        u.first_name, 
        u.last_name, 
        u.gender, 
        u.age, 
        'oldest' AS tag
    FROM 
        filtered_users u
    JOIN 
        oldest_ages o
    ON 
        u.gender = o.gender AND u.age = o.age
)
SELECT COUNT(*) AS num 
FROM youngest_oldest
GROUP BY tag, gender
