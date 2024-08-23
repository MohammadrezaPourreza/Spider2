WITH boundary AS (
    SELECT
        layer_class,
        layer_name,
        all_tags,
        geometry
    FROM
        `bigquery-public-data.geo_openstreetmap.planet_layers` AS layers
    WHERE
        TRUE
        AND layer_class = 'boundary'
        AND layer_name = 'national'
        AND EXISTS (
            SELECT 1
            FROM layers.all_tags
            WHERE
                key = 'ISO3166-1'
                AND value IN ('SD')
                -- for country Sudan
        )
),
cells AS (
    SELECT
        gfs.*
    FROM
        boundary,
        `spider2-public-data.noaa_global_forecast_system.NOAA_GFS0P25` AS gfs
    WHERE
        creation_time = '2021-11-28T00:00:00'
        AND ST_WITHIN(gfs.geography,
            boundary.geometry)
),
pred1 AS (
    SELECT
        creation_time,
        time,
        AVG(temperature_2m_above_ground) AS temp
    FROM
        cells
    JOIN
        UNNEST(forecast) AS forecast
    WHERE
        MOD(hours, 24) = 0
        AND hours / 24 <= 14
        AND temperature_2m_above_ground IS NOT NULL
    GROUP BY
        creation_time,
        time
),
observed AS (
    SELECT
        pred1.creation_time AS prediction_made,
        pred1.time AS predicted_time,
        gfs.creation_time AS observed_time,
        pred1.temp AS predicted_temp,
        AVG(forecast.temperature_2m_above_ground) AS observed_temp
    FROM
        pred1,
        boundary,
        `spider2-public-data.noaa_global_forecast_system.NOAA_GFS0P25` AS gfs
    JOIN
        UNNEST(forecast) AS forecast
    WHERE
        gfs.creation_time = pred1.time
        AND ST_WITHIN(gfs.geography,
            boundary.geometry)
    GROUP BY
        prediction_made,
        predicted_time,
        observed_time,
        predicted_temp )
SELECT
    observed_time,
    observed_temp - predicted_temp AS prediction_error
FROM
    observed
ORDER BY
    observed_time ASC