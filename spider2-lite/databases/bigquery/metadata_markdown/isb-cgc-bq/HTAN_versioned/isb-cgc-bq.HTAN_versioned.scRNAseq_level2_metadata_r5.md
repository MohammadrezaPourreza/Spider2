# `isb-cgc-bq.HTAN_versioned.scRNAseq_level2_metadata_r5.md`

## Column details

* [STRING]    `Workflow_Link`
  - Link to workflow or command. DockStore.org recommended. URL
* [STRING]    `UMI_Tag`
  - SAM tag for the UMI field; please provide a valid UB, UMI (e.g. UB:Z or UR:Z)
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `scRNAseq_Workflow_Type`
  - Generic name for the workflow used to analyze a data set.
* [STRING]    `Aligned_Read_Length`
  - Read length used for alignment if hard trimming was applied
* [STRING]    `Cell_Barcode_Tag`
  - SAM tag for cell barcode field; please provide a valid cell barcode tag (e.g. CB:Z)
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `Genomic_Reference_URL`
  - Link to human genome sequence (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/GRCh38.primary_assembly.genome.fa.gz)
* [STRING]    `Checksum`
  - MD5 checksum of the BAM file
* [STRING]    `Genomic_Reference`
  - Exact version of the human genome reference used in the alignment of reads (e.g. GCF_000001405.39)
* [STRING]    `Workflow_Version`
  - Major version of the workflow (e.g. Cell Ranger v3.1)
* [STRING]    `Genome_Annotation_URL`
  - Link to the human genome annotation (GTF) file (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/gencode.v34.annotation.gtf.gz)
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Applied_Hard_Trimming`
  - Was Hard Trimming applied
* [STRING]    `scRNAseq_Workflow_Parameters_Description`
  - Parameters used to run the workflow. scRNA-seq level 3: e.g. Normalization and log transformation, ran empty drops or doublet detection, used filter on # genes/cell, etc. scRNA-seq Level 4: dimensionality reduction with PCA and 50 components, nearest-neighbor graph with k = 20 and Leiden clustering with resolution = 1, UMAP visualization using 50 PCA components, marker genes used to annotate cell types, information about droplet matrix (all barcodes) to cell matrix (only informative barcodes representing real cells) conversion
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Whitelist_Cell_Barcode_File_Link`
  - Link to file listing all possible cell barcodes. URL
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
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

