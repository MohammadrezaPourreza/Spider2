# `isb-cgc-bq.HTAN.srrs_biospecimen_current.md`

## Column details

* [STRING]    `Collection_Media`
  - Material Specimen is collected into post procedure
* [STRING]    `Fixation_Duration`
  - The length of time, from beginning to end, required to process or preserve biospecimens in fixative (measured in minutes)
* [STRING]    `Biospecimen_Dimension_2`
  - Second dimension of tissue fragment (number, up to one decimal place) measured in units as defined by the "dimensions_unit" CDE
* [STRING]    `Histologic_Morphology_Code`
  - Histologic Morphology Code, based on ICD-O-3. Any valid ICD-O-3 morphology code. See https://seer.cancer.gov/icd-o-3/ and https://seer.cancer.gov/icd-o-3/sitetype.icdo3.20200629.xlsx. Examples: 80510
* [STRING]    `Acquisition_Method_Other_Specify`
  - A custom acquisition method [Text - max length 100 characters]
* [STRING]    `Preinvasive_Morphology`
  - Histologic Morphology not included in ICD-O-3 morphology codes, for preinvasive lesions included in the HTAN
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Site_of_Resection_or_Biopsy`
  - The text term used to describe the anatomic site of the resection or biopsy of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [STRING]    `Fixative_Type`
  - Text term to identify the type of fixative used to preserve a tissue specimen
* [STRING]    `Shipping_Condition_Type`
  - Text descriptor of the shipping environment of a biospecimen.
* [STRING]    `Analyte_Type`
  - The kind of molecular specimen analyte: a molecular derivative (I.e. RNA / DNA / Protein Lysate) obtained from a specimen
* [STRING]    `Collection_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was obtained. If not applicable please enter 'Not Applicable'
* [STRING]    `Biospecimen_Dimension_1`
  - First dimension of tissue fragment (number, up to one decimal place) measured in units as defined by the "dimensions_unit" CDE
* [STRING]    `HTAN_Parent_ID`
  - HTAN ID of parent from which the biospecimen was obtained. Parent could be another biospecimen or a research participant.
* [STRING]    `Additional_Topography`
  - Topography not included in the ICD-O-3 Topography codes.
* [STRING]    `Processing_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was processed. If not applicable please enter 'Not Applicable'
* [STRING]    `Ischemic_Time`
  - Duration of time, in seconds, between when the specimen stopped receiving oxygen and when it was preserved or processed. Integer value.
* [STRING]    `Total_Volume`
  - Numeric value for the total amount of sample or specimen
* [STRING]    `HTAN_Biospecimen_ID`
  - HTAN ID associated with a biosample based on HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Storage_Method`
  - The method by which a biomaterial was stored after preservation or before another protocol was used.
* [STRING]    `Portion_Weight`
  - Numeric value that represents the sample portion weight, measured in milligrams.
* [STRING]    `Acquisition_Method_Type`
  - Records the method of acquisition or source for the specimen under consideration.
* [STRING]    `Source_HTAN_Biospecimen_ID`
  - This is the HTAN ID that may have been assigned to the biospecimen at the site of biospecimen origin (e.g. BU).
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Sectioning_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was sectioned after collection. If not applicable please enter 'Not Applicable'
* [STRING]    `Topography_Code`
  - Topography Code, indicating site within the body, based on ICD-O-3.
* [STRING]    `Ischemic_Temperature`
  - Specify whether specimen experienced warm or cold ischemia.
* [STRING]    `Tumor_Tissue_Type`
  - Text that describes the kind of disease present in the tumor specimen as related to a specific timepoint (add rows to select multiple values along with timepoints)
* [STRING]    `Slide_Charge_Type`
  - A description of the charge on the glass slide.
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `Preservation_Method`
  - Text term that represents the method used to preserve the sample.
* [STRING]    `Section_Number_in_Sequence`
  - Numeric value (integer, including ranges) provided to a sample in a series of sections (list all adjacent sections in the Adjacent Biospecimen IDs field)
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Section_Thickness_Value`
  - Numeric value to describe the thickness of a slice to tissue taken from a biospecimen, measured in microns (um).
* [STRING]    `Specimen_Laterality`
  - For tumors in paired organs, designates the side on which the specimen was obtained.
* [STRING]    `Biospecimen_Type`
  - Biospecimen Type
* [STRING]    `Adjacent_Biospecimen_IDs`
  - List of HTAN Identifiers (separated by commas) of adjacent biospecimens cut from the same sample; for example HTA3_3000_3, HTA3_3000_4, ...
* [STRING]    `Biospecimen_Dimension_3`
  - Third dimension of tissue fragment (number, up to one decimal place) measured in units as defined by the "dimensions_unit" CDE
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest

