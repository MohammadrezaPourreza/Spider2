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
),
average_orders AS (
    SELECT 
        AVG(total_orders) AS avg_orders FROM store_order_counts
),
closest_store AS (
    SELECT 
        soc.store_name,
        soc.total_orders,
        ABS(soc.total_orders - (SELECT avg_orders FROM average_orders)) AS difference
    FROM 
        store_order_counts soc
    ORDER BY 
        difference ASC
    LIMIT 1
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
    CAST(dc.deliveries_completed AS REAL) / NULLIF(CAST(cs.total_orders AS REAL), 0) AS completion_ratio
FROM
    closest_store cs
LEFT JOIN
    deliveries_completed dc ON cs.store_name = dc.store_name;