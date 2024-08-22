# `isb-cgc-bq.HTAN_versioned.bulkWES_level1_metadata_r2_v2.md`

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
* [STRING]    `Sequencing_Batch_ID`
  - Links samples to a specific local sequencer run. Can be string or 'null'
* [STRING]    `Library_Layout`
  - Sequencing read type
* [STRING]    `Read_Indicator`
  - Indicate if this is Read 1 (R1) or Read 2 (R2)
* [STRING]    `Library_Selection_Method`
  - How the molecules are isolated.
* [STRING]    `Read_Length`
  - The length of the sequencing reads. Can be integer, null
* [STRING]    `Target_Capture_Kit`
  - Description that can uniquely identify a target capture kit. Suggested value is a combination of vendor, kit name, and kit version.
* [STRING]    `Library_Preparation_Kit_Name`
  - Name of Library Preparation Kit. String
* [STRING]    `Library_Preparation_Kit_Vendor`
  - Vendor of Library Preparation Kit. String
* [STRING]    `Library_Preparation_Kit_Version`
  - Version of Library Preparation Kit. String
* [STRING]    `Sequencing_Platform`
  - A platform is an object aggregate that is the set of instruments and software needed to perform a process [OBI_0000050]. Specific model of the sequencing instrument.
* [STRING]    `Adapter_Name`
  - Name of the sequencing adapter. String
* [STRING]    `Adapter_Sequence`
  - Base sequence of the sequencing adapter. String
* [STRING]    `Base_Caller_Name`
  - Name of the base caller. String
* [STRING]    `Base_Caller_Version`
  - Version of the base caller. String
* [STRING]    `Flow_Cell_Barcode`
  - Flow cell barcode. Wrong or missing information may affect analysis results. String
* [STRING]    `Fragment_Maximum_Length`
  - Maximum length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Integer
* [STRING]    `Fragment_Mean_Length`
  - Mean length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Number
* [STRING]    `Fragment_Minimum_Length`
  - Minimum length of the sequenced fragments (e.g., as predicted by Agilent Bioanalyzer). Integer
* [STRING]    `Fragment_Standard_Deviation_Length`
  - Standard deviation of the sequenced fragments length (e.g., as predicted by Agilent Bioanalyzer). Number
* [STRING]    `Lane_Number`
  - The basic machine unit for sequencing. For Illumina machines, this reflects the physical lane number. Wrong or missing information may affect analysis results. Integer
* [STRING]    `Multiplex_Barcode`
  - The barcode/index sequence used. Wrong or missing information may affect analysis results. String
* [STRING]    `Library_Preparation_Days_from_Index`
  - Number of days between sample for assay was received in lab and the libraries were prepared for sequencing [number]. If not applicable please enter 'Not Applicable'
* [STRING]    `Size_Selection_Range`
  - Range of size selection. String
* [STRING]    `Target_Depth`
  - The targeted read depth prior to sequencing. Integer
* [STRING]    `To_Trim_Adapter_Sequence`
  - Does the user suggest adapter trimming?
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

