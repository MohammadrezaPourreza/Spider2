WITH google_hiring AS (
  SELECT
    gender_us_women,
    gender_us_men
  FROM `bigquery-public-data.google_dei.dar_non_intersectional_hiring`
  WHERE
    workforce = 'overall'
    AND report_year = 2023
),

bls_averages AS (
  SELECT
    AVG(percent_women) AS avg_gender_us_women,
    AVG(1 - percent_women) AS avg_gender_us_men
  FROM `bigquery-public-data.bls.cpsaat18`
  WHERE year = 2022
        AND ((subsector IN (
                'Internet publishing and broadcasting and web search portals',
                'Software publishers',
                'Data processing, hosting, and related services')))
),

gender_differences AS (
  SELECT
    'women' AS gender,
    ABS(google.gender_us_women - bls.avg_gender_us_women) AS diff
  FROM google_hiring google, bls_averages bls
  UNION ALL
  SELECT
    'men' AS gender,
    ABS(google.gender_us_men - bls.avg_gender_us_men) AS diff
  FROM google_hiring google, bls_averages bls
)

SELECT
  gender,
  diff
FROM gender_differences
ORDER BY diff ASC
LIMIT 1;