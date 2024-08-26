# `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201215.md`

## Column details

* [STRING]    `event_date`
  - No description available
* [INT64]    `event_timestamp`
  - No description available
* [STRING]    `event_name`
  - No description available
* [ARRAY<STRUCT<key STRING, value STRUCT<string_value STRING, int_value INT64, float_value FLOAT64, double_value FLOAT64>>>]    `event_params`
  - No description available
* [STRING]    `event_params`
  - No description available
* [STRUCT<string_value STRING, int_value INT64, float_value FLOAT64, double_value FLOAT64>]    `event_params`
  - No description available
* [STRING]    `event_params`
  - No description available
* [INT64]    `event_params`
  - No description available
* [FLOAT64]    `event_params`
  - No description available
* [FLOAT64]    `event_params`
  - No description available
* [INT64]    `event_previous_timestamp`
  - No description available
* [FLOAT64]    `event_value_in_usd`
  - No description available
* [INT64]    `event_bundle_sequence_id`
  - No description available
* [INT64]    `event_server_timestamp_offset`
  - No description available
* [STRING]    `user_id`
  - No description available
* [STRING]    `user_pseudo_id`
  - No description available
* [STRUCT<analytics_storage INT64, ads_storage INT64, uses_transient_token STRING>]    `privacy_info`
  - No description available
* [INT64]    `privacy_info`
  - No description available
* [INT64]    `privacy_info`
  - No description available
* [STRING]    `privacy_info`
  - No description available
* [ARRAY<STRUCT<key INT64, value STRUCT<string_value INT64, int_value INT64, float_value INT64, double_value INT64, set_timestamp_micros INT64>>>]    `user_properties`
  - No description available
* [INT64]    `user_properties`
  - No description available
* [STRUCT<string_value INT64, int_value INT64, float_value INT64, double_value INT64, set_timestamp_micros INT64>]    `user_properties`
  - No description available
* [INT64]    `user_properties`
  - No description available
* [INT64]    `user_properties`
  - No description available
* [INT64]    `user_properties`
  - No description available
* [INT64]    `user_properties`
  - No description available
* [INT64]    `user_properties`
  - No description available
* [INT64]    `user_first_touch_timestamp`
  - No description available
* [STRUCT<revenue FLOAT64, currency STRING>]    `user_ltv`
  - No description available
* [FLOAT64]    `user_ltv`
  - No description available
* [STRING]    `user_ltv`
  - No description available
* [STRUCT<category STRING, mobile_brand_name STRING, mobile_model_name STRING, mobile_marketing_name STRING, mobile_os_hardware_model INT64, operating_system STRING, operating_system_version STRING, vendor_id INT64, advertising_id INT64, language STRING, is_limited_ad_tracking STRING, time_zone_offset_seconds INT64, web_info STRUCT<browser STRING, browser_version STRING>>]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [INT64]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [INT64]    `device`
  - No description available
* [INT64]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [INT64]    `device`
  - No description available
* [STRUCT<browser STRING, browser_version STRING>]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRING]    `device`
  - No description available
* [STRUCT<continent STRING, sub_continent STRING, country STRING, region STRING, city STRING, metro STRING>]    `geo`
  - No description available
* [STRING]    `geo`
  - No description available
* [STRING]    `geo`
  - No description available
* [STRING]    `geo`
  - No description available
* [STRING]    `geo`
  - No description available
* [STRING]    `geo`
  - No description available
* [STRING]    `geo`
  - No description available
* [STRUCT<id STRING, version STRING, install_store STRING, firebase_app_id STRING, install_source STRING>]    `app_info`
  - No description available
* [STRING]    `app_info`
  - No description available
* [STRING]    `app_info`
  - No description available
* [STRING]    `app_info`
  - No description available
* [STRING]    `app_info`
  - No description available
* [STRING]    `app_info`
  - No description available
* [STRUCT<medium STRING, name STRING, source STRING>]    `traffic_source`
  - No description available
* [STRING]    `traffic_source`
  - No description available
* [STRING]    `traffic_source`
  - No description available
* [STRING]    `traffic_source`
  - No description available
* [INT64]    `stream_id`
  - No description available
* [STRING]    `platform`
  - No description available
* [STRUCT<hostname STRING>]    `event_dimensions`
  - No description available
* [STRING]    `event_dimensions`
  - No description available
* [STRUCT<total_item_quantity INT64, purchase_revenue_in_usd FLOAT64, purchase_revenue FLOAT64, refund_value_in_usd FLOAT64, refund_value FLOAT64, shipping_value_in_usd FLOAT64, shipping_value FLOAT64, tax_value_in_usd FLOAT64, tax_value FLOAT64, unique_items INT64, transaction_id STRING>]    `ecommerce`
  - No description available
* [INT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [FLOAT64]    `ecommerce`
  - No description available
* [INT64]    `ecommerce`
  - No description available
* [STRING]    `ecommerce`
  - No description available
* [ARRAY<STRUCT<item_id STRING, item_name STRING, item_brand STRING, item_variant STRING, item_category STRING, item_category2 STRING, item_category3 STRING, item_category4 STRING, item_category5 STRING, price_in_usd FLOAT64, price FLOAT64, quantity INT64, item_revenue_in_usd FLOAT64, item_revenue FLOAT64, item_refund_in_usd FLOAT64, item_refund FLOAT64, coupon STRING, affiliation STRING, location_id STRING, item_list_id STRING, item_list_name STRING, item_list_index STRING, promotion_id STRING, promotion_name STRING, creative_name STRING, creative_slot STRING>>]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [FLOAT64]    `items`
  - No description available
* [FLOAT64]    `items`
  - No description available
* [INT64]    `items`
  - No description available
* [FLOAT64]    `items`
  - No description available
* [FLOAT64]    `items`
  - No description available
* [FLOAT64]    `items`
  - No description available
* [FLOAT64]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available
* [STRING]    `items`
  - No description available

