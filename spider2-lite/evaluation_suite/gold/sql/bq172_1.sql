WITH total_ip_cost AS (
  SELECT
    provider_id,
    SUM(average_medicare_payments * total_discharges) AS total_ip_cost
  FROM (
    SELECT * FROM `bigquery-public-data.cms_medicare.inpatient_charges_2011`
    UNION ALL
    SELECT * FROM `bigquery-public-data.cms_medicare.inpatient_charges_2012`
    UNION ALL
    SELECT * FROM `bigquery-public-data.cms_medicare.inpatient_charges_2013`
    UNION ALL
    SELECT * FROM `bigquery-public-data.cms_medicare.inpatient_charges_2014`
    UNION ALL
    SELECT * FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
  )
  GROUP BY
    provider_id
  ORDER BY
    total_ip_cost DESC
  LIMIT 1
),
provider_id_with_highest_ip_cost AS (
  SELECT provider_id FROM total_ip_cost
)

-- Step 2: Retrieve the annual inpatient and outpatient costs for the identified provider from 2011-2015
SELECT
  ip.provider_name AS Provider_Name,
  IP.year,
  ROUND(ip.average_ip_cost) AS Average_IP_Cost,
  ROUND(op.average_op_cost) AS Average_OP_Cost
FROM (
  SELECT
    provider_id,
    provider_state,
    provider_city,
    provider_name,
    _TABLE_SUFFIX AS year,
    AVG(average_medicare_payments * total_discharges) AS average_ip_cost
  FROM
    `bigquery-public-data.cms_medicare.inpatient_charges_*`
  WHERE
    provider_id IN (SELECT provider_id FROM provider_id_with_highest_ip_cost)
  GROUP BY
    provider_id,
    provider_state,
    provider_city,
    provider_name,
    year
) AS ip
LEFT JOIN (
  SELECT
    provider_id,
    provider_state,
    provider_city,
    provider_name,
    _TABLE_SUFFIX AS year,
    AVG(average_total_payments * outpatient_services) AS average_op_cost
  FROM
    `bigquery-public-data.cms_medicare.outpatient_charges_*`
  WHERE 
    provider_id IN (SELECT provider_id FROM provider_id_with_highest_ip_cost)
  GROUP BY
    provider_id,
    provider_state,
    provider_city,
    provider_name,
    year
) AS op
ON
  ip.provider_id = op.provider_id
  AND ip.provider_state = op.provider_state
  AND ip.provider_city = op.provider_city
  AND ip.provider_name = op.provider_name
  AND ip.year = op.year
ORDER BY
  year;