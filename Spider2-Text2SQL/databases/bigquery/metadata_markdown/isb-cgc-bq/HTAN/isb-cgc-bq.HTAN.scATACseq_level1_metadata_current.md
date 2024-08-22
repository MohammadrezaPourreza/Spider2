# `isb-cgc-bq.HTAN.scATACseq_level1_metadata_current.md`

## Column details

* [STRING]    `Nucleus_Identifier`
  - Unique nuclei barcode; added at transposition step. Determines which nucleus the reads originated from
* [STRING]    `Nucleic_Acid_Source`
  - The source of the input nucleic molecule
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Total_Reads`
  - Total number of reads per sample. Integer
* [STRING]    `Well_Index`
  - Indicate if protein expression (EPCAM/CD45) positive/negative data  is available for each cell in CEL-seq2 assays
* [STRING]    `Nuclei_Barcode_Length`
  - Nuclei Barcode Length
* [STRING]    `scATACseq_Read3`
  - Read 3 content description
* [STRING]    `Single_Nucleus_Buffer`
  - Nuclei isolation buffer
* [STRING]    `Median_Fraction_of_Reads_in_Peaks`
  - Median fraction of reads in peaks (FRIP)
* [STRING]    `Threshold_for_Minimum_Passing_Reads`
  - Threshold for calling cells
* [STRING]    `Median_Passing_Read_Percentage`
  - Non-PCR duplicate nuclear genomic sequence reads not aligning to unanchored contigs out of total reads assigned to the nucleus barcode
* [STRING]    `Transposition_Reaction`
  - Name of the transposase, transposon sequences
* [STRING]    `scATACseq_Library_Layout`
  - Sequencing read type
* [STRING]    `Technical_Replicate_Group`
  - A common term for all files belonging to the same cell or library. Provide a numbering of each library prep batch (can differ from encapsulation and sequencing batch)
* [STRING]    `scATACseq_Read1`
  - Read 1 content description
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Nuclei_Barcode_Read`
  - Nuclei Barcode Read
* [STRING]    `Library_Construction_Method`
  - Process which results in the creation of a library from fragments of DNA using cloning vectors or oligonucleotides with the role of adaptors [OBI_0000711]
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Single_Cell_Isolation_Method`
  - The method by which cells are isolated into individual reaction containers at a single cell resolution (e.g. wells, micro-droplets)
* [STRING]    `Dissociation_Method`
  - The tissue dissociation method used for scRNASeq or scATAC-seq assays
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Median_Percentage_of_Mitochondrial_Reads_per_Nucleus`
  - Contamination from mitochondrial sequences
* [STRING]    `scATACseq_Read2`
  - Read 2 content description
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `Empty_Well_Barcode`
  - Unique cell barcode assigned to empty cells used as controls in CEL-seq2 assays.
* [STRING]    `Total_Number_of_Passing_Nuclei`
  - Number of nuclei sequenced
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Median_Fraction_of_Reads_in_Annotated_cis_DNA_Elements`
  - Median fraction of reads in annotated cis-DNA elements (FRIADE)
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

