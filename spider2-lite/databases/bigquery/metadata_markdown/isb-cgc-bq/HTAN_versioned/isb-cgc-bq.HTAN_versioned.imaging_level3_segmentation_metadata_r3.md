# `isb-cgc-bq.HTAN_versioned.imaging_level3_segmentation_metadata_r3.md`

## Column details

* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Imaging_Segmentation_Data_Type`
  - Specifies how the segmentation is stored
* [STRING]    `Parameter_file`
  - Path in Syanpse to a text file listing algorithm version numbers and relevant parameters needed to reproduce the analysis
* [STRING]    `Software_and_Version`
  - Name of software used to generate expression values. String
* [STRING]    `Commit_SHA`
  - Short SHA for software version [8 hexadecimal characters (for github), comma separated if multiple]
* [STRING]    `Imaging_Object_Class`
  - Defines the structure that the mask delineates
* [STRING]    `Number_of_Objects`
  - The number of objects (eg cells) described
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
* [INT64]    `File_Size`
  - Size of file (bucket object) in bytes
* [STRING]    `md5`
  - md5 hash of file
* [STRING]    `CDS_Release`
  - CDS transfer package in which file was included e.g. v22.6.1.seq

