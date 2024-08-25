# `isb-cgc-bq.HTAN_versioned.accessory_manifest_r5.md`

## Column details

* [STRING]    `Data_Type`
  - Types of data associated with the content. Fill out Other Data Type Specified, if not on the list.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `HTAN_Center_ID`
  - List of HTAN Center ID(s) associated with the content presented/published.
* [STRING]    `Accessory_Description`
  - Free text field containing description of accessory file(s)
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Accessory_associated_HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier(s) of the files associated with the accessory content. Should be comma-separated lists.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Accessory_Synapse_ID`
  - Synapse ID of folder containing accessory files
* [STRING]    `Dataset_Name`
  - Name of a dataset (e.g. a Synapse folder)
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0

