SELECT
  CASE
    WHEN COUNTIF(injury_severity = 4) > 1 -- 4 = Fatal injury
      then 1
      else 0
  END AS label,
  a.state_number AS feature1,
  c.body_type AS feature2,
  a.number_of_drunk_drivers AS feature3,
  a.day_of_week AS feature4,
  a.hour_of_crash AS feature5,
  CASE
    WHEN a.work_zone = "None" THEN 0
    ELSE 1
  END AS feature6,
  CASE WHEN avg_diff_speed >= 0 AND avg_diff_speed < 20 THEN 0
      WHEN avg_diff_speed >= 20 AND avg_diff_speed < 40 THEN 1
      WHEN avg_diff_speed >= 40 AND avg_diff_speed < 60 THEN 2
      WHEN avg_diff_speed >= 60 AND avg_diff_speed < 80 THEN 3
      ELSE 4
  END AS feature7
FROM 
  `bigquery-public-data.nhtsa_traffic_fatalities.accident_2016` a,
  `bigquery-public-data.nhtsa_traffic_fatalities.person_2016` b,
  `bigquery-public-data.nhtsa_traffic_fatalities.vehicle_2016` c,
  (
    SELECT 
      consecutive_number, 
      AVG(ABS(travel_speed - speed_limit)) avg_diff_speed
    FROM 
      `bigquery-public-data.nhtsa_traffic_fatalities.vehicle_2016` 
    -- travel_speed bounded because codes: 997 = speed greater than 96, 998 = speed greater than 151, 999 = unknown
    -- Speed_limit bounded because codes: 98= not reported 99= unknown
    WHERE 
      travel_speed <= 151 AND speed_limit <= 80
    GROUP BY 
      consecutive_number
  ) d
WHERE
  a.consecutive_number = b.consecutive_number
  AND b.consecutive_number = c.consecutive_number
  AND c.consecutive_number = d.consecutive_number
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
  a.consecutive_number, a.state_number, c.body_type, a.number_of_drunk_drivers, a.day_of_week, a.hour_of_crash, a.work_zone, avg_diff_speed