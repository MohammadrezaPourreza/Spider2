# `isb-cgc-bq.HTAN.bulkRNAseq_level1_metadata_current.md`

## Column details

* [STRING]    `Micro_region_Seq_Platform`
  - The platform used for micro-regional RNA sequencing (if applicable)
* [STRING]    `Nucleic_Acid_Source`
  - The source of the input nucleic molecule
* [STRING]    `Adapter_Name`
  - Name of the sequencing adapter. String
* [STRING]    `Library_Layout`
  - Sequencing read type
* [STRING]    `Library_Strand`
  - Library stranded-ness.
* [STRING]    `Adapter_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Per_Base_Sequence_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Basic_Statistics`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Target_Depth`
  - The targeted read depth prior to sequencing. Integer
* [STRING]    `Total_Reads`
  - Total number of reads per sample. Integer
* [STRING]    `Base_Caller_Name`
  - Name of the base caller. String
* [STRING]    `QC_Workflow_Link`
  - Link to workflow used. String
* [STRING]    `ROI_Tag`
  - The tag or grouping used to identify the ROI in micro-regional RNA sequencing (if applicable). Must match the ROI tag within the count matrix in level 3.
* [STRING]    `QC_Workflow_Version`
  - Major version for a workflow. String
* [STRING]    `Read_Length`
  - The length of the sequencing reads. Can be integer, null
* [STRING]    `Fragment_Maximum_Length`
  - Maximum length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Integer
* [STRING]    `DV200`
  - Represents the percentage of RNA fragments that are >200 nucleotides in size. Number
* [STRING]    `Size_Selection_Range`
  - Range of size selection. String
* [STRING]    `Multiplex_Barcode`
  - The barcode/index sequence used. Wrong or missing information may affect analysis results. String
* [STRING]    `Library_Preparation_Kit_Version`
  - Version of Library Preparation Kit. String
* [STRING]    `Fragment_Minimum_Length`
  - Minimum length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Integer
* [STRING]    `Base_Caller_Version`
  - Version of the base caller. String
* [STRING]    `Library_Preparation_Kit_Vendor`
  - Vendor of Library Preparation Kit. String
* [STRING]    `Library_Selection_Method`
  - How RNA molecules are isolated.
* [STRING]    `To_Trim_Adapter_Sequence`
  - Does the user suggest adapter trimming?
* [STRING]    `RIN`
  - A numerical assessment of the integrity of RNA based on the entire electrophoretic trace of the RNA sample including the presence or absence of degradation products. Number
* [STRING]    `Per_Sequence_GC_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `Overrepresented_Sequences`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Sequence_Length_Distribution`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Sequence_Duplication_Levels`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Library_Preparation_Kit_Name`
  - Name of Library Preparation Kit. String
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Percent_GC_Content`
  - The overall %GC of all bases in all sequences. Integer
* [STRING]    `Per_Tile_Sequence_Quality`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Adapter_Sequence`
  - Base sequence of the sequencing adapter. String
* [STRING]    `Per_Base_N_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Library_Preparation_Days_from_Index`
  - Number of days between sample for assay was received in lab and the libraries were prepared for sequencing [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `QC_Workflow_Type`
  - Generic name for the workflow used to analyze a data set. String
* [STRING]    `Kmer_Content`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Per_Base_Sequence_Quality`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Fragment_Mean_Length`
  - Mean length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Number
* [STRING]    `Flow_Cell_Barcode`
  - Flow cell barcode. Wrong or missing information may affect analysis results. String
* [STRING]    `Fragment_Standard_Deviation_Length`
  - Standard deviation of the sequenced fragments length (e.g., as predicted by Agilent Bioanalyzer). Number
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Lane_Number`
  - The basic machine unit for sequencing. For Illumina machines, this reflects the physical lane number. Wrong or missing information may affect analysis results. Integer
* [STRING]    `Per_Sequence_Quality_Score`
  - State classification given by FASTQC for the metric. Metric specific details about the states are available on their website.
* [STRING]    `Encoding`
  - Version of ASCII encoding of quality values found in the file. String
* [STRING]    `Read_Indicator`
  - Indicate if this is Read 1 (R1), Read 2 (R2), Index Reads (I1), or Other
* [STRING]    `Spike_In_Concentration`
  - The final concentration or dilution (for commercial sets) of the spike in mix [PMID:21816910]
* [STRING]    `Transcript_Integrity_Number`
  - Used to describe the quality of the starting material, esp. in regards to FFPE samples. Number
* [STRING]    `Spike_In`
  - A set of known synthetic RNA molecules with known sequence that are added to the cell lysis mix
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `Sequencing_Batch_ID`
  - Links samples to a specific local sequencer run. Can be string or 'null'
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

