WITH joined_data AS (
    SELECT poi.poi_id, poi.poi_name, addr.longitude, addr.latitude,
           addr.number, addr.street_directional_prefix, addr.street,
           addr.street_type, addr.street_directional_suffix,
           addr.unit, addr.city, addr.state, addr.zip
    FROM US_REAL_ESTATE.CYBERSYN.point_of_interest_index AS poi
    JOIN US_REAL_ESTATE.CYBERSYN.point_of_interest_addresses_relationships AS map
        ON (poi.poi_id = map.poi_id)
    JOIN US_REAL_ESTATE.CYBERSYN.us_addresses AS addr
        ON (map.address_id = addr.address_id)
)
SELECT home_depot.poi_id,
       ST_DISTANCE(
           ST_MAKEPOINT(home_depot.longitude, home_depot.latitude),
           ST_MAKEPOINT(lowes.longitude, lowes.latitude)
       ) / 1609 AS distance_miles
FROM joined_data AS home_depot
JOIN joined_data AS lowes
WHERE home_depot.poi_name = 'The Home Depot'
  AND lowes.poi_name = 'Lowe''s Home Improvement'
QUALIFY ROW_NUMBER() OVER (PARTITION BY home_depot.poi_id ORDER BY distance_miles NULLS LAST) = 1;