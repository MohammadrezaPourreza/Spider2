WITH
table1 AS (
    SELECT
        histological_type AS data1,
        bcr_patient_barcode AS ParticipantBarcode
    FROM pancancer-atlas.Filtered.clinical_PANCAN_patient_with_followup_filtered
    WHERE acronym = 'BRCA' AND histological_type IS NOT NULL      
),
table2 AS (
    SELECT
        Hugo_Symbol AS symbol, 
        ParticipantBarcode
    FROM pancancer-atlas.Filtered.MC3_MAF_V5_one_per_tumor_sample
    WHERE Study = 'BRCA' AND Hugo_Symbol = 'CDH1'
          AND FILTER = 'PASS'  
    GROUP BY
        ParticipantBarcode, symbol
),
summ_table AS (
    SELECT 
        n1.data1,
        IF(n2.ParticipantBarcode IS NULL, 'NO', 'YES') AS data2,
        COUNT(*) AS Nij
    FROM
        table1 AS n1
    LEFT JOIN
        table2 AS n2 ON n1.ParticipantBarcode = n2.ParticipantBarcode
    GROUP BY
        n1.data1, data2
),
percentages AS (
    SELECT
        data1,
        SUM(CASE WHEN data2 = 'YES' THEN Nij ELSE 0 END) AS mutation_count,
        SUM(Nij) AS total,
        SUM(CASE WHEN data2 = 'YES' THEN Nij ELSE 0 END) / SUM(Nij) AS mutation_percentage
    FROM summ_table
    GROUP BY data1
)
SELECT data1 AS Histological_Type
FROM percentages
ORDER BY mutation_percentage DESC
LIMIT 1;