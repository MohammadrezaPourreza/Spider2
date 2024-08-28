WITH base_table AS (
  SELECT
    event_name,
    event_date,
    event_timestamp,
    user_pseudo_id,
    user_id,
    device,
    geo,
    traffic_source,
    event_params,
    user_properties
  FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE
    _table_suffix = '20210102'
    AND event_name IN ('page_view')
),
unnested_events AS (
  SELECT
    event_date AS date,
    event_timestamp AS event_timestamp_microseconds,
    user_pseudo_id,
    MAX(CASE WHEN c.key = 'ga_session_id' THEN c.value.int_value END) AS visitID,
    MAX(CASE WHEN c.key = 'ga_session_number' THEN c.value.int_value END) AS visitNumber,
    MAX(CASE WHEN c.key = 'page_title' THEN c.value.string_value END) AS page_title,
    MAX(CASE WHEN c.key = 'page_location' THEN c.value.string_value END) AS page_location
  FROM 
    base_table,
    UNNEST (event_params) c
  GROUP BY 1,2,3
),
home_visits AS (
  SELECT
    user_pseudo_id,
    visitID
  FROM
    unnested_events
  WHERE
    page_title = 'Home'
),
checkout_visits AS (
  SELECT
    user_pseudo_id,
    visitID
  FROM
    unnested_events
  WHERE
    page_title = 'Checkout Confirmation'
),
home_to_checkout AS (
  SELECT
    h.user_pseudo_id,
    h.visitID
  FROM
    home_visits h
  JOIN
    checkout_visits c ON h.user_pseudo_id = c.user_pseudo_id AND h.visitID = c.visitID
),
total_home_visits AS (
  SELECT
    COUNT(*) AS total_home
  FROM
    home_visits
),
total_checkout_visits AS (
  SELECT
    COUNT(*) AS total_checkout
  FROM
    home_to_checkout
)

SELECT
  (total_checkout * 100.0) / total_home AS conversion_rate
FROM
  total_home_visits,
  total_checkout_visits;