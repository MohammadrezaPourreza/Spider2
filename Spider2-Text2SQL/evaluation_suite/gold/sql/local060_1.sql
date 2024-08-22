WITH prod_sales AS (
    SELECT 
        s.prod_id,
        SUM(s.amount_sold) AS total_sales,
        RANK() OVER (ORDER BY SUM(s.amount_sold) DESC) AS rank
    FROM sales s
    JOIN customers c ON s.cust_id = c.cust_id
    JOIN channels ch ON s.channel_id = ch.channel_id
    JOIN products p ON s.prod_id = p.prod_id
    JOIN times t ON s.time_id = t.time_id
    WHERE 
            s.promo_id = 999 
        AND c.cust_city_id IN (
            SELECT cust_city_id
            FROM (
                SELECT 
                    cust_city_id,
                    (new_cust_sales - old_cust_sales) / old_cust_sales AS pct_change,
                    old_cust_sales
                FROM (
                    SELECT 
                        cust_city_id,
                        SUM(CASE WHEN t.calendar_quarter_id = 1776 THEN s.amount_sold ELSE 0 END) AS new_cust_sales,
                        SUM(CASE WHEN t.calendar_quarter_id = 1772 THEN s.amount_sold ELSE 0 END) AS old_cust_sales
                    FROM sales s
                    JOIN customers c ON s.cust_id = c.cust_id
                    JOIN channels ch ON s.channel_id = ch.channel_id
                    JOIN products p ON s.prod_id = p.prod_id
                    JOIN times t ON s.time_id = t.time_id
                    WHERE 
                            c.country_id = 52790 
                        AND s.promo_id = 999 
                        AND (t.calendar_quarter_id = 1776 OR t.calendar_quarter_id = 1772)
                    GROUP BY cust_city_id
                ) cust_sales
                WHERE old_cust_sales > 0
            )
            WHERE pct_change >= 0.20
        )
    GROUP BY s.prod_id
),
top_prod_sales AS (
    SELECT prod_id
    FROM prod_sales
    WHERE rank <= (SELECT COUNT(*) * 0.2 FROM prod_sales)
),
total_sales AS (
    SELECT 
        SUM(CASE WHEN t.calendar_quarter_id = 1776 THEN s.amount_sold ELSE 0 END) AS new_tot_sales,
        SUM(CASE WHEN t.calendar_quarter_id = 1772 THEN s.amount_sold ELSE 0 END) AS old_tot_sales
    FROM sales s
    JOIN times t ON s.time_id = t.time_id
    JOIN channels ch ON s.channel_id = ch.channel_id
    JOIN customers c ON s.cust_id = c.cust_id
    JOIN countries co ON c.country_id = co.country_id
    JOIN products p ON s.prod_id = p.prod_id
    WHERE  
            co.country_total_id = 52806 
        AND s.promo_id = 999 
        AND (t.calendar_quarter_id = 1776 OR t.calendar_quarter_id = 1772)
),
prod_sales_change AS (
    SELECT 
        s.prod_id,
        SUM(CASE WHEN t.calendar_quarter_id = 1776 THEN s.amount_sold ELSE 0 END) AS new_subset_sales,
        SUM(CASE WHEN t.calendar_quarter_id = 1772 THEN s.amount_sold ELSE 0 END) AS old_subset_sales,
        ((SUM(CASE WHEN t.calendar_quarter_id = 1776 THEN s.amount_sold ELSE 0 END) / (SELECT new_tot_sales FROM total_sales)) - 
         (SUM(CASE WHEN t.calendar_quarter_id = 1772 THEN s.amount_sold ELSE 0 END) / (SELECT old_tot_sales FROM total_sales))) * 100 AS share_change
    FROM sales s
    JOIN customers c ON s.cust_id = c.cust_id
    JOIN countries co ON c.country_id = co.country_id
    JOIN channels ch ON s.channel_id = ch.channel_id
    JOIN times t ON s.time_id = t.time_id
    WHERE 
            co.country_total_id = 52806 
        AND s.promo_id = 999 
        AND (t.calendar_quarter_id = 1776 OR t.calendar_quarter_id = 1772) 
        AND s.prod_id IN (SELECT prod_id FROM top_prod_sales)
    GROUP BY s.prod_id
)
SELECT 
    MAX(share_change) - MIN(share_change) AS difference
FROM prod_sales_change;