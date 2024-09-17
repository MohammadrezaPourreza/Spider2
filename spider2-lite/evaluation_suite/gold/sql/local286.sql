WITH products2 AS (
    SELECT 
        product_id, 
        cn.product_category_name_english AS product_name
    FROM 
        products AS pd
    LEFT JOIN 
        product_category_name_translation AS cn
    ON 
        pd.product_category_name = cn.product_category_name
),
product_frequency AS (
    SELECT 
        oi.seller_id, 
        pd2.product_name, 
        COUNT(*) AS product_count
    FROM 
        order_items AS oi
    JOIN 
        products2 AS pd2 
    ON 
        oi.product_id = pd2.product_id
    GROUP BY 
        oi.seller_id, pd2.product_name
),
max_product_frequency AS (
    SELECT 
        seller_id, 
        product_name AS highlight_product,
        product_count
    FROM 
        product_frequency
    WHERE 
        (seller_id, product_count) IN (
            SELECT 
                seller_id, 
                MAX(product_count)
            FROM 
                product_frequency
            GROUP BY 
                seller_id
        )
),
seller2 AS (
    SELECT 
        oi.seller_id, 
        SUM(oi.price) AS total_sales,
        AVG(oi.price) AS avg_price,
        AVG(r.review_score) AS avg_review_score,
        AVG(julianday(o.order_delivered_carrier_date) - julianday(o.order_purchase_timestamp)) AS avg_packing_time,
        COUNT(*) AS product_cnt,
        mpf.highlight_product
    FROM 
        order_items AS oi
    LEFT JOIN 
        orders AS o 
    ON 
        o.order_id = oi.order_id
    LEFT JOIN 
        order_reviews AS r 
    ON 
        o.order_id = r.order_id
    LEFT JOIN 
        max_product_frequency AS mpf 
    ON 
        oi.seller_id = mpf.seller_id
    GROUP BY 
        oi.seller_id
    ORDER BY 
        product_cnt DESC
)
SELECT 
    seller_id, 
    product_cnt, 
    avg_price, 
    total_sales, 
    avg_packing_time, 
    avg_review_score, 
    highlight_product
FROM 
    seller2
WHERE 
    product_cnt > 100;
