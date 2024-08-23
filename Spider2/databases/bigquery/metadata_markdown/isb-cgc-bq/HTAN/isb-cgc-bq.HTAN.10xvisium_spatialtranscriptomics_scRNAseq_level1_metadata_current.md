# `isb-cgc-bq.HTAN.10xvisium_spatialtranscriptomics_scRNAseq_level1_metadata_current.md`

## Column details

* [STRING]    `UMI_Barcode_Offset`
  - Start position of UMI barcode in the sequence. Values: number, 0 for start of read
* [STRING]    `Reverse_Transcription_Primer`
  - An oligo to which new deoxyribonucleotides can be added by DNA polymerase [SO_0000112]. The type of primer used for reverse transcription, e.g. oligo-dT or random primer. This allows users to identify content of the cDNA library input e.g. enriched for mRNA
* [STRING]    `Feature_Reference_Id`
  - Unique ID for this feature. Must not contain whitespace, quote or comma characters. Each ID must be unique and must not collide with a gene identifier from the transcriptome [https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/feature-bc-analysis#feature-ref]
* [STRING]    `Sequencing_Library_Construction_Days_from_Index`
  - Number of days between sample for assay was received in lab and day of sequencing library construction [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Image_Re_orientation`
  - To ensure good fiducial alignment and tissue spots detection, it is important to correct for this shift in orientation.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `cDNA_Offset`
  - Offset in sequence for cDNA read (in bp): number
* [STRING]    `Run_ID`
  - A unique identifier for this individual run (typically associated with a single slide) of the spatial transcriptomic processing workflow.
* [STRING]    `Permeabilization_Time`
  - Fixed and stained tissue sections are permeabilized for different times. Each Capture Area captures polyadenylated mRNA from the attached tissue section. Measure is provided in minutes.
* [STRING]    `DV200`
  - Represents the percentage of RNA fragments that are >200 nucleotides in size. Number
* [STRING]    `Slide_Version`
  - Version of imaging slide used. Slide version is critical for the analysis of the sequencing data as different slides have different capture area layouts.
* [STRING]    `Spatial_Barcode_Offset`
  - Offset in sequence for spot barcode read (in bp): number
* [STRING]    `Slide_ID`
  - For Visium, it is the unique identifier printed on the label of each Visium slide. The serial number starts with V followed by a number which can range between one through five and ends with a dash and a three digit number, such as 123. For CosMx, this refers to the loaded Flow Cell ID. For Xenium, this ID indicates the slide orientation, as it matches the relative location of the ID on the physical Xenium slide.
* [STRING]    `Spatial_Library_Construction_Method`
  - Process which results in the creation of a library from fragments of DNA using cloning vectors or oligonucleotides with the role of adaptors [OBI_0000711]
* [STRING]    `RIN`
  - A numerical assessment of the integrity of RNA based on the entire electrophoretic trace of the RNA sample including the presence or absence of degradation products. Number
* [STRING]    `cDNA_Length`
  - Length of cDNA read (in bp): number
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Spatial_Barcode_Length`
  - Length of spot barcode read (in bp): number
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Spatial_Read2`
  - Read 2 content description
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `End_Bias`
  - The end of the cDNA molecule that is preferentially sequenced, e.g. 3/5 prime tag/end or the full length transcript
* [STRING]    `Library_Preparation_Days_from_Index`
  - Number of days between sample for assay was received in lab and the libraries were prepared for sequencing [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Capture_Area`
  - Area (or Capture Area) - One of the either four or two active regions where tissue can be placed on a Visium slide. Each area is intended to contain only one tissue sample. Slide areas are named consecutively from top to bottom: A1, B1, C1, D1 for Visium slides with 6.5 mm Capture Area and A, B for CytAssist slides with 11 mm Capture Area. Both CytAssist slides with 6.5 mm Capture Area and Gateway Slides contain only two slide areas, A1 and D1.
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Read_Indicator`
  - Indicate if this is Read 1 (R1), Read 2 (R2), Index Reads (I1), or Other
* [STRING]    `UMI_Barcode_Length`
  - Length of UMI barcode read (in bp): number
* [STRING]    `Spatial_Read1`
  - Read 1 content description
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

