SELECT
  COUNT(*) AS total_count
FROM
  `bigquery-public-data.idc_v11.dicom_pivot_v11` dicom_pivot_v11
WHERE
  StudyInstanceUID IN (
    SELECT
      StudyInstanceUID
    FROM
      `bigquery-public-data.idc_v11.dicom_pivot_v11` dicom_pivot_v11
    WHERE
      StudyInstanceUID IN (
        SELECT
          StudyInstanceUID
        FROM
          `bigquery-public-data.idc_v11.dicom_pivot_v11` dicom_pivot_v11
        WHERE
          (
            LOWER(
              dicom_pivot_v11.SegmentedPropertyTypeCodeSequence
            ) LIKE LOWER('80891009:SCT')
          )
        GROUP BY
          StudyInstanceUID
        INTERSECT DISTINCT
        SELECT
          StudyInstanceUID
        FROM
          `bigquery-public-data.idc_v11.dicom_pivot_v11` dicom_pivot_v11
        WHERE
          (
            dicom_pivot_v11.collection_id IN ('Community', 'nsclc_radiomics')
          )
        GROUP BY
          StudyInstanceUID
      )
    GROUP BY
      StudyInstanceUID
  );