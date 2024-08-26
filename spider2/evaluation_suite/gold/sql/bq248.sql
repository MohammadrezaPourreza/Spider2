WITH requests AS (
    SELECT 
        D.id,
        D.content,
        E.repo_name,
        E.path
    FROM 
        (
            SELECT 
                id,
                content
            FROM 
                `bigquery-public-data.github_repos.sample_contents`
            GROUP BY 
                id,
                content
        ) AS D
        INNER JOIN 
        (
            SELECT 
                C.id,
                C.repo_name,
                C.path
            FROM 
                (
                    SELECT 
                        id,
                        repo_name,
                        path
                    FROM 
                        `bigquery-public-data.github_repos.sample_files`
                    WHERE 
                        LOWER(path) LIKE '%requirements.txt'
                    GROUP BY 
                        path,
                        id,
                        repo_name
                ) AS C
            INNER JOIN 
                (
                    SELECT 
                        repo_name,
                        language_struct.name AS language_name
                    FROM 
                        `bigquery-public-data.github_repos.languages`,
                        UNNEST(language) AS language_struct
                    WHERE 
                        LOWER(language_struct.name) LIKE '%python%'
                    GROUP BY 
                        language_name,
                        repo_name
                ) AS F
            ON 
                C.repo_name = F.repo_name
        ) AS E
    ON 
        D.id = E.id
)
SELECT (SELECT COUNT(*) FROM requests WHERE content LIKE '%requests%') / COUNT(*) AS proportion
FROM requests
