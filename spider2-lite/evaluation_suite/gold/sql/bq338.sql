WITH acs_2017 AS (
  SELECT geo_id, median_income AS median_income_2017
  FROM `bigquery-public-data.census_bureau_acs.censustract_2017_5yr`  
  WHERE geo_id LIKE '36047%' --Selecting Brooklyn
),

acs_2010 AS (
  SELECT geo_id, median_income AS median_income_2010
  FROM `bigquery-public-data.census_bureau_acs.censustract_2010_5yr` 
  WHERE geo_id LIKE '36047%' --Selecting Brooklyn
),

acs_diff AS (
  SELECT
    a17.geo_id, 
    a17.median_income_2017, 
    a10.median_income_2010,
    (a17.median_income_2017 - a10.median_income_2010) AS median_income_diff, 
    geo.tract_geom AS tract_geom
  FROM acs_2017 a17
  JOIN acs_2010 a10
    ON a17.geo_id = a10.geo_id
  JOIN `bigquery-public-data.geo_census_tracts.census_tracts_new_york`geo
    ON a17.geo_id = geo.geo_id
)

SELECT 
   geo_id
FROM 
   acs_diff 
WHERE 
   median_income_diff IS NOT NULL
ORDER BY 
   median_income_diff DESC
LIMIT 1;