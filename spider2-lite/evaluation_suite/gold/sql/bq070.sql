-- First, create subqueries to facilitate data selection from the dicom_all table.
-- Several DICOM attributes are renamed to be more intuitive
-- (e.g. 'TotalPixelMatrixColumns' is renamed to 'width').
WITH
  -- The 'sm_images' subquery summarizes basic metadata of slide microscopy images (SM).
  sm_images AS (
    SELECT
      -- digital_slide_id: unique numeric identifier of a digital slide, i.e., a digital image of a physical slide.
      SeriesInstanceUID AS digital_slide_id, 
      -- case_id: unique numeric identifier of the study in the context of which the ditial slide was created.
      StudyInstanceUID AS case_id,
      -- physical_slide_id: unique numeric identifier of the physical slide as prepared in the wet lab. 
      ContainerIdentifier AS physical_slide_id,
      -- patient_id: unique numeric identifier of the patient from whose tissue the physical slide was obtained.
      PatientID AS patient_id,
      -- width: image width in pixels.
      TotalPixelMatrixColumns AS width, 
      -- height: image height in pixels. 
      TotalPixelMatrixRows AS height,
      -- collection_id: numeric or character sequence describing the dataset the physical slide is part of.
      collection_id,
      -- crdc_instance_uuid: universally unique identifier of the DICOM instance.
      crdc_instance_uuid,
      -- gcs_url: GCS URL needed to access the DICOM file
      gcs_url, 
      -- pixel_spacing: image pixel spacing in mm/px 
      CAST(SharedFunctionalGroupsSequence[SAFE_OFFSET(0)].
              PixelMeasuresSequence[SAFE_OFFSET(0)].
              PixelSpacing[SAFE_OFFSET(0)] AS FLOAT64) AS pixel_spacing, 
      -- compression: compression type 
      CASE TransferSyntaxUID
          WHEN '1.2.840.10008.1.2.4.50' THEN 'jpeg'
          WHEN '1.2.840.10008.1.2.4.91' THEN 'jpeg2000'
          ELSE 'other'
      END AS compression,
    FROM
      -- we are using version 11 of the IDC data
      bigquery-public-data.idc_v11.dicom_all
    WHERE
      -- limit query to slide microscopy images (SM) excluding non-volume images like label images
      Modality = 'SM' AND ImageType[OFFSET(2)] = 'VOLUME'
  ),
  -- The 'tissue_types' subquery indicates whether a slides contains normal, tumor or other tisse.
  tissue_types AS (
    SELECT DISTINCT *
    FROM (
      SELECT
        SeriesInstanceUID AS digital_slide_id,
        CASE steps_unnested2.CodeValue
            WHEN '17621005' THEN 'normal' -- meaning: 'Normal' (i.e., non neoplastic)
            WHEN '86049000' THEN 'tumor' -- meaning: 'Neoplasm, Primary'
            ELSE 'other' -- meaning: 'Neoplasm, Metastatic'
        END AS tissue_type
      FROM
        bigquery-public-data.idc_v11.dicom_all
        CROSS JOIN
          UNNEST (SpecimenDescriptionSequence[SAFE_OFFSET(0)].PrimaryAnatomicStructureSequence) AS steps_unnested1
        CROSS JOIN
          UNNEST (steps_unnested1.PrimaryAnatomicStructureModifierSequence) AS steps_unnested2
    )
  ),
  -- The 'specimen_preparation_sequence_items' subquery provides additional information
  -- about the preparation of the slide, such as the embedding medium.
  specimen_preparation_sequence_items AS (
    SELECT DISTINCT *
    FROM (
      SELECT
        SeriesInstanceUID AS digital_slide_id,
        steps_unnested2.ConceptNameCodeSequence[SAFE_OFFSET(0)].CodeMeaning AS item_name,
        steps_unnested2.ConceptCodeSequence[SAFE_OFFSET(0)].CodeMeaning AS item_value
      FROM
        bigquery-public-data.idc_v11.dicom_all
        CROSS JOIN
          UNNEST (SpecimenDescriptionSequence[SAFE_OFFSET(0)].SpecimenPreparationSequence) AS steps_unnested1
        CROSS JOIN
          UNNEST (steps_unnested1.SpecimenPreparationStepContentItemSequence) AS steps_unnested2
    )
  )

-- Select all DICOM images from the TCGA-LUAD / TCGA-LUSC datasets that are JPEG/JPEG2000 compressed 
-- and contain normal or tumor tissue in frozen tissue sections. The results are ordered by their 
-- crdc_instance_uuid to ensure deterministic output order which is important for reproducibility.
SELECT
  a.*,
  b.tissue_type,
  (REPLACE (REPLACE(a.collection_id, 'tcga_luad', 'luad'), 'tcga_lusc', 'lscc')) AS cancer_subtype
FROM 
  sm_images AS a
  JOIN tissue_types AS b ON b.digital_slide_id = a.digital_slide_id
  JOIN specimen_preparation_sequence_items AS c ON c.digital_slide_id = a.digital_slide_id 
WHERE
  (a.collection_id = 'tcga_luad' OR a.collection_id = 'tcga_lusc')
  AND a.compression != 'other'
  AND (b.tissue_type = 'normal' OR b.tissue_type = 'tumor')
  AND (c.item_name = 'Embedding medium' AND c.item_value = 'Tissue freezing medium')
ORDER BY crdc_instance_uuid