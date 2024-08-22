WITH patents_sample AS (               -- name of our table
SELECT 
  t1.publication_number, 
  t1.application_number 
FROM 
  `patents-public-data.patents.publications` t1 
WHERE 
  country_code = 'US'                                                        -- only consider US patents
  AND grant_date between 20100101 AND 20100131                               -- grant dates between 2002 and 2006
  AND grant_date != 0                                                        -- only consider granted patents
  AND publication_number LIKE '%B2%'                                         -- only consider patents with kind code B2
),
Forward_citation AS (
     SELECT
     DISTINCT patents_sample.publication_number,
     COUNT(DISTINCT t3.citing_application_number) AS forward_citations
     FROM
     patents_sample
     LEFT JOIN (
     SELECT
     x2.publication_number,
     PARSE_DATE('%Y%m%d', CAST(x2.filing_date AS STRING)) AS filing_date
     FROM
     `patents-public-data.patents.publications` x2
     WHERE
     x2.filing_date != 0) t2
     ON
     t2.publication_number = patents_sample.publication_number
     LEFT JOIN (
     SELECT
     x3.publication_number AS citing_publication_number,
     x3.application_number AS citing_application_number,
     PARSE_DATE('%Y%m%d', CAST(x3.filing_date AS STRING)) AS joined_filing_date,
     citation_u.publication_number AS cited_publication_number
     FROM
     `patents-public-data.patents.publications` x3,
     UNNEST(citation) AS citation_u
     WHERE
     x3.filing_date!=0) t3
     ON
     patents_sample.publication_number = t3.cited_publication_number
     AND t3.joined_filing_date BETWEEN t2.filing_date
     AND DATE_ADD(t2.filing_date, INTERVAL 10 YEAR)
     GROUP BY
     patents_sample.publication_number
)

SELECT 
     publication_number
FROM
     Forward_citation
ORDER BY
  forward_citations
DESC
LIMIT 1