# `isb-cgc-bq.CPTAC.clinical_diagnoses_proteogenomic_translational_research_centers_pdc_current.md`

## Column details

* [STRING]    `case_id`
  - Unique identifier associated with a specific patient (e.g. 24cb0fcb-63d6-11e8-bcf1-0a2705229b82)
* [STRING]    `case_submitter_id`
  - Unique identifier deriving from the data submitter that is associated with a specific patient (e.g. 05BR016)
* [STRING]    `project_submitter_id`
  - Unique identifier deriving from the data submitter that is associated with a specific project (e.g. CPTAC3-Discovery)
* [STRING]    `diagnosis_id`
  - Unique identifier for data from the investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation (e.g. e8dd475b-693a-11ea-b1fd-0aad30af8a83)
* [STRING]    `diagnosis_submitter_id`
  - Unique identifier deriving from data submitter attributed to data from the investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation (e.g. 33-DX)
* [STRING]    `primary_diagnosis`
  - Text term used to describe the patient's histologic diagnosis, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [INT64]    `age_at_diagnosis`
  - Age at the time of diagnosis expressed in number of days since birth
* [FLOAT64]    `days_to_last_follow_up`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days
* [FLOAT64]    `days_to_last_known_disease_status`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days
* [FLOAT64]    `days_to_recurrence`
  - Number of days between the date used for index and the date the patient's disease recurred
* [STRING]    `classification_of_tumor`
  - Text that describes the kind of disease present in the tumor specimen as related to a specific timepoint
* [STRING]    `last_known_disease_status`
  - Text term that describes the last known state or condition of an individual's neoplasm
* [STRING]    `morphology`
  - The third edition of the International Classification of Diseases for Oncology, published in 2000 used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms. The study of the structure of the cells and their arrangement to constitute tissues and, finally, the association among these to form organs. In pathology, the microscopic process of identifying normal and abnormal morphologic characteristics in tissues, by employing various cytochemical and immunocytochemical stains. A system of numbered categories for representation of data
* [BOOL]    `progression_or_recurrence`
  - Yes/No/Unknown indicator to identify whether a patient has had a new tumor event after initial treatment
* [STRING]    `site_of_resection_or_biopsy`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `tissue_or_organ_of_origin`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `tumor_grade`
  - Numeric value to express the degree of abnormality of cancer cells, a measure of differentiation and aggressiveness
* [STRING]    `tumor_stage`
  - The extent of a cancer in the body. Staging is usually based on the size of the tumor, whether lymph nodes contain cancer, and whether the cancer has spread from the original site to other parts of the body. The accepted values for tumor_stage depend on the tumor site, type, and accepted staging system. These items should accompany the tumor_stage value as associated metadata

