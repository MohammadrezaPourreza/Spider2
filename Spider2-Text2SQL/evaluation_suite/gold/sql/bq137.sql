with zip_pop AS (
  SELECT
    zip_census.zipcode AS zipcode,
    population
  FROM
    `bigquery-public-data.census_bureau_usa.population_by_zip_2010` AS zip_census
  WHERE
    (gender LIKE 'male'
      OR gender LIKE 'female')
    AND minimum_age IS NULL
    AND maximum_age IS NULL )
SELECT
  zip_area.zipcode_geom AS zipcode_polygon,
  zip_area.zipcode AS zipcode,
  area_land_meters,
  area_water_meters,
  ST_GeogPoint(longitude,
    latitude) AS lat_lon,
  state_code,
  state_name,
  city,
  county,
  population
FROM
  `bigquery-public-data.utility_us.zipcode_area` AS zip_area
JOIN
  zip_pop
ON
  zip_area.zipcode = zip_pop.zipcode
WHERE
  ST_DWITHIN(ST_GeogPoint(longitude,latitude),
  ST_GeogPoint(-122.3321,47.6062),10000)