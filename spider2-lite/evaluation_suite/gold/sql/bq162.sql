WITH prov AS (
    SELECT DISTINCT HTAN_Data_File_ID, entityId, Component, HTAN_Center
    FROM isb-cgc-bq.HTAN_versioned.id_provenance_r5
    WHERE Component IS NOT NULL
    AND Component NOT LIKE '%Auxiliary%'
    AND Component NOT LIKE 'OtherAssay'
  ),
  img AS(SELECT * EXCEPT(HTAN_Data_File_ID) FROM (
    SELECT HTAN_Data_File_ID,Imaging_Assay_Type,entityId
    FROM isb-cgc-bq.HTAN_versioned.imaging_level2_metadata_r5
    WHERE Component IS NOT NULL
    UNION ALL
    SELECT il3s.HTAN_Data_File_ID,il2.Imaging_Assay_Type,il3s.entityId
    FROM isb-cgc-bq.HTAN_versioned.imaging_level2_metadata_r5 il2
    JOIN (SELECT * FROM isb-cgc-bq.HTAN_versioned.id_provenance_r5
      WHERE Component = 'ImagingLevel3Segmentation') il3s
    ON il2.HTAN_Data_File_ID = il3s.HTAN_Parent_Data_File_ID
    UNION ALL
    SELECT il4.HTAN_Data_File_ID,il2.Imaging_Assay_Type,il4.entityId
    FROM isb-cgc-bq.HTAN_versioned.imaging_level2_metadata_r5 il2
    JOIN (SELECT * FROM isb-cgc-bq.HTAN_versioned.id_provenance_r5
      WHERE Component = 'ImagingLevel3Segmentation') il3s
    ON il2.HTAN_Data_File_ID = il3s.HTAN_Parent_Data_File_ID
    JOIN (SELECT * FROM isb-cgc-bq.HTAN_versioned.id_provenance_r5
      WHERE Component = 'ImagingLevel4') il4
    ON il3s.HTAN_Data_File_ID = il4.HTAN_Parent_Data_File_ID
  )
  ),
  files AS (
    SELECT HTAN_Center,array_to_string([SPLIT(Component, 'Level')[OFFSET(0)], Imaging_Assay_Type], ' - ') AS Assay,
    REGEXP_EXTRACT(Component, r'Level\d') AS Level
    FROM prov
    LEFT JOIN img USING(entityId)
    GROUP BY HTAN_Center, Assay, Level
    ORDER BY HTAN_Center, Assay, Level
  )
  SELECT Assay, STRING_AGG(DISTINCT Level ORDER BY Level) AS Levels
  FROM files
  WHERE HTAN_Center = "HTAN WUSTL"
  GROUP BY Assay