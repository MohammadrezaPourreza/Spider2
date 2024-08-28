# `isb-cgc-bq.HTAN_versioned.bulkMethylationseq_level2_metadata_r4.md`

## Column details

* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Trimmer`
  - Software used for trimming
* [STRING]    `Proportion_Coverage_30X`
  - Proportion of all reference bases for whole genome sequencing, or targeted bases for whole exome and targeted sequencing, that achieves 30X or greater coverage from Picard Tools.
* [STRING]    `Average_Base_Quality`
  - Average base quality collected from samtools. Number
* [STRING]    `Proportion_Reads_Mapped`
  - Proportion of mapped reads collected from samtools. Number
* [STRING]    `Mean_Coverage`
  - Mean coverage for whole genome sequencing, or mean target coverage for whole exome and targeted sequencing, collected from Picard. Number
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Bulk_Methylation_Genomic_Reference`
  - The human genome reference used in the alignment of reads
* [STRING]    `Alignment_Workflow_Type`
  - Generic name for the workflow used to analyze a data set.
* [STRING]    `Index_File_Name`
  - The name (or part of a name) of a file (of any type). String
* [STRING]    `Pairs_On_Diff_CHR`
  - Pairs on different chromosomes collected from samtools. Integer
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Average_Read_Length`
  - Average read length collected from samtools. Integer
* [STRING]    `Proportion_of_Minimum_CpG_Coverage_10X`
  - Proportion of all reference bases for whole genome sequencing, or targeted sequencing, that achieves 10X or greater coverage per CpG.
* [STRING]    `Total_Unmapped_reads`
  - Number of reads that did not map to genome. Integer
* [STRING]    `Contamination_Error`
  - Estimation error of cross-sample contamination collected from GATK4. Number
* [STRING]    `Proportion_Targets_No_Coverage`
  - Proportion of targets that did not reach 1X coverage over any base from Picard Tools. Number
* [STRING]    `Proportion_Reads_Duplicated`
  - Proportion of duplicated reads collected from samtools. Number
* [STRING]    `Alignment_Workflow_Url`
  - Link to workflow used for read alignment. DockStore.org recommended. String
* [STRING]    `Short_Reads`
  - Number of reads that were too short. Integer
* [STRING]    `Total_Uniquely_Mapped`
  - Number of reads that map to genome. Integer
* [STRING]    `Contamination`
  - Fraction of reads coming from cross-sample contamination collected from GATK4. Number
* [STRING]    `Custom_Alignment_Workflow`
  - Specify the name of a custom alignment workflow
* [STRING]    `Average_Insert_Size`
  - Average insert size collected from samtools. Integer
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Duplicate_Removal_Software`
  - Software used for remove duplicate reads
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `Library_Layout`
  - Sequencing read type
* [STRING]    `Proportion_Base_Mismatch`
  - Proportion of mismatched bases collected from samtools. Number
* [STRING]    `Genomic_Reference_URL`
  - Link to human genome sequence (e.g. ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_34/GRCh38.primary_assembly.genome.fa.gz)
* [STRING]    `Total_Reads`
  - Total number of reads per sample. Integer
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

