WITH StationStats AS (
  SELECT
    BT.start_station_id,
    COUNT(BT.trip_id) AS total_trips,
    RANK() OVER (ORDER BY COUNT(BT.trip_id) DESC) AS station_rank,
    ROUND((COUNT(BT.trip_id) / SUM(COUNT(BT.trip_id)) OVER ()) * 100, 2) AS percentage_of_total_trips
  FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips` BT
  JOIN `bigquery-public-data.austin_bikeshare.bikeshare_stations` BS
  ON BT.start_station_id = BS.station_id 
  WHERE BS.status = 'active'
  GROUP BY BT.start_station_id
)
, Top15 as(
  SELECT
    start_station_id,
    total_trips,
    station_rank,
    percentage_of_total_trips
  FROM StationStats
  WHERE station_rank <= 15 
  ORDER BY station_rank ASC
)

SELECT SUM(T.percentage_of_total_trips)
FROM Top15 T;
