WITH google_hiring AS (
  SELECT
    race_asian,
    race_black,
    race_hispanic_latinx,
    race_native_american,
    race_white
  FROM `bigquery-public-data.google_dei.dar_non_intersectional_hiring`
  WHERE
    workforce = 'overall'
    AND report_year = 2023
),

google_representation AS (
  SELECT
    race_asian,
    race_black,
    race_hispanic_latinx,
    race_native_american,
    race_white
  FROM `bigquery-public-data.google_dei.dar_non_intersectional_representation`
  WHERE
    workforce = 'overall'
    AND report_year = 2023
),

race_differences AS (
  SELECT
    ABS(hiring.race_asian - rep.race_asian) AS diff_asian,
    ABS(hiring.race_black - rep.race_black) AS diff_black,
    ABS(hiring.race_hispanic_latinx - rep.race_hispanic_latinx) AS diff_hispanic_latinx,
    ABS(hiring.race_native_american - rep.race_native_american) AS diff_native_american,
    ABS(hiring.race_white - rep.race_white) AS diff_white
  FROM
    google_hiring hiring,
    google_representation rep
)

SELECT
  SUM(diff_asian) + 
  SUM(diff_black) + 
  SUM(diff_hispanic_latinx) + 
  SUM(diff_native_american) + 
  SUM(diff_white) AS total_difference
FROM
  race_differences;