WITH get_month_count AS (
    SELECT
        strftime('%Y-%m', insert_date) AS single_month,
        COUNT(*) AS monthly_count
    FROM 
        cities
    WHERE 
        strftime('%Y', insert_date) = '2021'
    GROUP BY 
        single_month
    ORDER BY 
        single_month
),
get_running_total AS (
    SELECT
        single_month,
        monthly_count,
        SUM(monthly_count) OVER (ORDER BY single_month) AS total_num_cities
    FROM
        get_month_count
),
get_month_over_month AS (
    SELECT
        single_month,
        monthly_count,
        total_num_cities,
        ROUND(
            100.0 * (total_num_cities - LAG(total_num_cities, 1) OVER (ORDER BY single_month)) / 
            (LAG(total_num_cities, 1) OVER (ORDER BY single_month) * 1.0), 
            2
        ) AS month_over_month
    FROM
        get_running_total
)
SELECT
    strftime('%Y-%m', single_month || '-01') AS year_month,
    monthly_count AS cities_inserted,
    total_num_cities AS running_total,
    ROUND(month_over_month, 2) || '%' AS month_over_month
FROM
    get_month_over_month;