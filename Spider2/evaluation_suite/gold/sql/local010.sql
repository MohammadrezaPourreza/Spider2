WITH FLIGHT_INFO AS (
    SELECT    
        flights.flight_id,
        json_extract(departure.city, '$.en') AS from_city,
        CAST(SUBSTR(departure.coordinates, 2, INSTR(departure.coordinates, ',') - 2) AS REAL) AS from_longitude,
        CAST(SUBSTR(departure.coordinates, INSTR(departure.coordinates, ',') + 1, LENGTH(departure.coordinates) - INSTR(departure.coordinates, ',') - 2) AS REAL) AS from_latitude,
        json_extract(arrival.city, '$.en') AS to_city,
        CAST(SUBSTR(arrival.coordinates, 2, INSTR(arrival.coordinates, ',') - 2) AS REAL) AS to_longitude,
        CAST(SUBSTR(arrival.coordinates, INSTR(arrival.coordinates, ',') + 1, LENGTH(arrival.coordinates) - INSTR(arrival.coordinates, ',') - 2) AS REAL) AS to_latitude
    FROM
        flights 
    LEFT JOIN airports_data AS departure ON flights.departure_airport = departure.airport_code
    LEFT JOIN airports_data AS arrival ON flights.arrival_airport = arrival.airport_code
)


-- Create a histogram distribution of average_distance_km
SELECT group_count FROM
(
SELECT
    FLOOR(average_distance_km / 1000) * 1000 AS distance_range,
    COUNT(*) AS group_count
FROM (
    -- Calculate the average distance for each unique combination of from_city and to_city
    SELECT
        from_city,
        to_city,
        AVG(distance_km) AS average_distance_km
    FROM (
        -- Subquery to calculate the distances as before
        SELECT
            from_city,
            to_city,
            -- Calculate the distance using the Haversine formula
            2 * 6371 * ASIN(SQRT(
                POWER(SIN(RADIANS((to_latitude - from_latitude) / 2)), 2) +
                COS(RADIANS(from_latitude)) * COS(RADIANS(to_latitude)) *
                POWER(SIN(RADIANS((to_longitude - from_longitude) / 2)), 2)
            )) AS distance_km
        FROM FLIGHT_INFO
    ) AS subquery
    GROUP BY from_city, to_city
) AS distances
GROUP BY distance_range
ORDER BY group_count
LIMIT 1
)
