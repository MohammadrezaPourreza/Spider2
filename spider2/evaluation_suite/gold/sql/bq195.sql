WITH value_table AS (
    SELECT to_address AS address, value AS value
    FROM `spider2-public-data.crypto_ethereum.traces`
    WHERE to_address IS NOT null
    AND block_timestamp < '2021-09-01 00:00:00'
    AND status=1
    AND (call_type NOT IN ('delegatecall', 'callcode', 'staticcall') OR call_type IS null)
    
    UNION ALL
    
    SELECT from_address AS address, -value AS value
    FROM `spider2-public-data.crypto_ethereum.traces`
    WHERE from_address IS NOT null
    AND block_timestamp < '2021-09-01 00:00:00'
    AND status=1
    AND (call_type NOT IN ('delegatecall', 'callcode', 'staticcall') OR call_type IS null)
    
    UNION ALL
    
    SELECT miner as address, SUM(CAST(receipt_gas_used AS NUMERIC) * CAST(gas_price AS NUMERIC)) AS value
    FROM `spider2-public-data.crypto_ethereum.transactions` AS transactions
    JOIN `spider2-public-data.crypto_ethereum.blocks` AS blocks
    ON blocks.number = transactions.block_number
    WHERE block_timestamp < '2021-09-01 00:00:00'
    GROUP BY blocks.miner
    
    UNION ALL
    
    SELECT from_address as address, -(CAST(receipt_gas_used AS NUMERIC) * CAST(gas_price AS NUMERIC)) AS value
    FROM  `spider2-public-data.crypto_ethereum.transactions`
    WHERE block_timestamp < '2021-09-01 00:00:00'
)
SELECT address, FLOOR(SUM(value) / power(10,18)) AS balance
FROM value_table
GROUP BY address
ORDER BY balance DESC
LIMIT 10