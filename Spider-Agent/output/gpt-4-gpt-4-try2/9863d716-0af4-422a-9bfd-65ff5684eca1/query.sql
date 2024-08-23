SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'page_view') AS page_view_count,
    COUNTIF(event_name IN ('in_app_purchase', 'purchase')) AS purchase_event_count
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
GROUP BY 1