WITH points AS (
    SELECT 
        year AS season,
        driver_id,
        constructor_id,
        SUM(points) AS points
    FROM 
        results 
    JOIN 
        races ON results.race_id = races.race_id
    GROUP BY 
        year, driver_id, constructor_id
    HAVING 
        SUM(points) > 0
),
tops AS (
    SELECT 
        season,
        MIN(points) FILTER (WHERE driver_id IS NOT NULL) AS min_driver_points,
        MIN(points) FILTER (WHERE constructor_id IS NOT NULL) AS min_constructor_points
    FROM 
        points
    GROUP BY 
        season
),
losers AS (
    SELECT 
        tops.season,
        lose_driver.driver_id,
        lose_driver.points AS driver_points,
        lose_constructor.constructor_id,
        lose_constructor.points AS constructor_points
    FROM 
        tops 
    JOIN 
        points AS lose_driver ON lose_driver.season = tops.season 
        AND lose_driver.constructor_id IS NOT NULL 
        AND lose_driver.points = tops.min_constructor_points
    JOIN 
        points AS lose_constructor ON lose_constructor.season = tops.season 
        AND lose_constructor.driver_id IS NOT NULL 
        AND lose_constructor.points = tops.min_driver_points
)
SELECT 
    COUNT(*) AS Count
FROM 
    losers 
JOIN 
    constructors ON losers.constructor_id = constructors.constructor_id
WHERE 
    losers.season >= 2001
GROUP BY 
    constructors.name
ORDER BY 
    Count DESC
LIMIT 1;