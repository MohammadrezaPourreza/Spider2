SELECT metric, ROUND(AVG(percent_change), 2) AS avg_percent_change
FROM (
    SELECT 'region' AS metric,
           LOWER(region) AS value,
           before_effect,
           after_effect,
           after_effect - before_effect AS change,
           ROUND(((after_effect * 1.0 / before_effect) - 1) * 100, 2) AS percent_change
    FROM (
        SELECT region,
               SUM(CASE WHEN delta_weeks BETWEEN 1 AND 12 THEN sales END) AS after_effect,
               SUM(CASE WHEN delta_weeks BETWEEN -11 AND 0 THEN sales END) AS before_effect
        FROM (
            SELECT region,
                   week_date,
                   ROUND((JULIANDAY(week_date) - JULIANDAY('2020-06-15')) / 7.0) + 1 AS delta_weeks,
                   sales 
            FROM cleaned_weekly_sales
        ) add_delta_weeks
        GROUP BY region
    ) AS add_before_after

    UNION ALL 

    SELECT 'platform' AS metric,
           LOWER(platform) AS value,
           before_effect,
           after_effect,
           after_effect - before_effect AS change,
           ROUND(((after_effect * 1.0 / before_effect) - 1) * 100, 2) AS percent_change
    FROM (
        SELECT platform,
               SUM(CASE WHEN delta_weeks BETWEEN 1 AND 12 THEN sales END) AS after_effect,
               SUM(CASE WHEN delta_weeks BETWEEN -11 AND 0 THEN sales END) AS before_effect
        FROM (
            SELECT platform,
                   week_date,
                   ROUND((JULIANDAY(week_date) - JULIANDAY('2020-06-15')) / 7.0) + 1 AS delta_weeks,
                   sales 
            FROM cleaned_weekly_sales
        ) add_delta_weeks
        GROUP BY platform
    ) AS add_before_after

    UNION ALL 

    SELECT 'age_band' AS metric,
           LOWER(age_band) AS value,
           before_effect,
           after_effect,
           after_effect - before_effect AS change,
           ROUND(((after_effect * 1.0 / before_effect) - 1) * 100, 2) AS percent_change
    FROM (
        SELECT age_band,
               SUM(CASE WHEN delta_weeks BETWEEN 1 AND 12 THEN sales END) AS after_effect,
               SUM(CASE WHEN delta_weeks BETWEEN -11 AND 0 THEN sales END) AS before_effect
        FROM (
            SELECT age_band,
                   week_date,
                   ROUND((JULIANDAY(week_date) - JULIANDAY('2020-06-15')) / 7.0) + 1 AS delta_weeks,
                   sales 
            FROM cleaned_weekly_sales
        ) add_delta_weeks
        GROUP BY age_band
    ) AS add_before_after

    UNION ALL 

    SELECT 'demographic' AS metric,
           LOWER(demographic) AS value,
           before_effect,
           after_effect,
           after_effect - before_effect AS change,
           ROUND(((after_effect * 1.0 / before_effect) - 1) * 100, 2) AS percent_change
    FROM (
        SELECT demographic,
               SUM(CASE WHEN delta_weeks BETWEEN 1 AND 12 THEN sales END) AS after_effect,
               SUM(CASE WHEN delta_weeks BETWEEN -11 AND 0 THEN sales END) AS before_effect
        FROM (
            SELECT demographic,
                   week_date,
                   ROUND((JULIANDAY(week_date) - JULIANDAY('2020-06-15')) / 7.0) + 1 AS delta_weeks,
                   sales 
            FROM cleaned_weekly_sales
        ) add_delta_weeks
        GROUP BY demographic
    ) AS add_before_after

    UNION ALL 

    SELECT 'customer_type' AS metric,
           LOWER(customer_type) AS value,
           before_effect,
           after_effect,
           after_effect - before_effect AS change,
           ROUND(((after_effect * 1.0 / before_effect) - 1) * 100, 2) AS percent_change
    FROM (
        SELECT customer_type,
               SUM(CASE WHEN delta_weeks BETWEEN 1 AND 12 THEN sales END) AS after_effect,
               SUM(CASE WHEN delta_weeks BETWEEN -11 AND 0 THEN sales END) AS before_effect
        FROM (
            SELECT customer_type,
                   week_date,
                   ROUND((JULIANDAY(week_date) - JULIANDAY('2020-06-15')) / 7.0) + 1 AS delta_weeks,
                   sales 
            FROM cleaned_weekly_sales
        ) add_delta_weeks
        GROUP BY customer_type
    ) AS add_before_after
) AS tmp
GROUP BY metric
ORDER BY avg_percent_change
LIMIT 1;
