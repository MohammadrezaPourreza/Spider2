WITH orders_data AS (
    SELECT
        FORMAT_TIMESTAMP('%Y-%m', o.created_at) AS month,
        i.product_id,
        COUNT(o.order_id) AS order_count,
        SUM(i.sale_price) AS total_sales
    FROM 
        bigquery-public-data.thelook_ecommerce.orders AS o
    JOIN 
        bigquery-public-data.thelook_ecommerce.order_items AS i 
    ON
        o.order_id = i.order_id
    WHERE
        o.created_at BETWEEN TIMESTAMP('2019-06-01') AND TIMESTAMP('2019-12-31')
    GROUP BY 
        month, i.product_id
),
product_data AS (
    SELECT 
        p.id AS product_id,
        p.category AS product_category,
        p.cost
    FROM 
        bigquery-public-data.thelook_ecommerce.products AS p
),
monthly_metrics AS (
    SELECT 
        o.month,
        p.product_category,
        SUM(o.order_count) AS total_order,
        SUM(o.total_sales) AS total_revenue, 
        SUM(o.total_sales - (p.cost * o.order_count)) AS total_profit 
    FROM 
        orders_data AS o
    JOIN 
        product_data AS p
    ON 
        o.product_id = p.product_id
    GROUP BY 
        o.month, p.product_category
),
growth_metrics AS (
    SELECT 
        month,
        product_category,
        total_order,
        (total_order - LAG(total_order) OVER (PARTITION BY product_category ORDER BY month)) / LAG(total_order) OVER (PARTITION BY product_category ORDER BY month) * 100 AS order_growth,
        total_revenue,
        (total_revenue - LAG(total_revenue) OVER (PARTITION BY product_category ORDER BY month)) / LAG(total_revenue) OVER (PARTITION BY product_category ORDER BY month) * 100 AS revenue_growth,
        total_profit,
        (total_profit - LAG(total_profit) OVER (PARTITION BY product_category ORDER BY month)) / LAG(total_profit) OVER (PARTITION BY product_category ORDER BY month) * 100 AS profit_growth
    FROM 
        monthly_metrics
)

SELECT
    *
FROM 
    growth_metrics
WHERE
    month <> '2019-06'
ORDER BY
    month, product_category ASC;