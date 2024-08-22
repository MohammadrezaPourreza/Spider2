# `isb-cgc-bq.HTAN_versioned.bulkMethylationseq_level1_metadata_r5.md`

## Column details

* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Total_DNA_Input`
  - Overall number of reads for a given sample in digits (microgram, nanogram).
* [STRING]    `Nucleic_Acid_Source`
  - The source of the input nucleic molecule
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Replicate_Type`
  - A common term for all files belonging to the same sample. We suggest using a stable sample accession from a biosample archive like BioSamples.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Bulk_Methylation_Assay_Type`
  - Assay types normally determine genomic coverage
* [STRING]    `Bisulfite_Conversion`
  - Name of the kit used in bisulfite conversion.
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
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

