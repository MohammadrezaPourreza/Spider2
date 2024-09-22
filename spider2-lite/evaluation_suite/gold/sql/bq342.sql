WITH transaction_addresses AS (
  SELECT 
    from_address, 
    to_address, 
    block_timestamp, 
    CAST(value AS FLOAT64) AS value
  FROM 
    `spider2-public-data.crypto_ethereum.token_transfers`
  WHERE 
    token_address = '0x68e54af74b22acaccffa04ccaad13be16ed14eac'
    AND (from_address = '0x8babf0ba311aab914c00e8fda7e8558a8b66de5d'
         OR to_address = '0xfbd6c6b112214d949dcdfb1217153bc0a742862f')
    -- Include all of 2019 and 2020
    AND DATE(block_timestamp) BETWEEN '2019-01-01' AND '2020-12-31'
),

out_addresses AS (
  SELECT 
    from_address, 
    TIMESTAMP_TRUNC(block_timestamp, HOUR) AS hour, 
    SUM(value) AS hourly_change  
  FROM 
    transaction_addresses
  WHERE 
    from_address = '0x8babf0ba311aab914c00e8fda7e8558a8b66de5d'
  GROUP BY 
    from_address, TIMESTAMP_TRUNC(block_timestamp, HOUR)
),

in_addresses AS (
  SELECT 
    to_address, 
    TIMESTAMP_TRUNC(block_timestamp, HOUR) AS hour, 
    SUM(value) AS hourly_change
  FROM 
    transaction_addresses
  WHERE 
    to_address = '0xfbd6c6b112214d949dcdfb1217153bc0a742862f'
  GROUP BY 
    to_address, TIMESTAMP_TRUNC(block_timestamp, HOUR)
),

all_addresses AS (
  SELECT 
    from_address AS address, 
    hour, 
    hourly_change
  FROM 
    out_addresses

  UNION ALL

  SELECT 
    to_address AS address, 
    hour, 
    hourly_change
  FROM 
    in_addresses
),

avg_hourly_change_2019 AS (
  SELECT 
    AVG(hourly_change) AS avg_change_2019
  FROM 
    all_addresses
  WHERE 
    EXTRACT(YEAR FROM hour) = 2019
),

avg_hourly_change_2020 AS (
  SELECT 
    AVG(hourly_change) AS avg_change_2020
  FROM 
    all_addresses
  WHERE 
    EXTRACT(YEAR FROM hour) = 2020
)

SELECT 
  a.avg_change_2020 - b.avg_change_2019 AS diff_avg_hourly_change
FROM 
  avg_hourly_change_2019 b,
  avg_hourly_change_2020 a;