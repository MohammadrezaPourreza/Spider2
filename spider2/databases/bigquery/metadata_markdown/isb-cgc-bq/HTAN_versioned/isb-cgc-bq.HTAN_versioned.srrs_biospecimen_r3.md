# `isb-cgc-bq.HTAN_versioned.srrs_biospecimen_r3.md`

## Column details

* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `HTAN_Biospecimen_ID`
  - HTAN ID associated with a biosample based on HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Source_HTAN_Biospecimen_ID`
  - This is the HTAN ID that may have been assigned to the biospecimen at the site of biospecimen origin (e.g. BU).
* [STRING]    `HTAN_Parent_ID`
  - HTAN ID of parent from which the biospecimen was obtained. Parent could be another biospecimen or a research participant.
* [STRING]    `Adjacent_Biospecimen_IDs`
  - List of HTAN Identifiers (separated by commas) of adjacent biospecimens cut from the same sample; for example HTA3_3000_3, HTA3_3000_4, ...
* [STRING]    `Biospecimen_Type`
  - Biospecimen Type
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Collection_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was obtained. If not applicable please enter 'Not Applicable'
* [STRING]    `Acquisition_Method_Type`
  - Records the method of acquisition or source for the specimen under consideration.
* [STRING]    `Ischemic_Time`
  - Duration of time, in seconds, between when the specimen stopped receiving oxygen and when it was preserved or processed. Integer value.
* [STRING]    `Ischemic_Temperature`
  - Specify whether specimen experienced warm or cold ischemia.
* [STRING]    `Collection_Media`
  - Material Specimen is collected into post procedure
* [STRING]    `Topography_Code`
  - Topography Code, indicating site within the body, based on ICD-O-3.
* [STRING]    `Additional_Topography`
  - Topography not included in the ICD-O-3 Topography codes.
* [STRING]    `Fixative_Type`
  - Text term to identify the type of fixative used to preserve a tissue specimen
* [STRING]    `Storage_Method`
  - The method by which a biomaterial was stored after preservation or before another protocol was used.
* [STRING]    `Preinvasive_Morphology`
  - Histologic Morphology not included in ICD-O-3 morphology codes, for preinvasive lesions included in the HTAN
* [STRING]    `Histologic_Morphology_Code`
  - Histologic Morphology Code, based on ICD-O-3. Any valid ICD-O-3 morphology code. See https://seer.cancer.gov/icd-o-3/ and https://seer.cancer.gov/icd-o-3/sitetype.icdo3.20200629.xlsx. Examples: 80510
* [STRING]    `Preservation_Method`
  - Text term that represents the method used to preserve the sample.
* [STRING]    `Processing_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was processed. If not applicable please enter 'Not Applicable'
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest
* [STRING]    `Uuid`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819

