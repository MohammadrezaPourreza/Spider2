WITH all_transactions AS (
  SELECT block_timestamp, amount
  FROM `spider2-public-data.crypto_zilliqa.transactions`
  UNION ALL
  SELECT block_timestamp, amount
  FROM `spider2-public-data.crypto_zilliqa.transitions` 
)
SELECT 
  DATE(block_timestamp) AS date
FROM all_transactions
WHERE block_timestamp < TIMESTAMP('2022-01-01')
GROUP BY date
ORDER BY SUM(amount) / 1e12 DESC
LIMIT 1;