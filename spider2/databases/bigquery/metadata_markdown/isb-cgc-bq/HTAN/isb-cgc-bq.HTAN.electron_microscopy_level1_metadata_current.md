# `isb-cgc-bq.HTAN.electron_microscopy_level1_metadata_current.md`

## Column details

* [STRING]    `EM_voltage`
  - Accelerating voltage in kiloelectronvolts (keV)
* [STRING]    `EM_beam_current`
  - Beam current in nanoamps (nA)
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `EM_dwell_or_exposure_time`
  - Duration in microseconds (µs) of electron beam data collection per pixel or frame
* [STRING]    `SizeC`
  - Number of channels. Integer >= 1
* [STRING]    `PhysicalSizeY`
  - Physical size (Y-dimension) of a pixel. Units are set by PhysicalSizeYUnit. Floating point value > 0.
* [STRING]    `SizeX`
  - Size of image: X dimension (in pixels). Integer >= 1
* [STRING]    `EM_stage_tilt`
  - Physical stage tilt in degrees with respect to the electron beam
* [STRING]    `EM_spot_size`
  - Beam spot size in micrometers (µm)
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `EM_signal_processing`
  - SNR improvement strategies used
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `PhysicalSizeX`
  - Physical size (X-dimension) of a pixel. Units are set by PhysicalSizeXUnit. Floating point value > 0.
* [STRING]    `EM_method`
  - Electron microscopy method used
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `PhysicalSizeZ`
  - Physical size (Z-dimension) of a pixel. Units are set by PhysicalSizeZUnit. Floating point value > 0.
* [STRING]    `EM_instrument`
  - Make and model of the EM instrument used
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `EM_signal_or_contrast_mech`
  - How the electron microscopy signal is generated from the sample
* [STRING]    `SizeY`
  - Size of image: Y dimension (in pixels). Integer >= 1
* [STRING]    `SizeZ`
  - Size of image: Z dimension (in pixels). Integer >= 1
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `EM_contrast_type`
  - Does the image use standard SEM contrast or TEM contrast
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

