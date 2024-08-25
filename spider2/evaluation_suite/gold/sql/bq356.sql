# Subquery to count # of dates w/ valid temperature data by station
WITH
Num2019TempDatesByStation AS
(
    SELECT
    daily_weather.stn,

    # Count # of distinct dates w/ temperature data for each station
    COUNT(DISTINCT
        # Convert year/month/day info into date
        DATE(
        CAST(daily_weather.year AS INT64),
        CAST(daily_weather.mo AS INT64),
        CAST(daily_weather.da AS INT64)
        )) AS num_2019_temp_dates

    FROM
    bigquery-public-data.noaa_gsod.gsod2019 daily_weather

    WHERE
    daily_weather.temp IS NOT NULL AND
    daily_weather.max IS NOT NULL AND
    daily_weather.min IS NOT NULL AND
    # Remove days w/ missing temps coded as 9999.9
    daily_weather.temp != 9999.9 AND
    daily_weather.max != 9999.9 AND
    daily_weather.min != 9999.9

    GROUP BY
    daily_weather.stn
),

# Calculate max number of 2019 temperature dates across all stations
MaxNum2019TempDates AS
(
    SELECT
    MAX(num_2019_temp_dates) AS max_num_2019_temp_dates

    FROM
    Num2019TempDatesByStation
)

SELECT
    COUNT(*)
FROM
    bigquery-public-data.noaa_gsod.stations Stations

# Inner join to filter to only stations present in 2019 data
INNER JOIN
    Num2019TempDatesByStation ON (
    stations.usaf = Num2019TempDatesByStation.stn
    )

# Cross join to get max number on each row, to use in filtering below
CROSS JOIN
    MaxNum2019TempDates

WHERE
    # Filter to stations that have had tracking since at least 1/1/2000
    Stations.begin <= '20000101' AND
    # Filter to stations that have had tracking through at least 6/30/2019
    Stations.end >= '20190630' AND
    # Filter to stations w/ >= 90% of the max number of dates for 2019
    Num2019TempDatesByStation.num_2019_temp_dates >=
    (0.90 * MaxNum2019TempDates.max_num_2019_temp_dates)