SELECT
  t1.zip5 AS zip5,
  t1.provider_cnt AS provider_count,
  t2.population AS population,
  ROUND(t1.provider_cnt / NULLIF(t2.population,0),2) AS ratio
FROM (
  (SELECT
    CASE
      WHEN LENGTH(nppes_provider_zip)=5 THEN nppes_provider_zip
      WHEN LENGTH(nppes_provider_zip)=9 THEN SUBSTR(nppes_provider_zip,0,5)
      ELSE '0'
    END AS zip5,
    COUNT(*) AS provider_cnt
  FROM
    `bigquery-public-data.cms_medicare.physicians_and_other_supplier_2012`
  WHERE
    REGEXP_CONTAINS(nppes_credentials, r'(\W|^)[mM]\.*[Dd]')
  GROUP BY
    zip5 ) AS t1
  INNER JOIN (
  SELECT
    population,
    zipcode
  FROM
    `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
  WHERE
    population > 1000) AS t2 --limit to populations > 1000 to avoid any oddities that occur with very small zipcodes
  ON
  t2.zipcode=t1.zip5)
ORDER BY
  ratio DESC
limit 10