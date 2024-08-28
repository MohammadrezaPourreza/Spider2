WITH modality_counts AS (
  SELECT
    Modality,
    COUNT(*) AS frequency
  FROM
    `bigquery-public-data.idc_v15.dicom_pivot` dicom_pivot
  WHERE
    StudyInstanceUID IN (
      SELECT
        StudyInstanceUID
      FROM
        `bigquery-public-data.idc_v15.dicom_pivot` dicom_pivot
      WHERE
        collection_id IN ('Community', 'nsclc_radiomics')
      GROUP BY
        StudyInstanceUID
    )
  GROUP BY
    Modality
)

SELECT
  Modality
FROM
  modality_counts
ORDER BY
  frequency DESC
LIMIT 1;