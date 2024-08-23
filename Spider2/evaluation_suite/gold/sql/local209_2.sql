WITH store_order_counts AS (
    SELECT
        s.store_name AS store_name,
        COUNT(o.order_id) AS total_orders
    FROM
        orders o 
    LEFT JOIN
        stores s ON o.store_id = s.store_id 
    GROUP BY 
        s.store_name
    ORDER BY 
        total_orders DESC
    LIMIT 50  -- Select top 50 stores with the largest number of orders
),
deliveries_completed AS (
    SELECT
        s.store_name AS store_name,
        COUNT(o.order_id) AS deliveries_completed
    FROM
        orders o 
    LEFT JOIN
        stores s ON o.store_id = s.store_id 
    INNER JOIN (
            SELECT 
                DISTINCT delivery_order_id,
                delivery_status
            FROM deliveries
        ) AS ud ON o.delivery_order_id = ud.delivery_order_id
    WHERE 
        ud.delivery_status = 'DELIVERED'
    GROUP BY 
        s.store_name
)
SELECT
    COUNT(*) AS stores_with_high_completion_ratio
FROM (
    SELECT
        soc.store_name,
        CAST(dc.deliveries_completed AS REAL) / NULLIF(CAST(soc.total_orders AS REAL), 0) 
        AS completion_ratio
    FROM
        store_order_counts soc
    LEFT JOIN
        deliveries_completed dc ON soc.store_name = dc.store_name
) AS completion_ratios
WHERE 
    completion_ratio > 0.98;  -- Filter for completion ratio greater than 99%