# `isb-cgc-bq.HTAN_versioned.scRNAseq_level1_metadata_r2_v2.md`

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
* [STRING]    `Cryopreserved_Cells_in_Sample`
  - Indicate if library preparation was based on revived frozen cells.
* [STRING]    `Single_Cell_Isolation_Method`
  - The method by which cells are isolated into individual reaction containers at a single cell resolution (e.g. wells, micro-droplets)
* [STRING]    `Dissociation_Method`
  - The tissue dissociation method used for scRNASeq or scATAC-seq assays
* [STRING]    `Library_Construction_Method`
  - Process which results in the creation of a library from fragments of DNA using cloning vectors or oligonucleotides with the role of adaptors [OBI_0000711]
* [STRING]    `Read_Indicator`
  - Indicate if this is Read 1 (R1) or Read 2 (R2)
* [STRING]    `Read1`
  - Read 1 content description
* [STRING]    `Read2`
  - Read 2 content description
* [STRING]    `End_Bias`
  - The end of the cDNA molecule that is preferentially sequenced, e.g. 3/5 prime tag/end or the full length transcript
* [STRING]    `Reverse_Transcription_Primer`
  - An oligo to which new deoxyribonucleotides can be added by DNA polymerase [SO_0000112]. The type of primer used for reverse transcription, e.g. oligo-dT or random primer. This allows users to identify content of the cDNA library input e.g. enriched for mRNA
* [STRING]    `Spike_In`
  - A set of known synthetic RNA molecules with known sequence that are added to the cell lysis mix
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `Total_Number_of_Input_Cells`
  - Number of cells loaded/placed on plates
* [STRING]    `Input_Cells_and_Nuclei`
  - Number of cells and number of nuclei input; entry format: number, number
* [STRING]    `Library_Preparation_Days_from_Index`
  - Number of days between sample for assay was received in lab and the libraries were prepared for sequencing [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Single_Cell_Dissociation_Days_from_Index`
  - Number of days between sample for single cell assay was received in lab and when the sample was dissociated and cells were isolated [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Sequencing_Library_Construction_Days_from_Index`
  - Number of days between sample for assay was received in lab and day of sequencing library construction [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Nucleic_Acid_Capture_Days_from_Index`
  - Number of days between sample for single cell assay was received in lab and day of nucleic acid capture part of library construction (in number of days since sample received in lab) [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `Technical_Replicate_Group`
  - A common term for all files belonging to the same cell or library. Provide a numbering of each library prep batch (can differ from encapsulation and sequencing batch)
* [STRING]    `Cell_Barcode_Offset`
  - Offset in sequence for cell barcode read (in bp): number
* [STRING]    `Cell_Barcode_Length`
  - Length of cell barcode read (in bp): number
* [STRING]    `Valid_Barcodes_Cell_Number`
  - Number
* [STRING]    `UMI_Barcode_Offset`
  - Start position of UMI barcode in the sequence. Values: number, 0 for start of read
* [STRING]    `UMI_Barcode_Length`
  - Length of UMI barcode read (in bp): number
* [STRING]    `Median_UMIs_per_Cell_Number`
  - Number
* [STRING]    `Empty_Well_Barcode`
  - Unique cell barcode assigned to empty cells used as controls in CEL-seq2 assays.
* [STRING]    `Well_Index`
  - Indicate if protein expression (EPCAM/CD45) positive/negative data  is available for each cell in CEL-seq2 assays
* [STRING]    `Feature_Reference_Id`
  - Unique ID for this feature. Must not contain whitespace, quote or comma characters. Each ID must be unique and must not collide with a gene identifier from the transcriptome [https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/feature-bc-analysis#feature-ref]
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

