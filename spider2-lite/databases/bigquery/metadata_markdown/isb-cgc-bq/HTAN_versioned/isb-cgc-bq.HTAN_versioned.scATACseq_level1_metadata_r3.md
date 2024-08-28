# `isb-cgc-bq.HTAN_versioned.scATACseq_level1_metadata_r3.md`

## Column details

* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Nucleic_Acid_Source`
  - The source of the input nucleic molecule
* [STRING]    `Dissociation_Method`
  - The tissue dissociation method used for scRNASeq or scATAC-seq assays
* [STRING]    `Single_Nucleus_Buffer`
  - Nuclei isolation buffer
* [STRING]    `Single_Cell_Isolation_Method`
  - The method by which cells are isolated into individual reaction containers at a single cell resolution (e.g. wells, micro-droplets)
* [STRING]    `Transposition_Reaction`
  - Name of the transposase, transposon sequences
* [STRING]    `scATACseq_Library_Layout`
  - Sequencing read type
* [STRING]    `Nucleus_Identifier`
  - Unique nuclei barcode; added at transposition step. Determines which nucleus the reads originated from
* [STRING]    `scATACseq_Read3`
  - Read 3 content description
* [STRING]    `Library_Construction_Method`
  - Process which results in the creation of a library from fragments of DNA using cloning vectors or oligonucleotides with the role of adaptors [OBI_0000711]
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `Threshold_for_Minimum_Passing_Reads`
  - Threshold for calling cells
* [STRING]    `Total_Number_of_Passing_Nuclei`
  - Number of nuclei sequenced
* [STRING]    `Median_Fraction_of_Reads_in_Peaks`
  - Median fraction of reads in peaks (FRIP)
* [STRING]    `Median_Fraction_of_Reads_in_Annotated_cis_DNA_Elements`
  - Median fraction of reads in annotated cis-DNA elements (FRIADE)
* [STRING]    `Median_Passing_Read_Percentage`
  - Non-PCR duplicate nuclear genomic sequence reads not aligning to unanchored contigs out of total reads assigned to the nucleus barcode
* [STRING]    `Median_Percentage_of_Mitochondrial_Reads_per_Nucleus`
  - Contamination from mitochondrial sequences
* [STRING]    `Technical_Replicate_Group`
  - A common term for all files belonging to the same cell or library. Provide a numbering of each library prep batch (can differ from encapsulation and sequencing batch)
* [STRING]    `Total_Reads`
  - Total number of reads per sample. Integer
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `Peaks_Calling_Software`
  - Generic name of peaks calling tool
* [STRING]    `MapQ30`
  - Number of reads with Quality >= 30.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest
* [STRING]    `Uuid`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [INT64]    `File_Size`
  - Size of file (bucket object) in bytes
* [STRING]    `md5`
  - md5 hash of file
* [STRING]    `CDS_Release`
  - CDS transfer package in which file was included e.g. v22.6.1.seq

