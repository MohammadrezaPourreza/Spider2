WITH daily_forecasts AS (
  SELECT
    creation_time,
    DATE(DATETIME_ADD(forecast.time, INTERVAL 1 HOUR)) AS local_forecast_date,
    MAX(IF(forecast.temperature_2m_above_ground IS NOT NULL, forecast.temperature_2m_above_ground, NULL)) AS max_temp,
    MIN(IF(forecast.temperature_2m_above_ground IS NOT NULL, forecast.temperature_2m_above_ground, NULL)) AS min_temp,
    AVG(IF(forecast.temperature_2m_above_ground IS NOT NULL, forecast.temperature_2m_above_ground, NULL)) AS avg_temp,
    SUM(IF(forecast.total_precipitation_surface IS NOT NULL, forecast.total_precipitation_surface, 0)) AS total_precipitation,
    AVG(IF(TIME(DATETIME_ADD(forecast.time, INTERVAL 1 HOUR)) BETWEEN '10:00:00' AND '17:00:00' AND forecast.total_cloud_cover_entire_atmosphere IS NOT NULL, forecast.total_cloud_cover_entire_atmosphere, NULL)) AS avg_cloud_cover,
    CASE
      WHEN AVG(forecast.temperature_2m_above_ground) < 32 THEN SUM(IF(forecast.total_precipitation_surface IS NOT NULL, forecast.total_precipitation_surface, 0))
      ELSE 0
    END AS total_snow,
    CASE
      WHEN AVG(forecast.temperature_2m_above_ground) >= 32 THEN SUM(IF(forecast.total_precipitation_surface IS NOT NULL, forecast.total_precipitation_surface, 0))
      ELSE 0
    END AS total_rain
  FROM
    `spider2-public-data.noaa_global_forecast_system.NOAA_GFS0P25`,
    UNNEST(forecast) AS forecast
  WHERE
    creation_time BETWEEN '2021-11-28 00:00:00' AND '2021-11-29 00:00:00'
    AND ST_DWithin(geography, ST_GeogPoint(17.5, 23.25), 5000)
    AND DATE(forecast.time) = DATE_ADD(DATE(creation_time), INTERVAL 1 DAY)
  GROUP BY
    creation_time,
    local_forecast_date
)
SELECT
  creation_time,
  local_forecast_date AS forecast_date,
  max_temp,
  min_temp,
  avg_temp,
  total_precipitation,
  avg_cloud_cover,
  total_snow,
  total_rain
FROM
  daily_forecasts
ORDER BY
  creation_time,
  local_forecast_date