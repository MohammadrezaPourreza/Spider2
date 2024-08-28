WITH product_sales AS (
    SELECT 
        FORMAT_TIMESTAMP('%Y-%m', i.created_at) AS month_year,
        p.id AS product_id,
        p.name AS product_name,
        SUM(i.sale_price) AS sales,
        SUM(p.cost) AS cost,
        SUM(i.sale_price - p.cost) AS profit
    FROM 
        bigquery-public-data.thelook_ecommerce.order_items AS i
    JOIN 
        bigquery-public-data.thelook_ecommerce.products AS p 
    ON 
        i.product_id = p.id
    WHERE created_at < TIMESTAMP "2024-01-01 00:00:00 UTC"
    GROUP BY 
        month_year, product_id, product_name
),

ranked_products AS (
    SELECT 
        month_year,
        product_id,
        product_name,
        sales,
        cost,
        profit,
        RANK() OVER (PARTITION BY month_year ORDER BY profit DESC) AS rank_per_month
    FROM 
        product_sales
)

SELECT 
    month_year,
    product_id,
    product_name,
    sales,
    cost,
    profit
FROM 
    ranked_products
WHERE 
    rank_per_month = 1
ORDER BY 
    month_year;