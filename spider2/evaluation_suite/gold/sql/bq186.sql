WITH aaa AS (
    SELECT *,                 
        CONCAT(CAST(EXTRACT(YEAR FROM start_date) AS STRING),
               LPAD(CAST(EXTRACT(MONTH FROM start_date) AS STRING), 2, '0')) AS trip_date
    FROM `bigquery-public-data.san_francisco.bikeshare_trips` AS bt
    -- WHERE EXTRACT(YEAR FROM start_date) = 2015
),
bbb AS (
    SELECT 
        trip_date AS date, 
        FIRST_VALUE(duration_sec) OVER (
            PARTITION BY trip_date
            ORDER BY trip_date
        ) / 60.0 AS open,
        LAST_VALUE(duration_sec) OVER (
            PARTITION BY trip_date
            ORDER BY trip_date
        ) / 60.0 AS close,
        MAX(duration_sec) OVER (
            PARTITION BY trip_date
            ORDER BY trip_date
        ) / 60.0 AS high,
        MIN(duration_sec) OVER (
            PARTITION BY trip_date
            ORDER BY trip_date
        ) / 60.0 AS low
    FROM aaa
    ORDER BY start_date
)
SELECT date, open, high, close, low
FROM bbb
GROUP BY date, open, high, close, low
ORDER BY date;