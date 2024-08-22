WITH 
CTERepoCommits AS (
  SELECT
    RName AS repo_name,
    committer.date,
    t1.COMMIT,
    CONCAT(CAST(EXTRACT(YEAR FROM TIMESTAMP_SECONDS(committer.time_sec)) AS STRING), '-', 
           LPAD(CAST(EXTRACT(MONTH FROM TIMESTAMP_SECONDS(committer.time_sec)) AS STRING), 2, '0')) AS YearMonth
  FROM `bigquery-public-data.github_repos.commits` t1
  LEFT JOIN UNNEST(t1.repo_name) RName
  WHERE EXTRACT(YEAR FROM TIMESTAMP_SECONDS(committer.time_sec)) = 2020
),
CTERepoLang AS (
  SELECT
    t2.repo_name,
    l.name AS LangName
  FROM `bigquery-public-data.github_repos.languages` t2
  LEFT JOIN UNNEST(t2.LANGUAGE) AS l
)
, MonthlyCommits AS (
  SELECT
    CTERepoCommits.YearMonth,
    COUNT(*) AS CommitCnts
  FROM CTERepoCommits
  INNER JOIN CTERepoLang ON CTERepoCommits.repo_name = CTERepoLang.repo_name
  WHERE CTERepoLang.LangName = 'Python'
  GROUP BY CTERepoCommits.YearMonth
  ORDER BY CTERepoCommits.YearMonth
)
SELECT
  AVG(CommitCnts) AS AvgMonthlyCommits
FROM MonthlyCommits;