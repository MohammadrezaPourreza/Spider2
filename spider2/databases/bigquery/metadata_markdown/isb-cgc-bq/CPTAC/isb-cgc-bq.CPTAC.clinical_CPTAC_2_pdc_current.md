# `isb-cgc-bq.CPTAC.clinical_CPTAC_2_pdc_current.md`

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
* [STRING]    `diagnosis_id`
  - Unique identifier for data from the investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation (e.g. e8dd475b-693a-11ea-b1fd-0aad30af8a83)
* [STRING]    `diagnosis_submitter_id`
  - Unique identifier deriving from data submitter attributed to data from the investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation (e.g. 33-DX)
* [STRING]    `primary_diagnosis`
  - Text term used to describe the patient's histologic diagnosis, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [INT64]    `age_at_diagnosis`
  - Age at the time of diagnosis expressed in number of days since birth
* [STRING]    `ajcc_pathologic_stage`
  - The extent of a cancer, especially whether the disease has spread from the original site to other parts of the body based on AJCC staging criteria
* [STRING]    `figo_stage`
  - The extent of a cervical or endometrial cancer within the body, especially whether the disease has spread from the original site to other parts of the body, as described by the International Federation of Gynecology and Obstetrics (FIGO) stages
* [STRING]    `morphology`
  - The third edition of the International Classification of Diseases for Oncology, published in 2000 used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms. The study of the structure of the cells and their arrangement to constitute tissues and, finally, the association among these to form organs. In pathology, the microscopic process of identifying normal and abnormal morphologic characteristics in tissues, by employing various cytochemical and immunocytochemical stains. A system of numbered categories for representation of data
* [BOOL]    `prior_malignancy`
  - The yes/no/unknown indicator used to describe the patient's history of prior cancer diagnosis
* [STRING]    `tissue_or_organ_of_origin`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O)
* [STRING]    `tumor_stage`
  - The extent of a cancer in the body. Staging is usually based on the size of the tumor, whether lymph nodes contain cancer, and whether the cancer has spread from the original site to other parts of the body. The accepted values for tumor_stage depend on the tumor site, type, and accepted staging system. These items should accompany the tumor_stage value as associated metadata

