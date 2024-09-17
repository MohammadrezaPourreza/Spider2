WITH get_top_avg_composition AS (
    SELECT
        t1.month_year,
        t1.interest_id,
        t2.interest_name,
        ROUND((t1.composition / t1.index_value), 2) AS avg_composition,
        RANK() OVER (
            PARTITION BY month_year 
            ORDER BY ROUND((t1.composition / t1.index_value), 2) DESC
        ) AS rnk
    FROM
        interest_metrics AS t1
    JOIN
        interest_map AS t2
    ON 
        t2.id = t1.interest_id
    ORDER BY
        month_year, avg_composition DESC
),
get_moving_avg AS (
    SELECT
        month_year,
        interest_name,
        avg_composition AS max_index_composition,
        ROUND(AVG(avg_composition) OVER ( 
            ORDER BY substr(month_year, 4, 4) || '-' || substr(month_year, 1, 2)
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2) AS "3_month_moving_avg"
    FROM
        get_top_avg_composition
    WHERE
        rnk = 1
),
get_lag_avg AS (
    SELECT
        *,
        LAG(interest_name, 1) OVER (
            ORDER BY substr(month_year, 4, 4) || '-' || substr(month_year, 1, 2)
        ) AS interest_1_name,
        LAG(interest_name, 2) OVER (
            ORDER BY substr(month_year, 4, 4) || '-' || substr(month_year, 1, 2)
        ) AS interest_2_name,
        LAG(max_index_composition, 1) OVER (
            ORDER BY substr(month_year, 4, 4) || '-' || substr(month_year, 1, 2)
        ) AS interest_1_avg,
        LAG(max_index_composition, 2) OVER (
            ORDER BY substr(month_year, 4, 4) || '-' || substr(month_year, 1, 2)
        ) AS interest_2_avg
    FROM 
        get_moving_avg
)
SELECT
    month_year,
    interest_name,
    max_index_composition,
    "3_month_moving_avg",
    interest_1_avg AS "1_month_ago",
    interest_1_name AS "1_month_ago_interest_name",
    interest_2_avg AS "2_month_ago",
    interest_2_name AS "2_month_ago_interest_name"
FROM 
    get_lag_avg
WHERE
    substr(month_year, 4, 4) || '-' || substr(month_year, 1, 2) BETWEEN '2018-09' AND '2019-08';
