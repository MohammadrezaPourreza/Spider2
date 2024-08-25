SELECT
  z.city as city
  ,z.zip_code as zip_code
  ,z.state_name as state
  ,COUNT(DISTINCT(h.name)) as count_hurricanes
  ,STRING_AGG(DISTINCT(h.name)) as hurricanes
--  ,CONCAT(CAST(latitude as STRING), "," , CAST(longitude as STRING)) as position
FROM 
  `bigquery-public-data.geo_us_boundaries.zip_codes` as z
  ,`bigquery-public-data.noaa_hurricanes.hurricanes` as h
WHERE
  ST_WITHIN(ST_GeogPoint(h.longitude,h.latitude), z.zip_code_geom)
  AND h.name != "NOT_NAMED"
GROUP BY 
  zip_code
  ,city
  ,state  
--  ,position
ORDER BY
  count_hurricanes desc
LIMIT 10