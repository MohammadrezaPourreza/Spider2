# `isb-cgc-bq.HTAN_versioned.massSpectrometry_level1_metadata_r5.md`

## Column details

* [STRING]    `LC_Instrument_Vendor_and_Model`
  - The manufacturer of the instrument used for LC.
* [STRING]    `LC_Column_Vendor_and_Model`
  - The manufacturer of the LC Column unless self-packed, pulled tip capilary is used and the model number/name of the LC Column - IF custom self-packed, pulled tip calillary is used enter 'Pulled tip capilary'
* [STRING]    `MS_Source`
  - The ion source type used for surface sampling (MALDI, MALDI-2, DESI, or SIMS) or LC-MS/MS data acquisition (nESI)
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `LC_ID_Value`
  - LC column inner diameter in microns.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Data_Collection_Mode`
  - Mode of data collection in tandem MS assays. Either DDA (Data-dependent acquisition) or DIA (Data-indemendent acquisition.
* [STRING]    `Polarity`
  - The polarity of the mass analysis (positive or negative ion modes)
* [STRING]    `MS_Labeling`
  - Indicates whether samples were labeled prior to MS analysis (e.g., TMT)
* [STRING]    `Analyte_Type`
  - The kind of molecular specimen analyte: a molecular derivative (I.e. RNA / DNA / Protein Lysate) obtained from a specimen
* [STRING]    `MS_based_Assay_Type`
  - Analytes are the target molecules being measured with the assay.
* [STRING]    `LC_Gradient`
  - The program dictates the mobile phase solvent composition over the course of the chromatographic run.
* [STRING]    `LC_Temp_Value`
  - LC temperature in C.
* [STRING]    `LC_Length_Value`
  - LC column length in cm.
* [STRING]    `MS_based_Targeted`
  - Specifies whether or not a specific molecule(s) is/are targeted for detection/measurement by the assay. Example: The MALDI Imaging analyte is lipids.
* [STRING]    `Mass_Range_Low_Value`
  - The low value of the scanned mass range for MS1 in m/z.
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `MS_Instrument_Metadata_File`
  - Additional file containing instrument metadata details. Use either synapse_path or entity_Id
* [STRING]    `MS_Instrument_Vendor_and_Model`
  - An acquisition instrument is the device that contains the signal detection hardware and signal processing software. Assays generate signals such as light of various intensities or color or signals representing the molecular mass.
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `MS_Batch_ID`
  - Batch ID indicating a set of samples that were run together.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `LC_Resin`
  - Details of the resin used for lc, including vendor, particle size, pore size
* [STRING]    `Mass_Range_High_Value`
  - The high value of the scanned mass range for MS1 in m/z.
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `LC_Mobile_Phase_A`
  - Composition of mobile phase A
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `LC_Mobile_Phase_B`
  - Composition of mobile phase B
* [STRING]    `MS_Scan_Mode`
  - Indicates whether experiment is MS, MS/MS, or other (possibly MS3 for TMT)
* [STRING]    `LC_Flow_Rate`
  - LC flow rate in nL/min.
* [STRING]    `Software_and_Version`
  - Name of software used to generate expression values. String
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

