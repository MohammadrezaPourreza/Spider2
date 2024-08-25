WITH patents_sample AS (
    SELECT publication_number, application_number
    FROM
        `patents-public-data.patents.publications`
    WHERE
    publication_number = 'US-9023721-B2'
),
t AS (
    SELECT
        t1.publication_number,
        t4.publication_number AS similar_publication_number,
        (SELECT SUM(element1 * element2)
         FROM t5.embedding_v1 element1 WITH OFFSET pos
         JOIN t6.embedding_v1 element2 WITH OFFSET pos USING (pos)) AS similarity
    FROM 
        (SELECT * FROM patents_sample LIMIT 1) t1
    LEFT JOIN (
        SELECT 
            x3.publication_number,
            EXTRACT(YEAR FROM PARSE_DATE('%Y%m%d', CAST(x3.filing_date AS STRING))) AS focal_filing_year
        FROM 
            `patents-public-data.patents.publications` x3
        WHERE 
            x3.filing_date != 0
    ) t3 ON t3.publication_number = t1.publication_number
    LEFT JOIN (
        SELECT 
            x4.publication_number,
            EXTRACT(YEAR FROM PARSE_DATE('%Y%m%d', CAST(x4.filing_date AS STRING))) AS filing_year
        FROM 
            `patents-public-data.patents.publications` x4
        WHERE 
            x4.filing_date != 0
    ) t4 ON
    t4.publication_number != t1.publication_number
    AND t3.focal_filing_year = t4.filing_year
    LEFT JOIN `patents-public-data.google_patents_research.publications` t5 ON t5.publication_number = t1.publication_number
    LEFT JOIN `patents-public-data.google_patents_research.publications` t6 ON t6.publication_number = t4.publication_number
    ORDER BY 
        t1.publication_number, similarity DESC
)
SELECT
    t.similar_publication_number,
    t.similarity
FROM (
    SELECT
        t.*,
        ROW_NUMBER() OVER (PARTITION BY publication_number ORDER BY similarity DESC) AS seqnum
    FROM
        t
) t
WHERE
    seqnum <= 5;


