# `isb-cgc-bq.HTAN.scRNAseq_level3_metadata_current.md`

## Column details

* [STRING]    `Workflow_Link`
  - Link to workflow or command. DockStore.org recommended. URL
* [STRING]    `Data_Category`
  - Specific content type of the data file.
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `scRNAseq_Workflow_Parameters_Description`
  - Parameters used to run the workflow. scRNA-seq level 3: e.g. Normalization and log transformation, ran empty drops or doublet detection, used filter on # genes/cell, etc. scRNA-seq Level 4: dimensionality reduction with PCA and 50 components, nearest-neighbor graph with k = 20 and Leiden clustering with resolution = 1, UMAP visualization using 50 PCA components, marker genes used to annotate cell types, information about droplet matrix (all barcodes) to cell matrix (only informative barcodes representing real cells) conversion
* [STRING]    `Cell_Total`
  - Number of sequenced  cells. Applies to raw counts matrix only.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Cell_Median_Number_Reads`
  - Median number of reads per cell. Number
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Cell_Median_Number_Genes`
  - Median number of genes detected per cell. Number
* [STRING]    `scRNAseq_Workflow_Type`
  - Generic name for the workflow used to analyze a data set.
* [STRING]    `Linked_Matrices`
  - All matrices associated with every part of a SingleCellExperiment object. Comma-delimited list of filenames
* [STRING]    `Matrix_Type`
  - Type of data stored in matrix.
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

