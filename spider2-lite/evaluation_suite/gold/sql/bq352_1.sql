WITH ranked_data AS (
  SELECT
    ROUND((commute_45_59_mins/employed_pop)*100, 2) AS percent_high_travel,
    Ave_Number_of_Prenatal_Wks AS Vist_Ave
  FROM `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality` n
  JOIN `bigquery-public-data.census_bureau_acs.county_2017_5yr` a
  ON n.County_of_Residence_FIPS = a.geo_id
  WHERE SUBSTR(n.County_of_Residence_FIPS, 0, 2) = "55" AND n.Year = '2018-01-01'
),
top_3 AS (
  SELECT percent_high_travel
  FROM ranked_data
  ORDER BY Vist_Ave DESC
  LIMIT 3
),
bottom_3 AS (
  SELECT percent_high_travel
  FROM ranked_data
  ORDER BY Vist_Ave ASC
  LIMIT 3
)

SELECT 
  (SELECT AVG(percent_high_travel) FROM top_3) -
  (SELECT AVG(percent_high_travel) FROM bottom_3) AS difference