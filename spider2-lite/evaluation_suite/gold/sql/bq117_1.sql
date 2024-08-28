SELECT
  CONCAT(city,", ", state_name) as city,
  zip_code,
  COUNT(event_id) as count_storms
FROM
  `bigquery-public-data.noaa_historic_severe_storms.storms_*`,
  `bigquery-public-data.geo_us_boundaries.zip_codes` 
WHERE
  _TABLE_SUFFIX BETWEEN CAST((EXTRACT(YEAR from CURRENT_DATE())-10) AS STRING) AND CAST(EXTRACT(YEAR from CURRENT_DATE()) AS STRING) AND
  LOWER(event_type) = 'hail' AND
  ST_WITHIN(event_point, zip_code_geom)
  
GROUP BY
  event_type,
  zip_code, 
  city
ORDER BY
  count_storms desc
LIMIT 5
