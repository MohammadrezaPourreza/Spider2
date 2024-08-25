# `isb-cgc-bq.HTAN.biospecimen_current.md`

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
* [STRING]    `Fiducial_Marker`
  - Imaging specific: fiducial markers for the alignment of images taken across multiple rounds of imaging.
* [STRING]    `Method_of_Nucleic_Acid_Isolation`
  - Bulk RNA & DNA-seq specific: method used for nucleic acid isolation. E.g. Qiagen Allprep, Qiagen miRNAeasy. [Text - max length 100]
* [STRING]    `Number_Proliferating_Cells`
  - Numeric value that represents the count of proliferating cells determined during pathologic review of the sample slide(s).
* [STRING]    `Biospecimen_Dimension_3`
  - Third dimension of tissue fragment (number, up to one decimal place) measured in units as defined by the "dimensions_unit" CDE
* [STRING]    `Analyte_Type`
  - The kind of molecular specimen analyte: a molecular derivative (I.e. RNA / DNA / Protein Lysate) obtained from a specimen
* [STRING]    `Collection_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was obtained. If not applicable please enter 'Not Applicable'
* [STRING]    `Histology_Assessment_By`
  - Text term describing who (in what role) made the histological assessments of the sample
* [STRING]    `Biospecimen_Dimension_1`
  - First dimension of tissue fragment (number, up to one decimal place) measured in units as defined by the "dimensions_unit" CDE
* [STRING]    `Histology_Assessment_Medium`
  - The method of assessment used to characterize histology
* [STRING]    `HTAN_Parent_ID`
  - HTAN ID of parent from which the biospecimen was obtained. Parent could be another biospecimen or a research participant.
* [STRING]    `Lysis_Buffer`
  - scRNA-seq specific: Type of lysis buffer used
* [STRING]    `Percent_Monocyte_Infiltration`
  - Numeric value to represent the percentage of monocyte infiltration in a sample or specimen.
* [STRING]    `Processing_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was processed. If not applicable please enter 'Not Applicable'
* [STRING]    `Percent_Lymphocyte_Infiltration`
  - Numeric value to represent the percentage of infiltration by lymphocytes in a solid tissue normal sample or specimen.
* [STRING]    `Ischemic_Time`
  - Duration of time, in seconds, between when the specimen stopped receiving oxygen and when it was preserved or processed. Integer value.
* [STRING]    `Percent_Normal_Cells`
  - Numeric value to represent the percentage of normal cell content in a malignant tumor sample or specimen.
* [STRING]    `HTAN_Biospecimen_ID`
  - HTAN ID associated with a biosample based on HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Storage_Method`
  - The method by which a biomaterial was stored after preservation or before another protocol was used.
* [STRING]    `Portion_Weight`
  - Numeric value that represents the sample portion weight, measured in milligrams.
* [STRING]    `Total_Volume`
  - Numeric value for the total amount of sample or specimen
* [STRING]    `Degree_of_Dysplasia`
  - Information related to the presence of cells that look abnormal under a microscope but are not cancer. Records the degree of dysplasia for the cyst or lesion under consideration.
* [STRING]    `Tumor_Infiltrating_Lymphocytes`
  - Measure of Tumor-Infiltrating Lymphocytes [Number]
* [STRING]    `Acquisition_Method_Type`
  - Records the method of acquisition or source for the specimen under consideration.
* [STRING]    `Source_HTAN_Biospecimen_ID`
  - This is the HTAN ID that may have been assigned to the biospecimen at the site of biospecimen origin (e.g. BU).
* [STRING]    `Dysplasia_Fraction`
  - Resulting value to represent the number of pieces of dysplasia divided by the total number of pieces. [Text: max length 5]
* [STRING]    `Percent_Granulocyte_Infiltration`
  - Numeric value to represent the percentage of infiltration by granulocytes in a tumor sample or specimen.
* [STRING]    `Percent_Stromal_Cells`
  - Numeric value to represent the percentage of reactive cells that are present in a malignant tumor sample or specimen but are not malignant such as fibroblasts, vascular structures, etc.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Slicing_Method`
  - Imaging specific: the method by which the tissue was sliced.
* [STRING]    `Percent_Tumor_Cells`
  - Numeric value that represents the percentage of infiltration by tumor cells in a sample.
* [STRING]    `Percent_Eosinophil_Infiltration`
  - Numeric value to represent the percentage of infiltration by eosinophils in a tumor sample or specimen.
* [STRING]    `Ischemic_Temperature`
  - Specify whether specimen experienced warm or cold ischemia.
* [STRING]    `Tumor_Tissue_Type`
  - Text that describes the kind of disease present in the tumor specimen as related to a specific timepoint (add rows to select multiple values along with timepoints)
* [STRING]    `Sectioning_Days_from_Index`
  - Number of days from the research participant's index date that the biospecimen was sectioned after collection. If not applicable please enter 'Not Applicable'
* [STRING]    `Slide_Charge_Type`
  - A description of the charge on the glass slide.
* [STRING]    `Site_Data_Source`
  - Text to identify the data source for the specimen/sample from within the HTAN center, if applicable. Any identifier used within the center to identify data sources. No PHI/PII is allowed.
* [STRING]    `Protocol_Link`
  - Protocols.io ID or DOI link to a free/open protocol resource describing in detail the assay protocol (e.g. surface markers used in Smart-seq, dissociation duration,  lot/batch numbers for key reagents such as primers, sequencing reagent kits, etc.) or the protocol by which the sample was obtained or generated.
* [STRING]    `Processing_Location`
  - Site with an HTAN center where specimen processing occurs, if applicable. Any identifier used within the center to identify processing location. No PHI/PII is allowed.
* [STRING]    `Percent_Neutrophil_Infiltration`
  - Numeric value to represent the percentage of infiltration by neutrophils in a tumor sample or specimen.
* [STRING]    `Preservation_Method`
  - Text term that represents the method used to preserve the sample.
* [STRING]    `Percent_Tumor_Nuclei`
  - Numeric value to represent the percentage of tumor nuclei in a malignant neoplasm sample or specimen.
* [STRING]    `Section_Number_in_Sequence`
  - Numeric value (integer, including ranges) provided to a sample in a series of sections (list all adjacent sections in the Adjacent Biospecimen IDs field)
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Section_Thickness_Value`
  - Numeric value to describe the thickness of a slice to tissue taken from a biospecimen, measured in microns (um).
* [STRING]    `Percent_Inflam_Infiltration`
  - Numeric value to represent local response to cellular injury, marked by capillary dilatation, edema and leukocyte infiltration; clinically, inflammation is manifest by redness, heat, pain, swelling and loss of function, with the need to heal damaged tissue.
* [STRING]    `Specimen_Laterality`
  - For tumors in paired organs, designates the side on which the specimen was obtained.
* [STRING]    `Biospecimen_Type`
  - Biospecimen Type
* [STRING]    `Adjacent_Biospecimen_IDs`
  - List of HTAN Identifiers (separated by commas) of adjacent biospecimens cut from the same sample; for example HTA3_3000_3, HTA3_3000_4, ...
* [STRING]    `Mounting_Medium`
  - The solution in which the specimen is embedded, generally under a cover glass. It may be liquid, gum or resinous, soluble in water, alcohol or other solvents and be sealed from the external atmosphere by non-soluble ringing media
* [STRING]    `Percent_Necrosis`
  - Numeric value to represent the percentage of cell death in a malignant tumor sample or specimen.
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest

