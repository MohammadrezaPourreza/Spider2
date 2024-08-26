# `isb-cgc-bq.HTAN_versioned.clinical_tier3_lung_r4.md`

## Column details

* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Stop_Days_from_Index`
  - Number of days from the date of birth (index date) to the end date of the event (e.g. exposure to environmental factor, treatment start, etc.). Note: if the event occurs at a single time point, e.g. a diagnosis or a lab test, the values for this column is 'Not Applicable'
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Current_Lung_Cancer_Symptoms`
  - Reported lung cancer related symptoms person is currently experiencing
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Lung_Adjacent_Histology_Type`
  - The type of morphologic characteristics observed by microscope in the tissue next to a benign or malignant tissue growth
* [STRING]    `Lung_Cancer_Harboring_Genomic_Aberrations`
  - Genomic aberrations in participants with lung cancer (specific lung cancer associated gene mutations not covered in Tiers 1 and 2)
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Lung_Cancer_Participant_Procedure_History`
  - Text name of a surgical or operative procedure used in a natural history protocol of a lung cancer participant.
* [STRING]    `Lung_Tumor_Location_Anatomic_Site`
  - Anatomic location of the tumor inside the lung
* [STRING]    `Lung_Tumor_Lobe_Bronchial_Location`
  - Anatomic lobe and bronchial location of the tumor inside the lung
* [STRING]    `Lung_Topography`
  - Lung PCA specific topography (not covered in previous tiers)
* [STRING]    `Start_Days_from_Index`
  - Number of days from the date of birth (index date) to the date of an event (e.g. exposure to environmental factor, treatment start, etc.). If not applicable please enter 'Not Applicable'
* [STRING]    `Lung_Cancer_Detection_Method_Type`
  - The means, manner of procedure, or systematic course of actions performed in order to discover or identify lung cancer
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest

