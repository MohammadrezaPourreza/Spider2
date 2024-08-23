# `isb-cgc-bq.HTAN.bulkWES_level1_metadata_current.md`

## Column details

* [STRING]    `Adapter_Name`
  - Name of the sequencing adapter. String
* [STRING]    `Library_Layout`
  - Sequencing read type
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Target_Depth`
  - The targeted read depth prior to sequencing. Integer
* [STRING]    `Base_Caller_Name`
  - Name of the base caller. String
* [STRING]    `Read_Length`
  - The length of the sequencing reads. Can be integer, null
* [STRING]    `Fragment_Maximum_Length`
  - Maximum length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Integer
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
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `Library_Preparation_Kit_Name`
  - Name of Library Preparation Kit. String
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Adapter_Sequence`
  - Base sequence of the sequencing adapter. String
* [STRING]    `Library_Preparation_Days_from_Index`
  - Number of days between sample for assay was received in lab and the libraries were prepared for sequencing [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Fragment_Mean_Length`
  - Mean length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Number
* [STRING]    `Flow_Cell_Barcode`
  - Flow cell barcode. Wrong or missing information may affect analysis results. String
* [STRING]    `Fragment_Standard_Deviation_Length`
  - Standard deviation of the sequenced fragments length (e.g., as predicted by Agilent Bioanalyzer). Number
* [STRING]    `Target_Capture_Kit`
  - Description that can uniquely identify a target capture kit. Suggested value is a combination of vendor, kit name, and kit version.
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Lane_Number`
  - The basic machine unit for sequencing. For Illumina machines, this reflects the physical lane number. Wrong or missing information may affect analysis results. Integer
* [STRING]    `Read_Indicator`
  - Indicate if this is Read 1 (R1), Read 2 (R2), Index Reads (I1), or Other
* [STRING]    `Size_Selection_Range`
  - Range of size selection. String
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

