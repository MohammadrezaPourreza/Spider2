WITH e2000 as(
  SELECT
    AVG(month3_emplvl_23_construction) AS construction_employees_2000,
    geoid
  FROM
    `bigquery-public-data.bls_qcew.2000_*`
  WHERE
    geoid LIKE '49%'
  GROUP BY
    geoid),

e2018 AS (
  SELECT
    AVG(month3_emplvl_23_construction) AS construction_employees_2018,
    geoid,
  FROM
    `bigquery-public-data.bls_qcew.2018_*` e2018
  WHERE
    geoid LIKE '49%'
  GROUP BY
    geoid)

SELECT
  c.county_name AS county,
  (construction_employees_2018 - construction_employees_2000) / construction_employees_2000 * 100 AS increase_rate
FROM
  e2000
JOIN
  e2018 USING (geoid)
JOIN 
  `bigquery-public-data.geo_us_boundaries.counties` c ON c.geo_id = e2018.geoid
WHERE
  c.state_fips_code = "49"
ORDER BY
  increase_rate desc
LIMIT 1