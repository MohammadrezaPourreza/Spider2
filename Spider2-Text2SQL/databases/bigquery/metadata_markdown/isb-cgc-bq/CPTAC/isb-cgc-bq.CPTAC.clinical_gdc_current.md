# `isb-cgc-bq.CPTAC.clinical_gdc_current.md`

## Column details

* [STRING]    `submitter_id`
  - The submitter_id of a case entity corresponds to the submitted_subject_id of the study participant in dbGaP records for the project.
* [STRING]    `case_id`
  - GDC unique identifier for this case (corresponds to the case_barcode) -- this can be used to access more information from the GDC data portal in the following way: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba9.
* [STRING]    `primary_site`
  - The text term used to describe the primary site of disease, as categorized by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O). This categorization groups cases into general categories. Reference tissue_or_organ_of_origin on the diagnosis node for more specific primary sites of disease.
* [STRING]    `disease_type`
  - The text term used to describe the type of malignant disease, as categorized by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [STRING]    `index_date`
  - The text term used to describe the reference or anchor date used when for date obfuscation, where a single date is obscured by creating one or more date ranges in relation to this date.
* [STRING]    `consent_type`
  - The text term used to describe the type of consent obtain from the subject for participation in the study.
* [INT64]    `days_to_consent`
  - Number of days between the date used for index and the date the subject consent was obtained for participation in the study.
* [BOOL]    `lost_to_followup`
  - The yes/no/unknown indicator used to describe whether a patient was unable to be contacted or seen for follow-up information.
* [INT64]    `days_to_lost_to_followup`
  - If vital_status indicates 'alive', then this is the number of days from the date of diagnosis to the last followup (communication contact).
* [STRING]    `proj__name`
  - Display name for the project to which a case belongs.
* [STRING]    `proj__project_id`
  - GDC-assigned identifier for the project to which a case belongs.
* [STRING]    `demo__demographic_id`
  - GDC-assigned identifier for a case's demographic data.
* [STRING]    `demo__gender`
  - Text designations that identify gender. Gender is described as the assemblage of properties that distinguish people on the basis of their societal roles. [Explanatory Comment 1: Identification of gender is based upon self-report and may come from a form, questionnaire, interview, etc.]
* [STRING]    `demo__race`
  - An arbitrary classification of a taxonomic group that is a division of a species. It usually arises as a consequence of geographical isolation within a species and is characterized by shared heredity, physical attributes and behavior, and in the case of humans, by common history, nationality, or geographic distribution. The provided values are based on the categories defined by the U.S. Office of Management and Business and used by the U.S. Census Bureau.
* [STRING]    `demo__ethnicity`
  - An individual's self-described social and cultural grouping, specifically whether an individual describes themselves as Hispanic or Latino. The provided values are based on the categories defined by the U.S. Office of Management and Business and used by the U.S. Census Bureau.
* [STRING]    `demo__vital_status`
  - The survival state of the person registered on the protocol.
* [INT64]    `demo__days_to_birth`
  - Number of days between the date used for index and the date from a person's date of birth represented as a calculated negative number of days.
* [INT64]    `demo__year_of_birth`
  - Numeric value to represent the calendar year in which an individual was born.
* [INT64]    `demo__age_at_index`
  - The patient's age (in years) on the reference or anchor date date used during date obfuscation.
* [INT64]    `demo__year_of_death`
  - Numeric value to represent the year of the death of an individual.
* [INT64]    `demo__days_to_death`
  - Number of days between the date used for index and the date from a person's date of death represented as a calculated number of days.
* [STRING]    `demo__cause_of_death`
  - Text term to identify the cause of death for a patient.
* [STRING]    `demo__state`
  - The current state of the object.
* [TIMESTAMP]    `demo__created_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [TIMESTAMP]    `demo__updated_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [STRING]    `exp__exposure_id`
  - GDC-assigned identifier for a case's exposure data.
* [STRING]    `exp__type_of_tobacco_used`
  - The text term used to describe the specific type of tobacco used by the patient.
* [STRING]    `exp__tobacco_smoking_status`
  - Category describing current smoking status and smoking history as self-reported by a patient.
* [INT64]    `exp__tobacco_smoking_onset_year`
  - The year in which the participant began smoking.
* [INT64]    `exp__tobacco_smoking_quit_year`
  - The year in which the participant quit smoking.
* [INT64]    `exp__years_smoked`
  - Numeric value (or unknown) to represent the number of years a person has been smoking.
* [FLOAT64]    `exp__pack_years_smoked`
  - Numeric computed value to represent lifetime tobacco exposure defined as number of cigarettes smoked per day x number of years smoked divided by 20.
* [FLOAT64]    `exp__cigarettes_per_day`
  - The average number of cigarettes smoked per day.
* [BOOL]    `exp__secondhand_smoke_as_child`
  - The text term used to indicate whether the patient was exposed to secondhand smoke as a child.
* [STRING]    `exp__exposure_type`
  - The text term used to describe the type of environmental exposure.
* [INT64]    `exp__exposure_duration_years`
  - The period of time from start to finish of exposure, in years.
* [STRING]    `exp__type_of_smoke_exposure`
  - The text term used to describe the patient's specific type of smoke exposure.
* [BOOL]    `exp__alcohol_history`
  - A response to a question that asks whether the participant has consumed at least 12 drinks of any kind of alcoholic beverage in their lifetime.
* [STRING]    `exp__alcohol_intensity`
  - Category to describe the patient's current level of alcohol use as self-reported by the patient.
* [STRING]    `exp__state`
  - The current state of the object.
* [TIMESTAMP]    `exp__created_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [TIMESTAMP]    `exp__updated_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [STRING]    `diag__diagnosis_id`
  - GDC-assigned identifier for a case's diagnosis.
* [STRING]    `diag__ajcc_clinical_m`
  - Extent of the distant metastasis for the cancer based on evidence obtained from clinical assessment parameters determined prior to treatment.
* [STRING]    `diag__primary_diagnosis`
  - Text term used to describe the patient's histologic diagnosis, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [INT64]    `diag__days_to_last_known_disease_status`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days.
* [INT64]    `diag__year_of_diagnosis`
  - Numeric value to represent the year of an individual's initial pathologic diagnosis of cancer.
* [STRING]    `diag__figo_stage`
  - The extent of a cervical or endometrial cancer within the body, especially whether the disease has spread from the original site to other parts of the body, as described by the International Federation of Gynecology and Obstetrics (FIGO) stages.
* [BOOL]    `diag__progression_or_recurrence`
  - Yes/No/Unknown indicator to identify whether a patient has had a new tumor event after initial treatment.
* [STRING]    `diag__ajcc_pathologic_m`
  - Code to represent the defined absence or presence of distant spread or metastases (M) to locations via vascular channels or lymphatics beyond the regional lymph nodes, using criteria established by the American Joint Committee on Cancer (AJCC).
* [INT64]    `diag__days_to_recurrence`
  - Number of days between the date used for index and the date the patient's disease recurred.
* [STRING]    `diag__site_of_resection_or_biopsy`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [STRING]    `diag__ajcc_staging_system_edition`
  - The text term used to describe the version or edition of the American Joint Committee on Cancer Staging Handbooks, a publication by the group formed for the purpose of developing a system of staging for cancer that is acceptable to the American medical profession and is compatible with other accepted classifications.
* [INT64]    `diag__age_at_diagnosis`
  - Age at the time of diagnosis expressed in number of days since birth.
* [INT64]    `diag__days_to_last_follow_up`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days.
* [STRING]    `diag__ajcc_pathologic_stage`
  - The extent of a cancer, especially whether the disease has spread from the original site to other parts of the body based on AJCC staging criteria.
* [STRING]    `diag__tumor_grade`
  - Numeric value to express the degree of abnormality of cancer cells, a measure of differentiation and aggressiveness.
* [STRING]    `diag__last_known_disease_status`
  - Text term that describes the last known state or condition of an individual's neoplasm.
* [STRING]    `diag__residual_disease`
  - Text terms to describe the status of a tissue margin following surgical resection.
* [STRING]    `diag__morphology`
  - The third edition of the International Classification of Diseases for Oncology, published in 2000 used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms. The study of the structure of the cells and their arrangement to constitute tissues and, finally, the association among these to form organs. In pathology, the microscopic process of identifying normal and abnormal morphologic characteristics in tissues, by employing various cytochemical and immunocytochemical stains. A system of numbered categories for representation of data.
* [STRING]    `diag__ajcc_pathologic_t`
  - Code of pathological T (primary tumor) to define the size or contiguous extension of the primary tumor (T), using staging criteria from the American Joint Committee on Cancer (AJCC).
* [STRING]    `diag__classification_of_tumor`
  - Text that describes the kind of disease present in the tumor specimen as related to a specific timepoint.
* [STRING]    `diag__tumor_focality`
  - The text term used to describe whether the patient's disease originated in a single location or multiple locations.
* [STRING]    `diag__ajcc_pathologic_n`
  - The codes that represent the stage of cancer based on the nodes present (N stage) according to criteria based on multiple editions of the AJCC's Cancer Staging Manual.
* [STRING]    `diag__tissue_or_organ_of_origin`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [BOOL]    `diag__prior_malignancy`
  - The yes/no/unknown indicator used to describe the patient's history of prior cancer diagnosis.
* [STRING]    `diag__state`
  - The current state of the object.
* [TIMESTAMP]    `diag__created_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [TIMESTAMP]    `diag__updated_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [STRING]    `follow__follow_up_id`
  - GDC-assigned identifier for a case's follow up data.
* [INT64]    `follow__days_to_follow_up`
  - Number of days between the date used for index and the date of the patient's last follow-up appointment or contact.
* [FLOAT64]    `follow__height`
  - The height of the patient in centimeters.
* [FLOAT64]    `follow__weight`
  - The weight of the patient measured in kilograms.
* [FLOAT64]    `follow__bmi`
  - A calculated numerical quantity that represents an individual's weight to height ratio.
* [STRING]    `follow__comorbidity`
  - The text term used to describe a comorbidity disease, which coexists with the patient's malignant disease.
* [STRING]    `follow__hormonal_contraceptive_use`
  - The text term used to indicate whether the patient used hormonal contraceptives.
* [INT64]    `follow__dlco_ref_predictive_percent`
  - The value, as a percentage of predicted lung volume, measuring the amount of carbon monoxide detected in a patient's lungs.
* [INT64]    `follow__fev1_fvc_pre_bronch_percent`
  - Percentage value to represent result of Forced Expiratory Volume in 1 second (FEV1) divided by the Forced Vital Capacity (FVC) pre-bronchodilator.
* [INT64]    `follow__fev1_ref_pre_bronch_percent`
  - The percentage comparison to a normal value reference range of the volume of air that a patient can forcibly exhale from the lungs in one second pre-bronchodilator.
* [STRING]    `follow__diabetes_treatment_type`
  - Text term used to describe the types of treatment used to manage diabetes.
* [STRING]    `follow__aids_risk_factors`
  - The text term used to describe a risk factor of the acquired immunodeficiency syndrome (AIDS) that the patient either had at time time of the study or experienced in the past.
* [INT64]    `follow__karnofsky_performance_status`
  - Text term used to describe the classification used of the functional capabilities of a person.
* [STRING]    `follow__disease_response`
  - Code assigned to describe the patient's response or outcome to the disease.
* [INT64]    `follow__fev1_ref_post_bronch_percent`
  - The percentage comparison to a normal value reference range of the volume of air that a patient can forcibly exhale from the lungs in one second post-bronchodilator.
* [STRING]    `follow__cdc_hiv_risk_factors`
  - The text term used to describe a risk factor for human immunodeficiency virus, as described by the Center for Disease Control.
* [INT64]    `follow__fev1_fvc_post_bronch_percent`
  - Percentage value to represent result of Forced Expiratory Volume in 1 second (FEV1) divided by the Forced Vital Capacity (FVC) post-bronchodilator.
* [INT64]    `follow__hpv_positive_type`
  - Text classification to represent the strain or type of human papillomavirus identified in an individual.
* [INT64]    `follow__ecog_performance_status`
  - The ECOG functional performance status of the patient/participant.
* [BOOL]    `follow__progression_or_recurrence`
  - Yes/No/Unknown indicator to identify whether a patient has had a new tumor event after initial treatment.
* [INT64]    `follow__pancreatitis_onset_year`
  - Numeric value to represent the year that the patient was diagnosed with clinical chronic pancreatitis.
* [INT64]    `follow__days_to_recurrence`
  - Number of days between the date used for index and the date the patient's disease recurred.
* [STRING]    `follow__state`
  - The current state of the object.
* [TIMESTAMP]    `follow__created_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [TIMESTAMP]    `follow__updated_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [STRING]    `diag__path__pathology_detail_id`
  - GDC-assigned identifier for a case's pathology details data.
* [INT64]    `diag__path__lymph_nodes_positive`
  - The number of lymph nodes involved with disease as determined by pathologic examination. (CDE ID - 89)
* [FLOAT64]    `diag__path__tumor_largest_dimension_diameter`
  - Numeric value used to describe the maximum diameter or dimension of the primary tumor measured in centimeters.
* [STRING]    `diag__path__state`
  - The current state of the object.
* [TIMESTAMP]    `diag__path__created_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [TIMESTAMP]    `diag__path__updated_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [STRING]    `follow__mol_test__molecular_test_id`
  - GDC-assigned identifier for case follow up's molecular test data.
* [STRING]    `follow__mol_test__laboratory_test`
  - The text term used to describe the medical testing used to diagnose, treat or further understand a patient's disease.
* [STRING]    `follow__mol_test__test_result`
  - The text term used to describe the result of the molecular test. If the test result was a numeric value see test_value.
* [STRING]    `follow__mol_test__gene_symbol`
  - The text term used to describe a gene targeted or included in molecular analysis. For rearrangements, this is shold be used to represent the reference gene.
* [STRING]    `follow__mol_test__state`
  - The current state of the object.
* [TIMESTAMP]    `follow__mol_test__created_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [TIMESTAMP]    `follow__mol_test__updated_datetime`
  - A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]
* [STRING]    `state`
  - The current state of the object.
* [TIMESTAMP]    `created_datetime`
  - Timestamp of initial upload of data in GDC; formatted as a combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm].
* [TIMESTAMP]    `updated_datetime`
  - Timestamp of last update in GDC; formatted as a combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm].

