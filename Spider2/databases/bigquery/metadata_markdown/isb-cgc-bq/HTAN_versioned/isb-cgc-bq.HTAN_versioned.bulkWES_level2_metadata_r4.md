# `isb-cgc-bq.HTAN_versioned.bulkWES_level2_metadata_r4.md`

## Column details

* [STRING]    `Per_Sequence_GC_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Encoding`
  - Version of ASCII encoding of quality values found in the file. String
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Per_Base_Sequence_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Basic_Statistics`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Adapter_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `QC_Workflow_Version`
  - Major version for a workflow. String
* [STRING]    `MSI_Score`
  - Numeric score denoting the aligned reads file's MSI score from MSIsensor. Number
* [STRING]    `Proportion_Coverage_30X`
  - Proportion of all reference bases for whole genome sequencing, or targeted bases for whole exome and targeted sequencing, that achieves 30X or greater coverage from Picard Tools.
* [STRING]    `Average_Base_Quality`
  - Average base quality collected from samtools. Number
* [STRING]    `Per_Sequence_Quality_Score`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Per_Base_N_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Proportion_Reads_Mapped`
  - Proportion of mapped reads collected from samtools. Number
* [STRING]    `Mean_Coverage`
  - Mean coverage for whole genome sequencing, or mean target coverage for whole exome and targeted sequencing, collected from Picard. Number
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `MSI_Status`
  - MSIsensor determination of either microsatellite stability or instability.
* [STRING]    `Per_Tile_Sequence_Quality`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Is_lowest_level`
  - Denotes that the manifest represents the lowest data level submitted. Use when L1 data is missing
* [STRING]    `QC_Workflow_Link`
  - Link to workflow used. String
* [STRING]    `Genomic_Reference`
  - Exact version of the human genome reference used in the alignment of reads (e.g. GCF_000001405.39)
* [STRING]    `Alignment_Workflow_Type`
  - Generic name for the workflow used to analyze a data set.
* [STRING]    `Index_File_Name`
  - The name (or part of a name) of a file (of any type). String
* [STRING]    `Pairs_On_Diff_CHR`
  - Pairs on different chromosomes collected from samtools. Integer
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Proportion_Coverage_10x`
  - Proportion of all reference bases for whole genome sequencing, or targeted bases for whole exome and targeted sequencing, that achieves 10X or greater coverage from Picard Tools.
* [STRING]    `Average_Read_Length`
  - Average read length collected from samtools. Integer
* [STRING]    `Sequence_Duplication_Levels`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Total_Unmapped_reads`
  - Number of reads that did not map to genome. Integer
* [STRING]    `Contamination_Error`
  - Estimation error of cross-sample contamination collected from GATK4. Number
* [STRING]    `Per_Base_Sequence_Quality`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `MSI_Workflow_Link`
  - Link to method workflow (or command) used in estimating the MSI. URL
* [STRING]    `Sequence_Length_Distribution`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Overrepresented_Sequences`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Proportion_Reads_Duplicated`
  - Proportion of duplicated reads collected from samtools. Number
* [STRING]    `Proportion_Targets_No_Coverage`
  - Proportion of targets that did not reach 1X coverage over any base from Picard Tools. Number
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Short_Reads`
  - Number of reads that were too short. Integer
* [STRING]    `QC_Workflow_Type`
  - Generic name for the workflow used to analyze a data set. String
* [STRING]    `Contamination`
  - Fraction of reads coming from cross-sample contamination collected from GATK4. Number
* [STRING]    `Total_Uniquely_Mapped`
  - Number of reads that map to genome. Integer
* [STRING]    `Custom_Alignment_Workflow`
  - Specify the name of a custom alignment workflow
* [STRING]    `Average_Insert_Size`
  - Average insert size collected from samtools. Integer
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `Proportion_Base_Mismatch`
  - Proportion of mismatched bases collected from samtools. Number
* [STRING]    `Percent_GC_Content`
  - The overall %GC of all bases in all sequences. Integer
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

