WITH nyc_weather AS (
    SELECT
    -- Create a timestamp from the date components.
    timestamp(concat(year, "-", mo, "-", da)) as timestamp,
    -- Replace numerical null values with actual nulls
    AVG(IF (temp=9999.9, null, temp)) AS temperature
    FROM
        `bigquery-public-data.noaa_gsod.gsod20*`
    WHERE
        CAST(YEAR AS INT64) BETWEEN 2008 AND 2018
    AND (stn="725030" OR  -- La Guardia
        stn="744860")    -- JFK
    GROUP BY timestamp
)
SELECT
    complaint_type,
    sum(complaint_count) as total_complaint_count,
    count(temperature) as data_count,
    ROUND(corr(temperature, avg_count), 4) AS corr_count,
    ROUND(corr(temperature, avg_pct_count), 4) AS corr_pct
From (
    SELECT
        avg(pct_count) as avg_pct_count,
        avg(day_count) as avg_count,
        sum(day_count) as complaint_count,
        complaint_type,
        temperature
    FROM (
        SELECT
            DATE(timestamp) AS date,
            temperature
        FROM
            nyc_weather ) a
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
        ON x.date = y.date
    ) b
    ON a.date = b.date
    GROUP BY
        complaint_type,
        temperature
)
GROUP BY complaint_type
HAVING
    ABS(corr_pct) > 0.5 AND
    total_complaint_count > 5000
ORDER BY
    ABS(corr_pct) DESC