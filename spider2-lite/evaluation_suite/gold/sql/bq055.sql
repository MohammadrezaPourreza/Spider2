WITH google_data AS (
    SELECT
        'Google Hiring' AS data_source,
        race_asian,
        race_black,
        race_hispanic_latinx,
        race_native_american,
        race_white,
    FROM `bigquery-public-data.google_dei.dar_non_intersectional_hiring`
    WHERE
        workforce = 'overall'
        AND report_year = 2023
),

bls_data AS (
    SELECT
        percent_asian AS race_asian,
        percent_black_or_african_american AS race_black,
        percent_hispanic_or_latino AS race_hispanic_latinx,
        NULL AS race_native_american,
        percent_white AS race_white,
    FROM `bigquery-public-data.bls.cpsaat18`
    WHERE year = 2022
          AND ((subsector IN (
                  'Internet publishing and broadcasting and web search portals',
                  'Software publishers',
                  'Data processing, hosting, and related services')
                AND industry_group IS NULL
                AND industry IS NULL)
              OR (industry_group = 'Computer systems design and related services'
                AND industry IS NULL))
),

bls_averages AS (
    SELECT
        AVG(race_asian) AS avg_race_asian,
        AVG(race_black) AS avg_race_black,
        AVG(race_hispanic_latinx) AS avg_race_hispanic_latinx,
        AVG(race_native_american) AS avg_race_native_american,
        AVG(race_white) AS avg_race_white
    FROM bls_data
),

google_bl_difference AS (
    SELECT
        'asian' AS race,
        ABS(google.race_asian - bls.avg_race_asian) AS diff
    FROM google_data google, bls_averages bls
    UNION ALL
    SELECT
        'black' AS race,
        ABS(google.race_black - bls.avg_race_black) AS diff
    FROM google_data google, bls_averages bls
    UNION ALL
    SELECT
        'hispanic_latinx' AS race,
        ABS(google.race_hispanic_latinx - bls.avg_race_hispanic_latinx) AS diff
    FROM google_data google, bls_averages bls
    UNION ALL
    SELECT
        'native_american' AS race,
        ABS(google.race_native_american - bls.avg_race_native_american) AS diff
    FROM google_data google, bls_averages bls
    UNION ALL
    SELECT
        'white' AS race,
        ABS(google.race_white - bls.avg_race_white) AS diff
    FROM google_data google, bls_averages bls
)

SELECT
    race,
    diff
FROM google_bl_difference
ORDER BY diff DESC
LIMIT 3;