WITH avg_wage_1998 AS(
  SELECT
    ROUND(AVG(avg_wkly_wage_10_total_all_industries) * 52, 2) AS wages_1998
  FROM
    `bigquery-public-data.bls_qcew.1998*`
  WHERE
    geoid = "42003" --Selecting Allgeheny County
),
    
avg_wage_2017 AS (
  SELECT
    ROUND(AVG(avg_wkly_wage_10_total_all_industries) * 52, 2) AS wages_2017
  FROM
    `bigquery-public-data.bls_qcew.2017*`
  WHERE
    geoid = "42003" --Selecting Allgeheny County
),

avg_cpi_1998 AS (
  SELECT
    AVG(value) AS cpi_1998
  FROM
    `bigquery-public-data.bls.cpi_u` c
  WHERE
    year = 1998
    AND item_code = "SA0"
    AND area_code = "A104"), 
-- A104 is the code for Pittsburgh, PA
-- SA0 is the code for all items
    
avg_cpi_2017 AS(
  SELECT
    AVG(value) AS cpi_2017
  FROM
    `bigquery-public-data.bls.cpi_u` c
  WHERE
    year = 2017
    AND item_code = "SA0"
    AND area_code = "A104")
-- A104 is the code for Pittsburgh, PA
-- SA0 is the code for all items

SELECT
  ROUND((wages_2017 - wages_1998) / wages_1998 * 100, 2) AS wages_percent_change,
  ROUND((cpi_2017 - cpi_1998) / cpi_1998 * 100, 2) AS cpi_percent_change
FROM
  avg_wage_2017,
  avg_wage_1998,
  avg_cpi_2017,
  avg_cpi_1998