# `isb-cgc-bq.HTAN_versioned.clinical_tier3_breast_r3.md`

## Column details

* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Start_Days_from_Index`
  - Number of days from the date of birth (index date) to the date of an event (e.g. exposure to environmental factor, treatment start, etc.). If not applicable please enter 'Not Applicable'
* [STRING]    `Stop_Days_from_Index`
  - Number of days from the date of birth (index date) to the end date of the event (e.g. exposure to environmental factor, treatment start, etc.). Note: if the event occurs at a single time point, e.g. a diagnosis or a lab test, the values for this column is 'Not Applicable'
* [STRING]    `Breast_Carcinoma_Detection_Method_Type`
  - The means, manner of procedure, or systematic course of actions performed in order to discover or identify breast cancer.
* [STRING]    `Breast_Carcinoma_Histology_Category`
  - Classification of the type of invasive breast carcinoma diagnosed based on histologic attributes.
* [STRING]    `Invasive_Lobular_Breast_Carcinoma_Histologic_Category`
  - The histologic subtype for an infiltrating lobular carcinoma of the breast.
* [STRING]    `Invasive_Ductal_Breast_Carcinoma_Histologic_Category`
  - The histologic subtype for the most common type of invasive breast carcinoma.
* [STRING]    `Breast_Biopsy_Procedure_Finding_Type`
  - Text term to describe the result of the examination of the breast tissue specimen or fluid as related to the presence and nature of disease.
* [STRING]    `Breast_Quadrant_Site`
  - The breast quadrant or structure from which the breast tissue specimen was removed for microscopic examination.
* [STRING]    `Breast_Cancer_Assessment_Tests`
  - Text term to identify assessment tests done in participants during diagnosis
* [STRING]    `Breast_Cancer_Genomic_Test_Performed`
  - Text term that represents the name of the genomic test performed for breast cancer.
* [STRING]    `Mammaprint_Risk_Group`
  - Text term that represents the risk group for breast cancer as determined by assessment of the MammaPrint test.
* [STRING]    `Oncotype_Risk_Group`
  - Text term that represents the risk group for breast cancer as determined by assessment of the Oncotype recurrence score.
* [STRING]    `Breast_Carcinoma_Estrogen_Receptor_Status`
  - Text term to represent the overall result of Estrogen Receptor (ER) testing in a participant with breast cancer
* [STRING]    `Breast_Carcinoma_Progesteroner_Receptor_Status`
  - Text term to represent the overall result of Progresterone Receptor (PR) testing in a participant with breast cancer
* [STRING]    `Breast_Cancer_Allred_Estrogen_Receptor_Score`
  - The numeric Allred score, that is cell staining percentage plus intensity, to determine estrogen receptor status.
* [STRING]    `Prior_Invasive_Breast_Disease`
  - Text term to indicate prior invasive breast condition in the participant
* [STRING]    `Breast_Carcinoma_ER_Status_Percentage_Value`
  - A numerical quantity measured or assigned or computed which captures the estrogen receptor level measured in a participant with breast cancer
* [STRING]    `Breast_Carcinoma_PR_Status_Percentage_Value`
  - A numerical quantity measured or assigned or computed which captures the progesterone receptor level measured in a participant with breast cancer
* [STRING]    `HER2_Breast_Carcinoma_Copy_Number_Total`
  - Result of HER2 Copy Number testing (in a participant with breast cancer), expressed as a range of values.
* [STRING]    `Breast_Carcinoma_Centromere_17_Copy_Number`
  - Result of Centromere 17 testing in a sample or specimen of metastatic breast carcinoma, expressed as a range of values.
* [STRING]    `Breast_Carcinoma_HER2_Centromere17_Copynumber_Total`
  - Number of Cells Counted for HER2 & Centromere 17 Copy Numbers in a participant with breast cancer
* [STRING]    `Breast_Carcinoma_HER2_Chromosome17_Ratio`
  - HER2 chromosome 17 ratio in participants with breast cancer
* [STRING]    `Breast_Carcinoma_Surgical_Procedure_Name`
  - Text name of a surgical procedure performed for a person with a diagnosis of breast cancer
* [STRING]    `Breast_Carcinoma_HER2_Ratio_Diagnosis`
  - HER2 ratio of the participant at diagnosis
* [STRING]    `Breast_Carcinoma_HER2_Status`
  - Text term to signify the result of the medical procedure that involves testing a sample of blood or tissue for HER2 in a participant with breast cancer
* [STRING]    `Hormone_Therapy_Breast_Cancer_Prevention_Indicator`
  - Did the patient receive hormonal therapy for prevention of breast cancer?
* [STRING]    `Breast_Carcinoma_ER_Staining_Intensity`
  - Text term to indicate the ER staining intensity on pathology assessment in a participant with breast cancer
* [STRING]    `Breast_Carcinoma_PR_Staining_Intensity`
  - Text term to indicate the PR staining intensity on pathology assessment in a participant with breast cancer
* [STRING]    `Oncotype_Score`
  - OncotypeDX recurrence score
* [STRING]    `Breast_Imaging_Performed_Type`
  - The kind of technology or method performed for screening, diagnosis, surgical procedures or therapy that aids in the visualization of the breast(s).
* [STRING]    `Multifocal_Breast_Carcinoma_Present_Indicator`
  - A response to indicate if there is breast cancer characterized by the presence of multiple cancerous tumors that originate from the same clone and usually located in the same quadrant of the breast.
* [STRING]    `Multicentric_Breast_Carcinoma_Present_Indicator`
  - A response to indicate if there is breast cancer characterized by the presence of multiple cancerous tumors that originate from different clones and usually located in different quadrants of the breast.
* [STRING]    `BIRADS_Mammography_Breast_Density_Category`
  - The category that describes the relative amount of different tissues present in the breast on a mammogram based on the updated 2015 edition of the American College of Radiology's Breast Imaging Reporting and Data System (BI-RADS) reporting guidelines.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest
* [STRING]    `Uuid`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819

