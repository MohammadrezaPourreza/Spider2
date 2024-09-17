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
),
DISTANCES AS (
    SELECT
        flight_id,
        from_city,
        to_city,
        CASE
            WHEN from_city < to_city THEN from_city ELSE to_city END AS city1,
            CASE
            WHEN from_city < to_city THEN to_city ELSE from_city END AS city2,
        2 * 6371 * ASIN(SQRT(
            POWER(SIN(RADIANS((to_latitude - from_latitude) / 2)), 2) +
            COS(RADIANS(from_latitude)) * COS(RADIANS(to_latitude)) *
            POWER(SIN(RADIANS((to_longitude - from_longitude) / 2)), 2)
        )) AS distance_km
    FROM FLIGHT_INFO
),
ALL_Route AS (
    SELECT
        city1,
        city2,
        distance_km,
        COUNT(*) AS number_of_flights -- Count flights for both directions
    FROM DISTANCES
    WHERE (city1 = 'Abakan' OR city2 = 'Abakan')
    GROUP BY city1, city2
)
SELECT 
    distance_km
FROM ALL_Route
ORDER BY distance_km DESC
LIMIT 1;