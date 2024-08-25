WITH density_data AS (
  SELECT 
    reference_name, 
    COUNT(reference_name) / r.length AS variant_density, 
    COUNT(reference_name) AS variant_count, 
    r.length AS reference_length 
  FROM 
    `bigquery-public-data.genomics_cannabis.MNPR01_201703` v, 
    `bigquery-public-data.genomics_cannabis.MNPR01_reference_201703` r 
  WHERE 
    v.reference_name= r.name 
    AND EXISTS ( 
      SELECT 
        1 
      FROM 
        UNNEST(v.call) AS call 
      WHERE 
        EXISTS ( 
          SELECT 
            1 
          FROM 
            UNNEST(call.genotype) AS gt 
          WHERE 
            gt > 0)) 
  GROUP BY 
    reference_name, 
    r.length
) 
SELECT 
  *
FROM
  density_data
ORDER BY 
  reference_length DESC, 
  reference_name
LIMIT 1;