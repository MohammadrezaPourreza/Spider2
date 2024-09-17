WITH salary_cleaned AS (
    SELECT 
        *,
        REPLACE(REPLACE(REPLACE(Salary, '/yr', ''), '₹', ''), ',', '') AS salary_clean
    FROM SalaryDataset
),
state_avg_salary AS (
    SELECT 
        location,
        companyname,
        AVG(CAST(salary_clean AS REAL)) AS avg_sal_state
    FROM salary_cleaned
    WHERE location IN ('Mumbai', 'Pune', 'New Delhi', 'Hyderabad')
    GROUP BY location, companyname
),
state_ranked AS (
    SELECT 
        location,
        companyname,
        avg_sal_state,
        ROW_NUMBER() OVER (PARTITION BY location ORDER BY avg_sal_state DESC) AS row_number
    FROM state_avg_salary
),
state_top5 AS (
    SELECT 
        location,
        companyname,
        avg_sal_state
    FROM state_ranked
    WHERE row_number <= 5
),
country_avg_salary AS (
    SELECT 
        companyname,
        ROUND(AVG(CAST(salary_clean AS REAL)), 2) AS avg_salary_final
    FROM salary_cleaned
    GROUP BY companyname
)
SELECT 
    state_top5.location,
    state_top5.companyname,
    state_top5.avg_sal_state,
    country_avg_salary.avg_salary_final AS avg_salary_country
FROM state_top5
JOIN country_avg_salary ON state_top5.companyname = country_avg_salary.companyname
