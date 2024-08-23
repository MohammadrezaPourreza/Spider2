SELECT 
page_views
FROM
(
SELECT
    CASE 
        WHEN SPLIT(SPLIT((SELECT value.string_value 
                          FROM UNNEST(event_params) 
                          WHERE event_name = 'page_view' AND key = 'page_location'),'/')[SAFE_ORDINAL(4)],'?')[SAFE_ORDINAL(1)] = '' 
        THEN NULL 
        ELSE CONCAT('/', SPLIT(SPLIT((SELECT value.string_value 
                                      FROM UNNEST(event_params) 
                                      WHERE event_name = 'page_view' AND key = 'page_location'),'/')[SAFE_ORDINAL(4)],'?')[SAFE_ORDINAL(1)]) 
    END AS pagepath_level_1,
    CASE 
        WHEN SPLIT(SPLIT((SELECT value.string_value 
                          FROM UNNEST(event_params) 
                          WHERE event_name = 'page_view' AND key = 'page_location'),'/')[SAFE_ORDINAL(5)],'?')[SAFE_ORDINAL(1)] = '' 
        THEN NULL 
        ELSE CONCAT('/', SPLIT(SPLIT((SELECT value.string_value 
                                      FROM UNNEST(event_params) 
                                      WHERE event_name = 'page_view' AND key = 'page_location'),'/')[SAFE_ORDINAL(5)],'?')[SAFE_ORDINAL(1)]) 
    END AS pagepath_level_2,
    CASE 
        WHEN SPLIT(SPLIT((SELECT value.string_value 
                          FROM UNNEST(event_params) 
                          WHERE event_name = 'page_view' AND key = 'page_location'),'/')[SAFE_ORDINAL(6)],'?')[SAFE_ORDINAL(1)] = '' 
        THEN NULL 
        ELSE CONCAT('/', SPLIT(SPLIT((SELECT value.string_value 
                                      FROM UNNEST(event_params) 
                                      WHERE event_name = 'page_view' AND key = 'page_location'),'/')[SAFE_ORDINAL(6)],'?')[SAFE_ORDINAL(1)]) 
    END AS pagepath_level_3,
    COUNTIF(event_name = 'page_view') AS page_views
FROM
    `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
    _table_suffix BETWEEN '20201201' and '20201231'
GROUP BY
    pagepath_level_1,
    pagepath_level_2,
    pagepath_level_3
)
ORDER BY
    page_views DESC
LIMIT 1
