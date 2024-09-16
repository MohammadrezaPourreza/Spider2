WITH morbidity_2018 AS (
  SELECT County_of_Residence_FIPS AS FIPS, Births AS Morbidity_Births, County_of_Residence
  FROM `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality_by_maternal_morbidity` 
  WHERE Maternal_Morbidity_YN = 0 AND Year = '2018-01-01'
),

births_2018 AS (
  SELECT County_of_Residence_FIPS AS FIPS, Births
  FROM `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality`
  WHERE Year = '2018-01-01'
),

acs_2017 AS (
  SELECT geo_id, poverty, total_pop
  FROM `bigquery-public-data.census_bureau_acs.county_2017_5yr`
),
 
maternal_morbidity AS (
  SELECT morbidity_2018.FIPS, ROUND((Morbidity_Births/Births)*100,2) AS Mbdy_pcnt, County_of_Residence
  FROM morbidity_2018
  JOIN births_2018
  ON morbidity_2018.FIPS = births_2018.FIPS
),
 
corr_tbl AS (
  SELECT
   acs_2017.geo_id, ROUND((poverty/total_pop)*100,2) AS percent_poverty, 
   Mbdy_pcnt, County_of_Residence
   FROM acs_2017
   JOIN maternal_morbidity
   ON acs_2017.geo_id = maternal_morbidity.FIPS
)
  
SELECT CORR(percent_poverty, Mbdy_pcnt) AS pearson_correlation
FROM corr_tbl;
