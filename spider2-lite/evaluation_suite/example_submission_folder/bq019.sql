WITH most_common_drg AS (
  SELECT
    drg_definition,
    SUM(total_discharges) AS national_num_cases
  FROM
    `bigquery-public-data.cms_medicare.inpatient_charges_2014`
  GROUP BY
    drg_definition
  ORDER BY
    national_num_cases DESC
  LIMIT
    1
),
city_data AS (
  SELECT
    drg_definition,
    provider_city,
    provider_state,
    SUM(total_discharges) AS citywise_num_cases,
    SUM(average_total_payments * total_discharges) / SUM(total_discharges) AS citywise_avg_total_payments,
    SUM(average_total_payments * total_discharges) AS citywise_sum_total_payments
  FROM
    `bigquery-public-data.cms_medicare.inpatient_charges_2014`
  GROUP BY
    drg_definition,
    provider_city,
    provider_state
),
ranked_city_data AS (
  SELECT
    cd.drg_definition,
    cd.provider_city,
    cd.provider_state,
    cd.citywise_avg_total_payments,
    RANK() OVER (PARTITION BY cd.drg_definition ORDER BY cd.citywise_num_cases DESC) AS cityrank
  FROM
    city_data cd
  WHERE
    cd.drg_definition = (SELECT drg_definition FROM most_common_drg)
)
SELECT
  drg_definition AS Diagnosis,
  provider_city AS City,
  provider_state AS State,
  cityrank AS City_Rank,
  CAST(ROUND(citywise_avg_total_payments) AS INT64) AS Citywise_Avg_Payments,
FROM
  (SELECT
    drg_definition,
    provider_city,
    provider_state,
    cityrank,
    citywise_avg_total_payments
  FROM
    ranked_city_data
  WHERE
    cityrank <= 3)  # Limit to top 3 cities for the most common diagnosis
ORDER BY
  cityrank;