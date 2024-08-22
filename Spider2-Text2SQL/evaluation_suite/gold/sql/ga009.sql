SELECT
  engaged_sessions_number / user_number AS engaged_sessions_per_user
FROM (
  SELECT
    COUNT(
      DISTINCT CASE
        WHEN (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'session_engaged') = '1' THEN
          CONCAT(
            user_pseudo_id, 
            CAST(
              (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING
            )
          )
      END
    ) AS engaged_sessions_number,
    COUNT(DISTINCT user_pseudo_id) AS user_number
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE
    _TABLE_SUFFIX BETWEEN '20201201' and '20201231'
) AS summary
