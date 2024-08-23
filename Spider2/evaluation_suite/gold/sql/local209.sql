WITH store_order_counts AS (
    SELECT
        s.store_name,
        COUNT(o.order_id) AS total_orders
    FROM
        orders o 
    LEFT JOIN
        stores s ON o.store_id = s.store_id 
    GROUP BY 
        s.store_name
    ORDER BY 
        total_orders DESC
    LIMIT 1  
),
deliveries_completed AS (
    SELECT
        s.store_name,
        COUNT(o.order_id) AS deliveries_completed
    FROM
        orders o 
    LEFT JOIN
        stores s ON o.store_id = s.store_id 
    INNER JOIN (
            SELECT 
                DISTINCT delivery_order_id
            FROM deliveries
            WHERE delivery_status = 'DELIVERED'
        ) AS ud ON o.delivery_order_id = ud.delivery_order_id
    GROUP BY 
        s.store_name
)
SELECT
    CAST(dc.deliveries_completed AS REAL) / NULLIF(CAST(soc.total_orders AS REAL), 0) AS completion_ratio
FROM
    store_order_counts soc
LEFT JOIN
    deliveries_completed dc ON soc.store_name = dc.store_name;