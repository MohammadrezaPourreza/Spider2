WITH patents_sample AS (               -- name of our table
SELECT 
  t1.publication_number, 
  t1.application_number 
FROM 
  patents-public-data.patents.publications t1 
WHERE 
  country_code = 'US'                                                        -- only consider US patents
  AND grant_date between 20080101 AND 20080131                               -- grant dates between 2002 and 2006
  AND grant_date != 0                                                        -- only consider granted patents
  AND publication_number LIKE '%B2%'                                         -- only consider patents with kind code B2
),

family_number AS (
SELECT
  t1.publication_number,
  -- count distinct application numbers sharing same family id with our focal patents
  COUNT(DISTINCT t3.application_number) AS family_size,
FROM
  patents_sample t1
  -- join publications table to obtain family id of our focal patents
LEFT JOIN
  patents-public-data.patents.publications t2
ON
  t1.publication_number = t2.publication_number
  -- join publications table on family id to get all publications sharing the same family id
LEFT JOIN
  patents-public-data.patents.publications t3
ON
  t2.family_id = t3.family_id
GROUP BY
  t1.publication_number
)

SELECT COUNT(*) FROM family_number WHERE family_size>300