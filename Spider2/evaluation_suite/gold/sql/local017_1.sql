WITH AnnualTotals AS (
    SELECT 
        STRFTIME('%Y', collision_date) AS Year, 
        COUNT(case_id) AS AnnualTotal
    FROM 
        collisions
    GROUP BY 
        Year
),
CategoryTotals AS (
    SELECT 
        STRFTIME('%Y', collision_date) AS Year,
        pcf_violation_category AS Category,
        COUNT(case_id) AS Subtotal
    FROM 
        collisions
    GROUP BY 
        Year, Category
),
CategoryPercentages AS (
    SELECT 
        ct.Year,
        ct.Category,
        ROUND((ct.Subtotal * 100.0) / at.AnnualTotal, 1) AS PercentageOfAnnualRoadIncidents
    FROM 
        CategoryTotals ct
    JOIN 
        AnnualTotals at ON ct.Year = at.Year
),
RankedCategories AS (
    SELECT
        Year,
        Category,
        PercentageOfAnnualRoadIncidents,
        ROW_NUMBER() OVER (PARTITION BY Year ORDER BY PercentageOfAnnualRoadIncidents DESC) AS Rank
    FROM
        CategoryPercentages
),
TopCategories AS (
SELECT 
    Year, 
    Category, 
    PercentageOfAnnualRoadIncidents
FROM 
    RankedCategories
WHERE
    Rank = 1
)

SELECT 
    (SELECT PercentageOfAnnualRoadIncidents FROM TopCategories WHERE Year = '2011') - 
    (SELECT PercentageOfAnnualRoadIncidents FROM TopCategories WHERE Year = '2021') AS PercentageDecrease;
