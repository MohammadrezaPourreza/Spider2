WITH token_transfers AS (
  SELECT
    from_address AS address,
    -CAST(value AS NUMERIC) AS value,
    transaction_hash,
    block_number,
    log_index
  FROM `bigquery-public-data.crypto_ethereum.token_transfers`
  WHERE token_address = "0xa92a861fc11b99b24296af880011b47f9cafb5ab"

  UNION ALL

  SELECT
    to_address AS address,
    CAST(value AS NUMERIC) AS value,
    transaction_hash,
    block_number,
    log_index
  FROM `bigquery-public-data.crypto_ethereum.token_transfers`
  WHERE token_address = "0xa92a861fc11b99b24296af880011b47f9cafb5ab"
),

balances AS (
  SELECT
    address,
    block_number,
    log_index,
    SUM(value) OVER (PARTITION BY address ORDER BY block_number, log_index ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS balance
  FROM token_transfers
  WHERE address != "0x0000000000000000000000000000000000000000"
),

previous_balances AS (
  SELECT
    address,
    balance,
    COALESCE(LAG(balance, 1) OVER (PARTITION BY address ORDER BY block_number, log_index), 0) AS prev_balance,
    ABS(balance - COALESCE(LAG(balance, 1) OVER (PARTITION BY address ORDER BY block_number, log_index), 0)) AS abs_diff
  FROM balances
)

SELECT
  address
FROM previous_balances
ORDER BY abs_diff DESC
LIMIT 1;