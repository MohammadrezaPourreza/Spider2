with utah_fips AS
   (
        SELECT
            state_fips_code
        FROM
            `bigquery-public-data.census_utility.fips_codes_states`
        WHERE
            state_name = "Utah"
    ),

utah_zip AS
    (
        SELECT
            z.zip_code
        FROM
            `bigquery-public-data.geo_us_boundaries.zip_codes` z, utah_fips u
        WHERE
            z.state_fips_code = u.state_fips_code
    ),

locations AS
    (
        SELECT
            COUNT(i.institution_name) AS count_locations,
            l.zip_code
        FROM
            utah_zip z
        JOIN
            `bigquery-public-data.fdic_banks.locations` l USING (zip_code)
        JOIN
            `bigquery-public-data.fdic_banks.institutions` i USING (fdic_certificate_number)
        WHERE
            l.state IS NOT NULL
            AND l.state_name IS NOT NULL
            AND l.zip_code = z.zip_code
        GROUP BY 2
    ),

    acs_2017 AS 
        (
            SELECT
                CAST(geo_id as STRING) AS zip_code,
                ROUND(SAFE_DIVIDE(employed_pop, pop_16_over), 4) AS rate_employment,
            FROM
                `bigquery-public-data.census_bureau_acs.zip_codes_2017_5yr`
            JOIN
                utah_zip 
            ON 
                geo_id = zip_code
        )

SELECT
    rate_employment
FROM
  utah_zip z
JOIN
  locations l USING (zip_code)
JOIN
  acs_2017 acs USING (zip_code)
ORDER BY
  l.count_locations ASC
LIMIT 1;
