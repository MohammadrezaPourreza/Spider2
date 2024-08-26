WITH nyc_weather AS (
    SELECT
    -- Create a timestamp from the date components.
    timestamp(concat(year, "-", mo, "-", da)) as timestamp,
    -- Replace numerical null values with actual nulls
    AVG(IF (wdsp="999.9", null, CAST(wdsp AS Float64))) AS wind_speed
    FROM
        `bigquery-public-data.noaa_gsod.gsod20*`
    WHERE
        CAST(YEAR AS INT64) BETWEEN 2011 AND 2020
    AND stn = "744860" -- JFK Airport
    GROUP BY timestamp
),
complaint_correlations AS (
    SELECT
        complaint_type,
        sum(complaint_count) as total_complaint_count,
        count(wind_speed) as data_count,
        ROUND(corr(wind_speed, avg_count), 4) AS corr_count,
        ROUND(corr(wind_speed, avg_pct_count), 4) AS corr_pct
    From (
        SELECT
            avg(pct_count) as avg_pct_count,
            avg(day_count) as avg_count,
            sum(day_count) as complaint_count,
            complaint_type,
            wind_speed
        FROM (
            SELECT
                DATE(timestamp) AS date,
                wind_speed
            FROM
                nyc_weather) a
        JOIN (
            SELECT x.date, complaint_type, day_count, day_count / all_calls_count as pct_count
            FROM (
                SELECT
                        DATE(created_date) AS date,
                        complaint_type,
                        COUNT(*) AS day_count
                FROM
                    `bigquery-public-data.new_york.311_service_requests`
                GROUP BY
                    date,
                    complaint_type) x
            JOIN (
                SELECT
                    DATE(timestamp) AS date,
                    COUNT(*) AS all_calls_count
                FROM nyc_weather
                GROUP BY date
            ) y
            ON x.date=y.date
        ) b
        ON
            a.date = b.date
        GROUP BY
            complaint_type,
            wind_speed
    )
    GROUP BY complaint_type
    HAVING
        total_complaint_count > 3000
    ORDER BY
    corr_pct DESC
)
SELECT
    'Positive' AS correlation_type,
    complaint_type,
    corr_pct AS correlation
FROM
    complaint_correlations
WHERE
    corr_pct = (SELECT MAX(corr_pct) FROM complaint_correlations)
UNION ALL
SELECT
    'Negative' AS correlation_type,
    complaint_type,
    corr_pct AS correlation
FROM
    complaint_correlations
WHERE
    corr_pct = (SELECT MIN(corr_pct) FROM complaint_correlations);