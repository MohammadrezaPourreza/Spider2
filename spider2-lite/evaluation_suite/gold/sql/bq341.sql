WITH transaction_addresses as (
          SELECT 
               from_address, 
               to_address, 
               CAST(value as numeric)/1000000 as value
          FROM 
               `bigquery-public-data.crypto_ethereum.token_transfers` 
          WHERE 
               token_address = "0xa92a861fc11b99b24296af880011b47f9cafb5ab"
              and DATE(block_timestamp) > "2023-03-17"
        ),

        out_addresses as (
          SELECT 
               from_address, SUM(-1*value) as total_value
          FROM 
               transaction_addresses
          GROUP BY 
               from_address
        ),

        in_addresses as (
          SELECT 
               to_address, 
               SUM(value) as total_value
          FROM 
               transaction_addresses
          GROUP BY 
               to_address
        ),

        all_addresses as (
          SELECT 
               from_address as address, 
               total_value
          FROM 
               out_addresses

          UNION ALL

          SELECT 
               to_address as address, 
               total_value
          FROM 
            in_addresses
        )

        SELECT 
            address
        FROM 
            all_addresses
        GROUP BY 
            address
        HAVING 
            sum(total_value) > 0
        ORDER BY 
            sum(total_value) ASC
        LIMIT 1;