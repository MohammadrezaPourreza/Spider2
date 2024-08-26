# `isb-cgc-bq.HTAN_versioned.10xvisium_spatialtranscriptomics_scRNAseq_level3_metadata_r5.md`

## Column details

* [STRING]    `Workflow_Link`
  - Link to workflow or command. DockStore.org recommended. URL
* [STRING]    `Visium_File_Type`
  - The file type generated for the visium experiment.
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Median_Number_Genes_per_Spatial_Spot`
  - The median number of genes detected per spot under tissue-associated barcode. Detection is defined as the presence of at least 1 UMI count.
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Run_ID`
  - A unique identifier for this individual run (typically associated with a single slide) of the spatial transcriptomic processing workflow.
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `Proportion_Reads_Mapped`
  - Proportion of mapped reads collected from samtools. Number
* [STRING]    `Median_UMI_Counts_per_Spot`
  - The median number of UMI counts per tissue covered spot.
* [STRING]    `Workflow_Version`
  - Major version of the workflow (e.g. Cell Ranger v3.1)
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Spots_under_tissue`
  - The number of barcodes associated with a spot under tissue.
* [STRING]    `Proportion_Reads_Mapped_to_Transcriptome`
  - Fraction of reads that mapped to a unique gene in the transcriptome. The read must be consistent with annotated splice junctions. These reads are considered for UMI counting.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Capture_Area`
  - Area (or Capture Area) - One of the either four or two active regions where tissue can be placed on a Visium slide. Each area is intended to contain only one tissue sample. Slide areas are named consecutively from top to bottom: A1, B1, C1, D1 for Visium slides with 6.5 mm Capture Area and A, B for CytAssist slides with 11 mm Capture Area. Both CytAssist slides with 6.5 mm Capture Area and Gateway Slides contain only two slide areas, A1 and D1.
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Sequencing_Saturation`
  - The fraction of reads originating from an already-observed UMI. This is a function of library complexity and sequencing depth. More specifically, this is the fraction of confidently mapped, valid spot-barcode, valid UMI reads that had a non-unique (spot-barcode, UMI, gene).
* [STRING]    `Mean_Reads_per_Spatial_Spot`
  - The number of reads, both under and outside of tissue, divided by the number of barcodes associated with a spot under tissue.
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

