WITH data AS (
    SELECT
        ZIPSTARTNAME.borough AS borough_start,
        ZIPSTARTNAME.neighborhood AS neighborhood_start,
        ZIPENDNAME.borough AS borough_end,
        ZIPENDNAME.neighborhood AS neighborhood_end, -- different combinations of start and end neighborhoods
        CAST(TRI.tripduration / 60 AS NUMERIC) AS trip_minutes,
        WEA.temp AS temperature,
        CAST(WEA.wdsp AS NUMERIC) AS wind_speed,
        WEA.prcp AS precipitation, -- weather conditoins
        EXTRACT(month FROM DATE(TRI.starttime)) AS start_month
    FROM
        `bigquery-public-data.new_york_citibike.citibike_trips` AS TRI
    INNER JOIN
        `bigquery-public-data.geo_us_boundaries.zip_codes` ZIPSTART
        ON ST_WITHIN(
            ST_GEOGPOINT(TRI.start_station_longitude, TRI.start_station_latitude),
            ZIPSTART.zip_code_geom)
    INNER JOIN
        `bigquery-public-data.geo_us_boundaries.zip_codes` ZIPEND
        ON ST_WITHIN(
            ST_GEOGPOINT(TRI.end_station_longitude, TRI.end_station_latitude),
            ZIPEND.zip_code_geom)
    INNER JOIN
        `bigquery-public-data.noaa_gsod.gsod2014` AS WEA
        ON PARSE_DATE("%Y%m%d", CONCAT(WEA.year, WEA.mo, WEA.da)) = DATE(TRI.starttime)
    INNER JOIN
        `spider2-public-data.cyclistic.zip_codes` AS ZIPSTARTNAME
        ON ZIPSTART.zip_code = CAST(ZIPSTARTNAME.zip AS STRING)
    INNER JOIN
        `spider2-public-data.cyclistic.zip_codes` AS ZIPENDNAME
        ON ZIPEND.zip_code = CAST(ZIPENDNAME.zip AS STRING)
    WHERE
        -- get the weather data for New York Central Park station
        WEA.wban = (
            SELECT wban 
            FROM `bigquery-public-data.noaa_gsod.stations`
            WHERE
                state = 'NY'
                AND LOWER(name) LIKE LOWER('%New York Central Park%')
            LIMIT 1
        )
        AND EXTRACT(YEAR FROM DATE(TRI.starttime)) = 2014
),
agg_data AS (
    SELECT
        borough_start,
        neighborhood_start,
        borough_end,
        neighborhood_end,
        COUNT(*) AS num_trips,
        ROUND(AVG(trip_minutes), 1) AS avg_trip_minutes,
        ROUND(AVG(temperature), 1) AS avg_temperature,
        ROUND(AVG(wind_speed), 1) AS avg_wind_speed,
        ROUND(AVG(precipitation), 1) AS avg_precipitation
    FROM data
    GROUP BY 1, 2, 3, 4
),
most_common_months AS (
    SELECT
        borough_start,
        neighborhood_start,
        borough_end,
        neighborhood_end,
        start_month,
        ROW_NUMBER() OVER (PARTITION BY borough_start, neighborhood_start, borough_end, neighborhood_end ORDER BY COUNT(*) DESC) AS row_num
    FROM data
    GROUP BY 1, 2, 3, 4, 5
)
SELECT
    a.*,
    m.start_month AS most_common_month
FROM
    agg_data a
JOIN
    most_common_months m
ON
    a.borough_start = m.borough_start AND
    a.neighborhood_start = m.neighborhood_start AND
    a.borough_end = m.borough_end AND
    a.neighborhood_end = m.neighborhood_end AND
    m.row_num = 1
ORDER BY a.neighborhood_start, a.neighborhood_end