WITH county_map AS (
    SELECT
        geo_id,
        geo_name,
        related_geo_id,
        related_geo_name
    FROM US_REAL_ESTATE.CYBERSYN.geography_relationships
    WHERE geo_name = 'Phoenix-Mesa-Scottsdale, AZ Metro Area'
    AND related_level = 'County'
), 
gross_income_data AS (
    SELECT
        geo_id,
        date,
        SUM(value) AS gross_income_inflow
    FROM US_REAL_ESTATE.CYBERSYN.irs_origin_destination_migration_timeseries AS ts
    JOIN county_map ON (county_map.related_geo_id = ts.to_geo_id)
    WHERE ts.variable_name = 'Adjusted Gross Income'
    GROUP BY geo_id, date
), 
home_price_data AS (
    SELECT LAST_DAY(date, 'year') AS end_date, AVG(value) AS home_price_index
    FROM US_REAL_ESTATE.CYBERSYN.fhfa_house_price_timeseries AS ts
    JOIN US_REAL_ESTATE.CYBERSYN.fhfa_house_price_attributes AS att
        ON (ts.variable = att.variable)
    WHERE geo_id IN (SELECT geo_id FROM county_map)
      AND att.index_type = 'purchase-only'
      AND att.seasonally_adjusted = TRUE
    GROUP BY end_date
),
combined_data AS (
    SELECT
        gid.date,
        gid.gross_income_inflow,
        hpi.home_price_index
    FROM gross_income_data AS gid
    JOIN home_price_data AS hpi ON (gid.date = hpi.end_date)
),
aggregated_data AS (
    SELECT
        MIN(date) AS first_year,
        MAX(date) AS last_year
    FROM combined_data
),
summary_data AS (
    SELECT
        first_year,
        last_year,
        first_income.gross_income_inflow AS first_year_income,
        last_income.gross_income_inflow AS last_year_income,
        first_index.home_price_index AS first_year_index,
        last_index.home_price_index AS last_year_index
    FROM aggregated_data AS ad
    JOIN combined_data AS first_income ON (first_income.date = ad.first_year)
    JOIN combined_data AS last_income ON (last_income.date = ad.last_year)
    JOIN combined_data AS first_index ON (first_index.date = ad.first_year)
    JOIN combined_data AS last_index ON (last_index.date = ad.last_year)
)
SELECT
    ((last_year_income - first_year_income) / first_year_income) * 100 AS income_growth_percent,
    ((last_year_index - first_year_index) / first_year_index) * 100 AS index_growth_percent
FROM summary_data;