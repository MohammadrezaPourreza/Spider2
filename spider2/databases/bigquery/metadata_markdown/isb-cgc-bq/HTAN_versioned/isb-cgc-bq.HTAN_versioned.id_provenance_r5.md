# `isb-cgc-bq.HTAN_versioned.id_provenance_r5.md`

## Column details

* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.)
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [STRING]    `CDS_Release`
  - CDS transfer package in which file was included e.g. v22.6.1.seq
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `HTAN_Assayed_Biospecimen_ID`
  - HTAN ID of the biospecimen directly assayed using the experimental platform
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `HTAN_Originating_Biospecimen_ID`
  - HTAN ID of the biopsied or resected biospecimen from the patient from which the assay data were derived
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Biospecimen_Path`
  - Full Biospecimen ancestry path from HTAN_Assayed_Biospecimen_ID to HTAN_Originating_Biospecimen_ID as comma separated list

