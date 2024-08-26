WITH 
Num2022TempDatesByStation AS (
  SELECT
    daily_weather.stn,
    COUNT(DISTINCT DATE(
      CAST(daily_weather.year AS INT64),
      CAST(daily_weather.mo AS INT64),
      CAST(daily_weather.da AS INT64)
    )) AS num_2022_temp_dates
  FROM
    `bigquery-public-data.noaa_gsod.gsod2022` daily_weather
  WHERE
    daily_weather.temp IS NOT NULL
    AND daily_weather.max IS NOT NULL
    AND daily_weather.min IS NOT NULL
    AND daily_weather.temp != 9999.9
    AND daily_weather.max != 9999.9
    AND daily_weather.min != 9999.9
  GROUP BY
    daily_weather.stn
),

TotalStations AS (
  SELECT
    COUNT(*) AS total_stations
  FROM
    `bigquery-public-data.noaa_gsod.stations` Stations
  WHERE
    Stations.usaf != '999999'
),

StationsWith90PercentCoverage AS (
  SELECT
    COUNT(*) AS stations_with_90_percent_coverage
  FROM
    Num2022TempDatesByStation
  WHERE
    num_2022_temp_dates >= 0.90 * 365
)

SELECT
  (stations_with_90_percent_coverage / total_stations) * 100 AS percentage_of_stations_with_90_percent_coverage
FROM
  TotalStations,
  StationsWith90PercentCoverage