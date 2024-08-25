# `isb-cgc-bq.HTAN.imaging_level2_metadata_current.md`

## Column details

* [STRING]    `Pyramid`
  - Does data file contain pyramid of images
* [STRING]    `Channel_Metadata_Filename`
  - Full path within Synapse project of uploaded companion CSV file containing channel-level metadata details
* [STRING]    `Frame_Averaging`
  - Number of frames averaged together (if no averaging, set to 1). Integer >= 1
* [STRING]    `PlaneCount`
  - Number of Z-planes (not to be confused with downsampled "pyramid"). Integer >=1
* [STRING]    `PhysicalSizeXUnit`
  - The units of the physical size of a pixel. See OME enumeration of allowed values for the UnitsLength attribute -- default: microns (um)
* [STRING]    `MERFISH_Codebook_File`
  - The codebook is an auxiliary MERFISH file that describes how each grouping of bits is converted to a gene name.
* [STRING]    `Objective`
  - Objective
* [STRING]    `DimensionOrder`
  - The order in which the individual planes of data are interleaved.
* [STRING]    `WorkingDistanceUnit`
  - The units of the working distance. See OME enumeration of allowed values for the UnitsLength attribute -- default: microns (um)
* [STRING]    `Image_ID`
  - Unique internal image identifier. eg "Image:0". (To be extracted from OME-XML)
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `FOVX`
  - Field of view X dimension. Floating point
* [STRING]    `Imaging_Assay_Type`
  - Type of imaging assay
* [STRING]    `Comment`
  - Free text field (generally for QC comment)
* [STRING]    `FOV_number`
  - Index of FOV (as it pertains to its sequence order). Integer >= 1
* [STRING]    `FOVY`
  - Field  of view Y dimension. Floating point value
* [STRING]    `Zstack`
  - Does data file contain a Z-stack of images
* [STRING]    `SizeC`
  - Number of channels. Integer >= 1
* [STRING]    `PhysicalSizeY`
  - Physical size (Y-dimension) of a pixel. Units are set by PhysicalSizeYUnit. Floating point value > 0.
* [STRING]    `SizeX`
  - Size of image: X dimension (in pixels). Integer >= 1
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `HTAN_Parent_Biospecimen_ID`
  - HTAN Biospecimen Identifier (eg HTANx_yyy_zzz) indicating the biospecimen(s) from which these files were derived; multiple parent biospecimen should be comma-separated
* [STRING]    `Passed_QC`
  - Did all channels pass QC (if not add free text Comment)
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `PhysicalSizeX`
  - Physical size (X-dimension) of a pixel. Units are set by PhysicalSizeXUnit. Floating point value > 0.
* [STRING]    `Microscope`
  - Microscope type (manufacturer, model, etc) used for this experiment
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `SizeT`
  - Number of time points. Integer >= 1
* [STRING]    `PixelType`
  - Data type for each pixel value. E.g. "uint16"
* [STRING]    `PhysicalSizeZ`
  - Physical size (Z-dimension) of a pixel. Units are set by PhysicalSizeZUnit. Floating point value > 0.
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `SizeY`
  - Size of image: Y dimension (in pixels). Integer >= 1
* [STRING]    `Pixels_BigEndian`
  - Boolean (True/False)
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `PhysicalSizeYUnit`
  - The units of the physical size of a pixel. See OME enumeration of allowed values for the UnitsLength attribute -- default: microns (um)
* [STRING]    `FOVYUnit`
  - Field of view Y dimension units. See OME enumeration of allowed values for the UnitsLength attribute -- default: microns (um)
* [STRING]    `LensNA`
  - The numerical aperture of the lens. Floating point value > 0.
* [STRING]    `NominalMagnification`
  - The magnification of the lens as specified by the manufacturer - i.e. '60' is a 60X lens. floating point value > 1(no units)
* [STRING]    `SizeZ`
  - Size of image: Z dimension (in pixels). Integer >= 1
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Immersion`
  - Immersion medium
* [STRING]    `FOVXUnit`
  - Field of view X dimension units. See OME enumeration of allowed values for the UnitsLength attribute -- default: microns (um)
* [STRING]    `PhysicalSizeZUnit`
  - The units of the physical size of a pixel. See OME enumeration of allowed values for the UnitsLength attribute -- default: microns (um)
* [STRING]    `MERFISH_Positions_File`
  - The positions file is an auxiliary MERFISH file that describes the location of bead positions in the assay.
* [STRING]    `WorkingDistance`
  - The working distance of the lens, expressed as a floating point number. Floating point > 0.
* [STRING]    `Tseries`
  - Does data file contain a time-series of images
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

