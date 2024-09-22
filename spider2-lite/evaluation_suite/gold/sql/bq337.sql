WITH p1 AS (
    select *
    FROM
    `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
    WHERE
        gender IS NULL AND minimum_age IS NULL AND maximum_age IS NULL
),
p2 AS (
    select *
    FROM
    `bigquery-public-data.census_bureau_usa.population_by_zip_2000`
    WHERE
        gender = "" AND minimum_age IS NULL AND maximum_age IS NULL
),
ranking AS (
    SELECT
        p1.zipcode,
        ROUND((p1.population - p2.population) / NULLIF(p2.population, 0) * 100, 2) AS pop_pct_chg
    FROM p1 INNER join p2 on p1.zipcode = p2.zipcode
    ORDER BY
    pop_pct_chg DESC
    LIMIT 1
)
SELECT ranking.zipcode FROM ranking;