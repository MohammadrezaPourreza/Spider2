with median_income_by_geo as (
    select
        geo_id
        , median_income 
    from `bigquery-public-data.census_bureau_acs.censustract_2018_5yr`
)

, donations_by_zip as (
    select
        zip_code
        , transaction_amt
    from `bigquery-public-data.fec.indiv20` 
    where state = 'NY'
)

, zip_to_geo as (
    select
        zip_code
        , census_tract_geoid 
    from `bigquery-public-data.hud_zipcode_crosswalk.zipcode_to_census_tracts`
)

, avg_donations_by_geo_id as (
    select
        zip_to_geo.census_tract_geoid as geo_id
        , sum(donations_by_zip.transaction_amt) as average_donation
    from donations_by_zip
    join zip_to_geo
    on zip_to_geo.zip_code = donations_by_zip.zip_code
    group by 1
)

, census_tracts_kings as (
    select 
        geo_id
        , tract_ce
        , tract_geom
    from `bigquery-public-data.geo_census_tracts.census_tracts_new_york`
    where county_fips_code = '047'
    and state_fips_code = '36'
)

select 
    census_tracts_kings.tract_ce as census_tract
    , avg_donations_by_geo_id.average_donation
    , median_income_by_geo.median_income
from 
    census_tracts_kings
    LEFT JOIN avg_donations_by_geo_id  
    ON census_tracts_kings.geo_id = avg_donations_by_geo_id.geo_id
    LEFT join median_income_by_geo
    on census_tracts_kings.geo_id = median_income_by_geo.geo_id
order by census_tract;