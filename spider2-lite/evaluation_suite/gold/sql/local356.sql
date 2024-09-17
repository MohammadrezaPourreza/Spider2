WITH overtakes_summary AS (
  SELECT
    overtaking_driver_id AS driver_id,
    COUNT(*) AS overtakes_count
  FROM 
      overtakes
  GROUP BY 
      overtaking_driver_id
),
overtaken_summary AS (
  SELECT
    overtaken_driver_id AS driver_id,
    COUNT(*) AS overtaken_count
  FROM 
      overtakes
  GROUP BY 
      overtaken_driver_id
),
driver_totals AS (
  SELECT
        COALESCE(overtakes_summary.driver_id, overtaken_summary.driver_id) AS driver_id,
        COALESCE(overtakes_summary.overtakes_count, 0) AS overtakes_count,
        COALESCE(overtaken_summary.overtaken_count, 0) AS overtaken_count
  FROM 
      overtakes_summary
  FULL OUTER JOIN overtaken_summary
    ON overtakes_summary.driver_id = overtaken_summary.driver_id
)
SELECT
    drivers.full_name
FROM 
    driver_totals
INNER JOIN drivers
  ON drivers.driver_id = driver_totals.driver_id
WHERE 
    driver_totals.overtaken_count > driver_totals.overtakes_count;