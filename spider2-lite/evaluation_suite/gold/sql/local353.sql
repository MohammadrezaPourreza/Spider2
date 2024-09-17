SELECT 
    lap_type, 
    COUNT(*) AS frequency
FROM (
  SELECT 
      'Race' AS lap_type
  FROM 
      lap_times
  WHERE 
      race_id = 1
  
  UNION ALL
  
  SELECT CASE
    WHEN qualifying.race_id IS NULL THEN 'Starting Position - No Qualification'
    WHEN results.grid = 0 THEN 'Starting Position - Pit Lane Start'
    WHEN qualifying.position < results.grid THEN 'Starting Position - Grid Drop'
    WHEN qualifying.position > results.grid THEN 'Starting Position - Grid Increase'
    ELSE 'Starting Position - Qualifying'
  END AS lap_type
  FROM 
      results
  LEFT JOIN qualifying
    ON qualifying.race_id = results.race_id
    AND qualifying.driver_id = results.driver_id
  WHERE 
      results.race_id = 1
  
  UNION ALL
  
  SELECT 
      retirement_type AS lap_type
  FROM 
      retirements
  WHERE 
      race_id = 1
) AS combined_laps
GROUP BY 
    lap_type
ORDER BY 
    frequency DESC
LIMIT 5;