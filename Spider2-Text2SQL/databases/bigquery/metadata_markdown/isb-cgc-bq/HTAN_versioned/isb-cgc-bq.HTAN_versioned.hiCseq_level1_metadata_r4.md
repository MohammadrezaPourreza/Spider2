# `isb-cgc-bq.HTAN_versioned.hiCseq_level1_metadata_r4.md`

## Column details

* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Technical_Replicate_Group`
  - A common term for all files belonging to the same cell or library. Provide a numbering of each library prep batch (can differ from encapsulation and sequencing batch)
* [STRING]    `DNA_Input_Amount`
  - Amount of DNA for library construction, in nanograms.
* [STRING]    `Ligation_Condition`
  - Name of ligase and condition for proximity ligation
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `Crosslinking_Condtion`
  - Detailed condition for DNA crosslinking
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Genomic_Reference`
  - Exact version of the human genome reference used in the alignment of reads (e.g. GCF_000001405.39)
* [STRING]    `DNA_Digestion_Condition`
  - Enzymes and treatment length/temperature for genome digestion
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Transposition_Reaction`
  - Name of the transposase, transposon sequences
* [STRING]    `Biotin_Enrichment`
  - Whether biotin is used for enriching ligation product
* [STRING]    `Nucleic_Acid_Source`
  - The source of the input nucleic molecule
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `Nuclei_Permeabilization_Method`
  - Detergent and treatment condition for nuclei permeabilization and crosslinking softening
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

