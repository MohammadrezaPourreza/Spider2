# `isb-cgc-bq.HTAN_versioned.bulkRNAseq_level3_metadata_r2.md`

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
* [STRING]    `Pseudo_Alignment_Used`
  - Pseudo aligners such as Kallisto or Salmon do not produce aligned reads BAM files. True indicates pseudoalignment was used.
* [STRING]    `Data_Category`
  - Specific content type of the data file.
* [STRING]    `Expression_Units`
  - How quantities are corrected for gene length
* [STRING]    `Matrix_Type`
  - Type of data stored in matrix.
* [STRING]    `Fusion_Gene_Detected`
  - Was a fusion gene identified?
* [STRING]    `Fusion_Gene_Identity`
  - The gene symbols of fused genes.
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

