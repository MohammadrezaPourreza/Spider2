# `isb-cgc-bq.HTAN_versioned.scRNAseq_level2_metadata_r2.md`

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
* [STRING]    `scRNAseq_Workflow_Type`
  - Generic name for the workflow used to analyze a data set.
* [STRING]    `Workflow_Version`
  - Major version of the workflow (e.g. Cell Ranger v3.1)
* [STRING]    `scRNAseq_Workflow_Parameters_Description`
  - Parameters used to run the workflow. scRNA-seq level 3: e.g. Normalization and log transformation, ran empty drops or doublet detection, used filter on # genes/cell, etc. scRNA-seq Level 4: dimensionality reduction with PCA and 50 components, nearest-neighbor graph with k = 20 and Leiden clustering with resolution = 1, UMAP visualization using 50 PCA components, marker genes used to annotate cell types, information about droplet matrix (all barcodes) to cell matrix (only informative barcodes representing real cells) conversion
* [STRING]    `Workflow_Link`
  - Link to workflow or command. DockStore.org recommended. URL
* [STRING]    `Genomic_Reference`
  - Exact version of the human genome reference used in the alignment of reads (e.g. https://www.gencodegenes.org/human/)
* [STRING]    `Genomic_Reference_URL`
  - Link to human genome sequence (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/GRCh38.primary_assembly.genome.fa.gz) [URL]
* [STRING]    `Genome_Annotation_URL`
  - Link to the human genome annotation (GTF) file (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/gencode.v34.annotation.gtf.gz)
* [STRING]    `Checksum`
  - MD5 checksum of the BAM file
* [STRING]    `Whitelist_Cell_Barcode_File_Link`
  - Link to file listing all possible cell barcodes. URL
* [STRING]    `Cell_Barcode_Tag`
  - SAM tag for cell barcode field; please provide a valid cell barcode tag
* [STRING]    `UMI_Tag`
  - SAM tag for UMI field; please provide a valid UB, UMI
* [STRING]    `Applied_Hard_Trimming`
  - TBD
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [INT64]    `File_Size`
  - Size of file (bucket object) in bytes
* [STRING]    `Base_Filename`
  - Base name of file
* [STRING]    `md5`
  - md5 hash of file

