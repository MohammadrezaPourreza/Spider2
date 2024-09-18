WITH grouped_trips AS (
  SELECT
    end_station_id,
    COUNTIF(group_size = 1) AS single_trips,
    COUNTIF(group_size != 1) AS group_trips
  FROM (
    SELECT
      end_station_id,
      COUNT(*) AS group_size
    FROM (
      SELECT
        ROUND(UNIX_SECONDS(starttime) / 120) AS start_round,
        ROUND(UNIX_SECONDS(stoptime) / 120) AS stop_round,
        start_station_id,
        end_station_id
      FROM
        `bigquery-public-data.new_york.citibike_trips`
      GROUP BY
        start_round, stop_round, start_station_id, end_station_id
    )
    GROUP BY
      end_station_id
  )
  GROUP BY
    end_station_id
),
top_stations AS (
  SELECT
    end_station_id,
    group_trips / (single_trips + group_trips) AS percent_groups
  FROM
    grouped_trips
  ORDER BY
    percent_groups DESC
  LIMIT 10
)

SELECT DISTINCT
  ct.end_station_name
FROM
  top_stations ts
JOIN
  `bigquery-public-data.new_york.citibike_trips` ct
ON
  ts.end_station_id = ct.end_station_id
