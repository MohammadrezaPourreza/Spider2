WITH python_repo AS (
    WITH
        repositories AS (
        SELECT
        t2.repo_name,
        t2.LANGUAGE
        FROM (
        SELECT
            repo_name,
            LANGUAGE,
            RANK() OVER (PARTITION BY t1.repo_name ORDER BY t1.language_bytes DESC) AS rank
        FROM (
            SELECT
            repo_name,
            arr.name AS LANGUAGE,
            arr.bytes AS language_bytes
            FROM
            `bigquery-public-data.github_repos.languages`,
            UNNEST(LANGUAGE) arr ) AS t1 ) AS t2
        WHERE
        rank = 1)
    SELECT
        repo_name,
        LANGUAGE
    FROM
        repositories
    WHERE
        LANGUAGE = 'Python'
        )
SELECT Rname, COUNT(commit) AS num_commits FROM `bigquery-public-data.github_repos.commits`
LEFT JOIN UNNEST(`bigquery-public-data.github_repos.commits`.repo_name) Rname
INNER JOIN python_repo ON python_repo.repo_name = Rname
GROUP BY Rname
ORDER BY num_commits DESC LIMIT 5