# `isb-cgc-bq.CPTAC.clinical_CPTAC3_discovery_and_confirmatory_pdc_current.md`

## Column details

* [STRING]    `case_id`
  - Unique identifier associated with a specific patient (e.g. 24cb0fcb-63d6-11e8-bcf1-0a2705229b82)
* [STRING]    `case_submitter_id`
  - Unique identifier deriving from the data submitter that is associated with a specific patient (e.g. 05BR016)
* [STRING]    `project_submitter_id`
  - Unique identifier deriving from the data submitter that is associated with a specific project (e.g. CPTAC3-Discovery)
* [STRING]    `primary_site`
  - The text term used to describe the general location of the malignant disease, as categorized by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `disease_type`
  - The text term used to describe the type of malignant disease, as categorized by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `demographic_id`
  - Unique identifier attributed to data for the characterization of the patient by means of segmenting the population--for instance, characterization by age, sex, or race (e.g. 848b480c-0f56-11e9-a064-0a9c39d33490)
* [STRING]    `demographic_submitter_id`
  - Unique identifier deriving from data submitter that is attributed to data for the characterization of the patient by means of segmenting the population (e.g., characterization by age, sex, or race) (e.g. P001-DM)
* [STRING]    `race`
  - An arbitrary classification of a taxonomic group that is a division of a species; the provided values are based on the categories defined by the U.S. Office of Management and Business and used by the U.S. Census Bureau
* [STRING]    `ethnicity`
  - An individual's self-described social and cultural grouping, specifically whether an individual describes themselves as Hispanic or Latino, based on the categories defined by the U.S. Office of Management and Business and used by the U.S. Census Bureau
* [STRING]    `gender`
  - Text designations that identify gender; identification is self-reported and may come from a form, questionnaire, interview, etc.
* [INT64]    `days_to_birth`
  - Number of days between the date used for index and the date from a person's date of birth represented as a calculated negative number of days
* [INT64]    `days_to_death`
  - Number of days between the date used for index and the date from a person's date of death represented as a calculated number of days
* [INT64]    `year_of_birth`
  - Numeric value to represent the calendar year in which an individual was born
* [INT64]    `year_of_death`
  - Numeric value to represent the year of the death of an individual
* [STRING]    `cause_of_death`
  - Text term to identify the cause of death for a patient
* [STRING]    `vital_status`
  - The survival state of the person registered on the protocol
* [STRING]    `diagnosis_id`
  - Unique identifier for data from the investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation (e.g. e8dd475b-693a-11ea-b1fd-0aad30af8a83)
* [STRING]    `diagnosis_submitter_id`
  - Unique identifier deriving from data submitter attributed to data from the investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation (e.g. 33-DX)
* [STRING]    `primary_diagnosis`
  - Text term used to describe the patient's histologic diagnosis, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [INT64]    `age_at_diagnosis`
  - Age at the time of diagnosis expressed in number of days since birth
* [INT64]    `year_of_diagnosis`
  - Numeric value to represent the year of an individual's initial pathologic diagnosis of cancer
* [FLOAT64]    `days_to_last_follow_up`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days
* [FLOAT64]    `days_to_last_known_disease_status`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days
* [FLOAT64]    `days_to_recurrence`
  - Number of days between the date used for index and the date the patient's disease recurred
* [STRING]    `ajcc_clinical_m`
  - Extent of the distant metastasis for the cancer based on evidence obtained from clinical assessment parameters determined prior to treatment
* [STRING]    `ajcc_pathologic_m`
  - Code to represent the defined absence or presence of distant spread or metastases (M) to locations via vascular channels or lymphatics beyond the regional lymph nodes, using criteria established by the American Joint Committee on Cancer (AJCC)
* [STRING]    `ajcc_pathologic_n`
  - The codes that represent the stage of cancer based on the nodes present (N stage) according to criteria based on multiple editions of the AJCC's Cancer Staging Manual
* [STRING]    `ajcc_pathologic_stage`
  - The extent of a cancer, especially whether the disease has spread from the original site to other parts of the body based on AJCC staging criteria
* [STRING]    `ajcc_pathologic_t`
  - Code of pathological T (primary tumor) to define the size or contiguous extension of the primary tumor (T), using staging criteria from the American Joint Committee on Cancer (AJCC)
* [STRING]    `burkitt_lymphoma_clinical_variant`
  - Burkitt's lymphoma categorization based on clinical features that differ from other forms of the same disease
* [STRING]    `classification_of_tumor`
  - Text that describes the kind of disease present in the tumor specimen as related to a specific timepoint
* [STRING]    `last_known_disease_status`
  - Text term that describes the last known state or condition of an individual's neoplasm
* [INT64]    `lymph_nodes_positive`
  - The number of lymph nodes involved with disease as determined by pathologic examination
* [STRING]    `lymphatic_invasion_present`
  - A yes/no indicator to ask if small or thin-walled vessel invasion is present, indicating lymphatic involvement
* [STRING]    `morphology`
  - The third edition of the International Classification of Diseases for Oncology, published in 2000 used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms. The study of the structure of the cells and their arrangement to constitute tissues and, finally, the association among these to form organs. In pathology, the microscopic process of identifying normal and abnormal morphologic characteristics in tissues, by employing various cytochemical and immunocytochemical stains. A system of numbered categories for representation of data
* [STRING]    `prior_malignancy`
  - The yes/no/unknown indicator used to describe the patient's history of prior cancer diagnosis
* [BOOL]    `progression_or_recurrence`
  - Yes/No/Unknown indicator to identify whether a patient has had a new tumor event after initial treatment
* [STRING]    `residual_disease`
  - Text terms to describe the status of a tissue margin following surgical resection
* [STRING]    `site_of_resection_or_biopsy`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `tissue_or_organ_of_origin`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `tumor_grade`
  - Numeric value to express the degree of abnormality of cancer cells, a measure of differentiation and aggressiveness
* [STRING]    `tumor_stage`
  - The extent of a cancer in the body. Staging is usually based on the size of the tumor, whether lymph nodes contain cancer, and whether the cancer has spread from the original site to other parts of the body. The accepted values for tumor_stage depend on the tumor site, type, and accepted staging system. These items should accompany the tumor_stage value as associated metadata

