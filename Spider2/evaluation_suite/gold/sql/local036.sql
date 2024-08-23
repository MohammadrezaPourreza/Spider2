WITH VehicleDeaths AS (
    SELECT 
        d.Age,
        SUM(CASE WHEN d.Race = 1 THEN 1 ELSE 0 END) AS Vehicle_White
    FROM DeathRecords d
    JOIN EntityAxisConditions e ON d.id = e.DeathRecordId
    JOIN Icd10Code c ON e.Icd10Code = c.code
    WHERE c.Description LIKE '%vehicle%'
      AND d.AgeType = 1
    GROUP BY d.Age
),
GunDeaths AS (
    SELECT 
        d.Age,
        SUM(CASE WHEN d.Race = 1 THEN 1 ELSE 0 END) AS Gun_White
    FROM DeathRecords d
    JOIN EntityAxisConditions e ON d.id = e.DeathRecordId
    JOIN Icd10Code c ON e.Icd10Code = c.code
    WHERE c.Description LIKE '%discharge%'
      AND c.Description NOT IN (
          'Urethral discharge', 
          'Discharge of firework', 
          'Legal intervention involving firearm discharge'
      )
      AND d.AgeType = 1
    GROUP BY d.Age
)
SELECT 
    AVG(g.Gun_White) - AVG(v.Vehicle_White) AS Difference
FROM VehicleDeaths v
JOIN GunDeaths g ON g.Age = v.Age;