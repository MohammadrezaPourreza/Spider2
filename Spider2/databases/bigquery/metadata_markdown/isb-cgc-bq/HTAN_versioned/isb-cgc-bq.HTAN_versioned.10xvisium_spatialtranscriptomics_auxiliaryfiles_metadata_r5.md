# `isb-cgc-bq.HTAN_versioned.10xvisium_spatialtranscriptomics_auxiliaryfiles_metadata_r5.md`

## Column details

* [STRING]    `Workflow_Link`
  - Link to workflow or command. DockStore.org recommended. URL
* [STRING]    `Run_ID`
  - A unique identifier for this individual run (typically associated with a single slide) of the spatial transcriptomic processing workflow.
* [STRING]    `Capture_Area`
  - Area (or Capture Area) - One of the either four or two active regions where tissue can be placed on a Visium slide. Each area is intended to contain only one tissue sample. Slide areas are named consecutively from top to bottom: A1, B1, C1, D1 for Visium slides with 6.5 mm Capture Area and A, B for CytAssist slides with 11 mm Capture Area. Both CytAssist slides with 6.5 mm Capture Area and Gateway Slides contain only two slide areas, A1 and D1.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Visium_File_Type`
  - The file type generated for the visium experiment.
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Slide_ID`
  - For Visium, it is the unique identifier printed on the label of each Visium slide. The serial number starts with V followed by a number which can range between one through five and ends with a dash and a three digit number, such as 123. For CosMx, this refers to the loaded Flow Cell ID. For Xenium, this ID indicates the slide orientation, as it matches the relative location of the ID on the physical Xenium slide.
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Workflow_Version`
  - Major version of the workflow (e.g. Cell Ranger v3.1)
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest
* [INT64]    `File_Size`
  - Size of file (bucket object) in bytes
* [STRING]    `md5`
  - md5 hash of file
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [STRING]    `CDS_Release`
  - CDS transfer package in which file was included e.g. v22.6.1.seq

