WITH patents_sample AS (               -- name of our table
SELECT 
  t1.publication_number, 
  t1.application_number 
FROM 
  `patents-public-data.patents.publications` t1 
WHERE 
  country_code = 'US'                                                        -- only consider US patents
  AND grant_date between 20180101 AND 20180131                               -- grant dates between 2002 and 2006
  AND grant_date != 0                                                        -- only consider granted patents
  AND publication_number LIKE '%B2%'                                         -- only consider patents with kind code B2
),
interim_table AS (
    SELECT
        t1.publication_number,
        SUBSTR(ipc_u.code, 0, 4) AS ipc4,
        COUNT(SUBSTR(ipc_u.code, 0, 4)) AS ipc4_count
    FROM
        patents-public-data.patents.publications t1,
        UNNEST(ipc) AS ipc_u
    GROUP BY
        t1.publication_number,
        ipc4
),
chosen_ipc4_view AS (
    SELECT
        *
    FROM
        interim_table
    WHERE
        CONCAT(interim_table.publication_number, interim_table.ipc4_count) IN (
            SELECT
                CONCAT(publication_number, MAX(ipc4_count))
            FROM
                interim_table
            GROUP BY
                publication_number
        )
    ORDER BY
        ipc4_count DESC
),
ipc_counts AS (
  SELECT
    t1.publication_number,
    t3.ipc4,
    COUNT(t3.ipc4) AS ipc_occurrences
  FROM
    patents_sample t1
    -- joins backward citations
  LEFT JOIN (
    SELECT
      x2.publication_number AS citing_publication_number,
      citation_u.publication_number AS backward_citation
    FROM
      patents-public-data.patents.publications x2,
      UNNEST(citation) AS citation_u) t2
  ON
    t2.citing_publication_number = t1.publication_number
    -- joins 4-digit ipc codes of backward citations
  LEFT JOIN
    chosen_ipc4_view t3
  ON
    t3.publication_number = t2.backward_citation
  GROUP BY
    t1.publication_number,
    t3.ipc4
),
max_originality AS (
  SELECT
    publication_number,
    1 - SUM(POWER(ipc_occurrences, 2)) / POWER(SUM(ipc_occurrences), 2) AS originality
  FROM
    ipc_counts
  GROUP BY
    publication_number
  HAVING
    SUM(ipc_occurrences) > 0
  ORDER BY
    originality DESC
  LIMIT 1
)
SELECT 
  publication_number
FROM 
  max_originality
