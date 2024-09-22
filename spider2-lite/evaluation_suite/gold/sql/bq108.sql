SELECT
  SUM(label)/COUNT(label) AS percentage_of_1,
FROM
(
  SELECT
    CASE
      WHEN COUNTIF(injury_severity = 4) > 1
        then 1
        else 0
    END AS label
  FROM 
    `bigquery-public-data.nhtsa_traffic_fatalities.accident_2016` a,
    `bigquery-public-data.nhtsa_traffic_fatalities.person_2016` b,
    `bigquery-public-data.nhtsa_traffic_fatalities.vehicle_2016` c 
  WHERE
    a.month_of_crash > 0 
    AND a.month_of_crash < 9
    AND a.consecutive_number = b.consecutive_number
    AND b.consecutive_number = c.consecutive_number
    AND a.consecutive_number IN
    (
      SELECT 
        accident.consecutive_number
      FROM 
        `bigquery-public-data.nhtsa_traffic_fatalities.person_2016` person, `bigquery-public-data.nhtsa_traffic_fatalities.accident_2016` accident
      WHERE
        person.consecutive_number = accident.consecutive_number
      GROUP BY 
        accident.consecutive_number
      HAVING COUNT(DISTINCT person.person_number) <> 1
    )
  GROUP BY
    a.consecutive_number
)