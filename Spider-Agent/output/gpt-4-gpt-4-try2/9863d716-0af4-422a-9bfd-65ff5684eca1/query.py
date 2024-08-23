sql = """
SELECT
    AVG(CASE WHEN purchase_event_count > 0 THEN page_view_count ELSE NULL END) AS avg_pageviews_bought,
    AVG(CASE WHEN purchase_event_count = 0 THEN page_view_count ELSE NULL END) AS avg_pageviews_not_bought
FROM (
    SELECT
        user_pseudo_id,
        COUNTIF(event_name = 'page_view') AS page_view_count,
        COUNTIF(event_name IN ('in_app_purchase', 'purchase')) AS purchase_event_count
    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
    WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201231'
    GROUP BY 1
)
"""

print(sql)
