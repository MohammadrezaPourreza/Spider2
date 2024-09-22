WITH zip_stats AS (
    SELECT
        YEAR(ts.date) AS year,
        ts.geo_id AS zip,
        rship.related_geo_name AS state,
        ts.value AS population,
        LAG(ts.value, 1) OVER (PARTITION BY zip ORDER BY year ASC) AS prev_year_population,
        population / prev_year_population - 1 AS pct_growth,
        population - prev_year_population AS absolute_change
    FROM GLOBAL_GOVERNMENT.CYBERSYN.american_community_survey_timeseries AS ts
    JOIN GLOBAL_GOVERNMENT.CYBERSYN.american_community_survey_attributes AS att
        ON ts.variable = att.variable
    JOIN GLOBAL_GOVERNMENT.CYBERSYN.geography_index AS geo
        ON ts.geo_id = geo.geo_id
    JOIN GLOBAL_GOVERNMENT.CYBERSYN.geography_relationships AS rship
        ON ts.geo_id = rship.geo_id AND rship.related_level = 'State'
    WHERE
        att.series_type = 'Total Population'
        AND att.measurement_type = 'Estimate'
        AND att.measurement_period = '5YR'
        AND geo.level = 'CensusZipCodeTabulationArea'
        AND ts.value > 25000
)

SELECT
    year,
    zip,
    state,
    pct_growth AS growth_percentage
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY pct_growth DESC NULLS LAST) AS annual_rank
    FROM zip_stats
    WHERE year BETWEEN 2015 AND 2020
)
WHERE annual_rank = 2
ORDER BY year;