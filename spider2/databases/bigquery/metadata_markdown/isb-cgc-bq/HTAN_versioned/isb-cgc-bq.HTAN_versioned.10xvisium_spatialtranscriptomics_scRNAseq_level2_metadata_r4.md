# `isb-cgc-bq.HTAN_versioned.10xvisium_spatialtranscriptomics_scRNAseq_level2_metadata_r4.md`

## Column details

* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Whitelist_Spatial_Barcode_File_Link`
  - Link to file listing all possible spatial barcodes. URL
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Aligned_Read_Length`
  - Read length used for alignment if hard trimming was applied
* [STRING]    `Capture_Area`
  - Area (or Capture Area) - One of the either four or two active regions where tissue can be placed on a Visium slide. Each area is intended to contain only one tissue sample. Slide areas are named consecutively from top to bottom: A1, B1, C1, D1 for Visium slides with 6.5 mm Capture Area and A, B for CytAssist slides with 11 mm Capture Area. Both CytAssist slides with 6.5 mm Capture Area and Gateway Slides contain only two slide areas, A1 and D1.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Genomic_Reference`
  - Exact version of the human genome reference used in the alignment of reads (e.g. GCF_000001405.39)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Applied_Hard_Trimming`
  - Was Hard Trimming applied
* [STRING]    `Checksum`
  - MD5 checksum of the BAM file
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Spatial_Barcode_Tag`
  - SAM tag for spot barcode field; please provide a valid spot barcode tag (e.g. CB:Z)
* [STRING]    `UMI_Tag`
  - SAM tag for the UMI field; please provide a valid UB, UMI (e.g. UB:Z or UR:Z)
* [STRING]    `Workflow_Link`
  - Link to workflow or command. DockStore.org recommended. URL
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Run_ID`
  - A unique identifier for this individual run (typically associated with a single slide) of the spatial transcriptomic processing workflow.
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `Workflow_Version`
  - Major version of the workflow (e.g. Cell Ranger v3.1)
* [STRING]    `Genome_Annotation_URL`
  - Link to the human genome annotation (GTF) file (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/gencode.v34.annotation.gtf.gz)
* [STRING]    `Genomic_Reference_URL`
  - Link to human genome sequence (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/GRCh38.primary_assembly.genome.fa.gz)
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

