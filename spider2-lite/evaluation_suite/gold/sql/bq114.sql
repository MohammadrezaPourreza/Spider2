SELECT
  aq.city
FROM
  `bigquery-public-data.openaq.global_air_quality` AS aq
JOIN
  `bigquery-public-data.epa_historical_air_quality.air_quality_annual_summary` AS epa
ON
  ROUND(aq.latitude, 1) = ROUND(epa.latitude, 1)
  AND ROUND(aq.longitude, 1) = ROUND(epa.longitude, 1)
WHERE
  epa.units_of_measure = "Micrograms/cubic meter (LC)"
  AND epa.parameter_name = "Acceptable PM2.5 AQI & Speciation Mass"
  AND epa.year = 1990
  AND aq.pollutant = "pm25"
ORDER BY
  (epa.arithmetic_mean - aq.value) DESC
LIMIT
  1