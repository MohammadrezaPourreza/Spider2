WITH bikeshare_stations AS (
  SELECT *
  FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_stations`
), 
bikeshare_trips AS (
  SELECT 
    start_station_id,
    SAFE_CAST(end_station_id AS INT64) AS end_station_id,
    duration_minutes
  FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
),
average_duration AS (
  SELECT 
    start_station_id,
    AVG(duration_minutes) AS avg_duration_minutes
  FROM 
    bikeshare_trips
  GROUP BY 
    start_station_id
)
SELECT 
  ad.start_station_id
FROM 
  average_duration ad
JOIN bikeshare_stations st ON ad.start_station_id = st.station_id
ORDER BY 
  ad.avg_duration_minutes ASC
LIMIT 1; 