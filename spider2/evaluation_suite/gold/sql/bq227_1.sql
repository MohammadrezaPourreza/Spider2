WITH top5_vs_other_minor_cat AS (
  SELECT year, month, minor_category,
       CASE 
        WHEN minor_category IN (SELECT minor_category
                                  FROM (SELECT minor_category, SUM(value) AS total
                                    FROM bigquery-public-data.london_crime.crime_by_lsoa
                                    GROUP BY 1
                                    ORDER BY 2 DESC
                                    LIMIT 5))
                            THEN 'Top 5' 
        ELSE 'Other Minor Categories'-- Dividing the data into 'Top 5' and 'Other Minor Categories'
       END AS division,
       SUM(value) AS total
  FROM bigquery-public-data.london_crime.crime_by_lsoa
    GROUP BY 1,2,3
    ORDER BY 3 DESC
),
top5_percentage AS (
  SELECT 
    year, 
    division, 
    year_total / SUM(year_total) OVER (PARTITION BY year) * 100 AS percentage 
  FROM 
    (
      SELECT 
        year, division, SUM(total) AS year_total
      FROM 
        top5_vs_other_minor_cat
      GROUP BY 1,2
      ORDER BY 1
    )
)
SELECT
  year,
  percentage
FROM 
  top5_percentage
WHERE division = 'Top 5'
ORDER BY year;