# `pancancer-atlas.Filtered.clinical_PANCAN_patient_with_followup_filtered.md`

## Column details

* [STRING]    `bcr_patient_uuid`
  - Patient universally unique identifier, eg 180A2B9C-9CAC-4D96-86E8-CD6B3B9386B5
* [STRING]    `bcr_patient_barcode`
  - TCGA barcode identifier for the study participant, eg TCGA-02-0001
* [STRING]    `acronym`
  - TCGA study abbreviation, eg LAML. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tcga-study-abbreviations
* [STRING]    `gender`
  - Participant gender; eg. MALE, FEMALE
* [STRING]    `vital_status`
  - The latest updated vital status from follow-up data, eg Alive, Dead, [Discrepancy], NULL
* [FLOAT64]    `days_to_birth`
  - Days since birth (a negative value, relative to the date of diagnosis which is considered to be t=0)
* [STRING]    `days_to_death`
  - If vital_status indicates 'dead', then this is the number of days to death (a positive value) relative to the date of diagnosis.
* [STRING]    `days_to_last_followup`
  - If vital_status indicates 'alive', then this is the number of days from the date of diagnosis to the last followup (communication contact).
* [INT64]    `days_to_initial_pathologic_diagnosis`
  - The number of days to initial pathologic diagnosis
* [INT64]    `age_at_initial_pathologic_diagnosis`
  - Age, in years, at which a condition or disease was first diagnosed
* [STRING]    `icd_10`
  - Alphanumeric value used to describe the disease code from the tenth version of the International Classification of Disease (ICD-10). Examples: C01, C55, C40.3
* [STRING]    `tissue_retrospective_collection_indicator`
  - Text indicator for the time frame of tissue procurement, indicating that the tissue was obtained and stored prior to the initiation of the project. Takes YES, NO, NULL, and [Discrepancy] values.
* [STRING]    `icd_o_3_histology`
  - Code that represents the histology of the disease using the third edition of the International Classification of Diseases for Oncology, published in 2000, used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms
* [STRING]    `tissue_prospective_collection_indicator`
  - Text indicator for the time frame of tissue procurement, indicating that the tissue was procured in parallel to the project. Takes YES, NO, NULL, and [Discrepancy] values.
* [STRING]    `history_of_neoadjuvant_treatment`
  - Possible values: Yes, No,Yes - Pharmaceutical Treatmet Prior to Resection, Yes - Radiation Prior to Resection(also can be blank)
* [STRING]    `icd_o_3_site`
  - Code that represents the site of the disease using the third edition of the International Classification of Diseases for Oncology, published in 2000, used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms. Examples:C01.9, C20.9, C32.1
* [STRING]    `tumor_tissue_site`
  - Category describing current smoking status and smoking history as self-reported by a participant.; eg. 1, 2, etc.
* [STRING]    `new_tumor_event_after_initial_treatment`
  - Indicates whether a patient has had a new tumor event after initial treatment; Yes, No
* [STRING]    `radiation_therapy`
  - Indicates whether a patient has had radiation therapy; YES, NO, NULL, [Unknown], and [Discrepancy]
* [STRING]    `race`
  - The race of a participant, independent from ethnicity; eg. White, Black or African American, Asian, Native Hawaiian or other Pacific Islander, American Indian or Alaska Native
* [STRING]    `project_code`
  - Project code; TCGA or NULL
* [STRING]    `prior_dx`
  - Indicator and type of prior diagnosis; eg. No; Yes, History of Prior Malignancy; Yes, History of Synchronous/Bilateral Malignancy; Both History of Synchronous/Bilateral and Prior Malignancy, [Discrepancy], and NULL
* [STRING]    `disease_code`
  - A code representing the type of cancer. Values can be found at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tcga-study-abbreviations; eg. OV, GBM, LUAD
* [STRING]    `ethnicity`
  - The ethnic origination of a participant, independent from race; eg. Not Hispanic or Latino, Hispanic or Latino
* [STRING]    `informed_consent_verified`
  - Indicates whether informed consent is verified; YES
* [STRING]    `person_neoplasm_cancer_status`
  - The participant's cancer status; Either WITH TUMOR or TUMOR FREE, [Unknown], [Discrepancy], and NULL
* [STRING]    `patient_id`
  - Participant ID; eg. AA2W, AA2T
* [INT64]    `year_of_initial_pathologic_diagnosis`
  - Four digit year of the initial pathologic diagnosis
* [STRING]    `histological_type`
  - The histological type of cancer; eg. Adenosquamous, Astrocytoma, etc.
* [STRING]    `tissue_source_site`
  - Tissue Source Site Codes; eg. FF, 4G. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tissue-source-site-codes
* [STRING]    `form_completion_date`
  - Form completion date; eg. 2013-12-23
* [STRING]    `pathologic_T`
  - The pathologic T score is a rating of the extent of the primary tumor, based on surgery or biopsy; eg. T1, T2, T3, T4
* [STRING]    `pathologic_M`
  - The pathologic M score is a rating of metastasis, that is, how much cancer has spread to distant sites. It is based on surgery or biopsy; eg. MX, M0, M1
* [STRING]    `clinical_M`
  - The clinical M score is a rating of metastasis, that is, how much cancer has spread to distant sites. It is based on results of tests done before surgery, such as physical exams and imaging scans; eg. MX, M0, M1
* [STRING]    `pathologic_N`
  - The pathologic N score is a rating of the extent of cancer within nearby lymph nodes, based on surgery or biopsy; eg. N1, N2, N3
* [STRING]    `system_version`
  - System version; eg. 2009, 4th
* [STRING]    `pathologic_stage`
  - The stage of the cancer, based on surgery or biopsy; eg. Stage II, Stage III, Stage IV, Stage IVA, Stage IIIB, Stage IIIS, Stage IIIC
* [STRING]    `stage_other`
  - Other stages of cancer; this field is NULL for all rows
* [STRING]    `clinical_stage`
  - The stage of the cancer, based on results of tests done before surgery, such as physical exams and imaging scans; eg. Stage I, Stage II, Stage III, Stage IV
* [STRING]    `clinical_T`
  - The clinical T score is a rating of the extent of the primary tumor, based on results of tests done before surgery, such as physical exams and imaging scans; eg. T1, T2, T3, T4
* [STRING]    `clinical_N`
  - The clinical N score is a rating of the extent of cancer within nearby lymph nodes, based on results of tests done before surgery, such as physical exams and imaging scans; eg. N1, N2, N3
* [STRING]    `extranodal_involvement`
  - Indicator that identifies whether a patient with malignant lymphoma has lymphomatous involvement of an extranodal site. YES, NO, [Not Applicable], and NULL
* [STRING]    `postoperative_rx_tx`
  - YES, NO, [Discrepancy], and [Unknown] indicator of post operative residual tumor
* [STRING]    `primary_therapy_outcome_success`
  - Kind of outcome achieved after the completion of the initial course of treatment; eg. Complete Remission/Response, Progressive Disease, Stable Disease, Partial Remission/Response, Persistent Diseaase, etc.
* [STRING]    `lymph_node_examined_count`
  - The number of lymph nodes examined. Some records contains [Not Applicable].
* [STRING]    `primary_lymph_node_presentation_assessment`
  - YES, NO, [Discrepancy], and [Unknown] indicator of primary lymph node presentation assessment
* [STRING]    `initial_pathologic_diagnosis_method`
  - Text that describe the initial pathologic diagnosis method, eg. Tumor resection, Excisional Biopsy, Dilation and curettage procedure, etc
* [STRING]    `number_of_lymphnodes_positive_by_he`
  - The number of lymph nodes involved with disease as determined by histological examination
* [STRING]    `eastern_cancer_oncology_group`
  - Eastern cancer oncology group performance status. Integer number between 0 and 5.
* [STRING]    `anatomic_neoplasm_subdivision`
  - The spatial location, subdivisions and/or atomic site name of a tumor; eg. Rectum, Larynx, Tonsil, etc.
* [STRING]    `residual_tumor`
  - Status of the tissue margin following surgical resection; eg. R0, R1, R2, RX
* [STRING]    `histological_type_other`
  - Additional histological types of cancer; eg. Diffuse sclerosing variant, Ductal/Cribiform, etc.
* [STRING]    `init_pathology_dx_method_other`
  - Additional initial pathologic diagnosis methods, eg. Biopsy and endocervical curettage, Cervical biopsies and cystoscopy, etc.
* [STRING]    `karnofsky_performance_score`
  - Karnofsky performance score. Describe the classification used of the functional capabilities of a person, values can be 0, 10, 20, ... , 100, [Not Evaluated], or [Unknown].
* [STRING]    `neoplasm_histologic_grade`
  - Rating which expresses the degree of abnormality of cancer cells, a measure of differentiation and aggressiveness; eg. G1, G2, G3, G4, GX, High Grage, GB, Low Grade
* [STRING]    `height`
  - Height of participant in centimeters
* [STRING]    `weight`
  - Weight of participant in kilograms
* [STRING]    `history_of_radiation_metastatic_site`
  - History of radiation metastatic site
* [STRING]    `days_to_patient_progression_free`
  - Number of days between the date used for index and the date the patient's disease was formally confirmed as progression-free. Null for all participants.
* [STRING]    `days_to_first_response`
  - Number of days between the date used for index and the date of the patient first response to their disease. Null for all participants.
* [STRING]    `days_to_first_partial_response`
  - Number of days between the date used for index and the date the patient's disease was first confirmed as partial response. Null for all participants.
* [STRING]    `days_to_first_complete_response`
  - Number of days between the date used for index and the date the patient's disease was first confirmed as compete response. Null for all participants.
* [STRING]    `days_to_tumor_progression`
  - Number of days between the date used for index and the date the patient's disease progressed. Null for all participants.
* [STRING]    `er_estimated_duration_response`
  - Estimated duration response for ER positive tumors. Null for all participants.
* [STRING]    `er_disease_extent_prior_er_treatment`
  - Disease extent prior to ER treatment. Null for all participants.
* [STRING]    `er_solid_tumor_response_documented_type`
  - Solid tumor response type for ER positive tumors. Null for all participants.
* [STRING]    `er_solid_tumor_response_documented_type_other`
  - Additional solid tumor response types for ER positive tumors. Null for all participants.
* [STRING]    `er_response_type`
  - Response type for ER positive tumors. Null for all participants.
* [STRING]    `history_of_radiation_primary_site`
  - History of radiation in the primary site. Null for all participants.
* [STRING]    `history_prior_surgery_type`
  - History prior surgery type. Null for all participants.
* [STRING]    `patient_progression_status`
  - Patient progression status. Null for all participants.
* [STRING]    `history_prior_surgery_type_other`
  - Additional history prior surgery types. Null for all participants.
* [STRING]    `history_prior_surgery_indicator`
  - Indicator of history prior surgery. Null for all participants.
* [STRING]    `field`
  - Field. Null for all participants.
* [STRING]    `molecular_abnormality_results_other`
  - Additional molecular abnormality results. Null for all participants.
* [STRING]    `molecular_abnormality_results`
  - Molecular abnormality results. Null for all participants.
* [STRING]    `number_of_lymphnodes_positive_by_ihc`
  - Number of lymph nodes-positive determined by immunohistochemistry
* [STRING]    `tobacco_smoking_history`
  - Description of tobacco skmoking history, eg. Lifelong Non-smoker, Current Reformed Smoker, Duration Not Specified, etc.
* [STRING]    `number_pack_years_smoked`
  - A measurement of the amount of smoking exposure an individual has had over time, which is calculated by multiplying the number of cigarettes smoked per day by the number of years smoked, and dividing the product by the number of cigarettes in a pack.
* [STRING]    `stopped_smoking_year`
  - Four digit stopped smoking year
* [STRING]    `performance_status_scale_timing`
  - Performance status. Takes values of Post-Adjuvant Therapy, Pre-Adjuvant Therapy, Pre-Operative, Preoperative, Post Adjuvant Therapy, Post Secondary Therapy, or Other
* [STRING]    `laterality`
  - Text term that represents the side of the body on which the tumor or cancer developed.
* [STRING]    `targeted_molecular_therapy`
  - The yes/no indicator related to prior administration of cancer therapies designed to act upon specific molecules in metabolic pathways or processes involved in carcinogenesis, tumor growth, or tumor spread. NCI CDE: 3440083
* [STRING]    `year_of_tobacco_smoking_onset`
  - The year in which the participant began smoking.
* [STRING]    `anatomic_neoplasm_subdivision_other`
  - Additional spatial location, subdivisions and/or atomic site name of a tumor.
* [STRING]    `patient_death_reason`
  - the primary cause of death. NCI CDE: 25
* [STRING]    `tumor_tissue_site_other`
  - Text term that describes another anatomic site location not previously mentioned for the peritumoral tissue. NCI CDE: 5118531
* [STRING]    `menopause_status`
  - The response that describes the menopausal status of a patient (a condition or state relating to the permanent cessation of menses).
* [STRING]    `age_began_smoking_in_years`
  - Age began smoking cigarettes expressed in number of years since birth. NCI CDE: 2178045
* [STRING]    `margin_status`
  - The indication of whether there has been cancer involvement in the surgical margin after tissue removal. NCI CDE: 7038796
* [STRING]    `kras_gene_analysis_performed`
  - Indicator of whether or not analysis for KRAS gene mutation abnormality was performed. NCI CDE: 6060079
* [STRING]    `kras_mutation_found`
  - kras mutation present
* [STRING]    `death_cause_text`
  - The text that describes the cause of death. NCI CDE: 2179658
* [STRING]    `lactate_dehydrogenase_result`
  - Text term to represent the summary result of the medical procedure that involves testing a sample of blood for lactate dehydrogenase (LDH), to help determine a diagnosis, plan treatment, check to see if treatment is working, or monitor the disease over time. NCI CDE: 3113468
* [STRING]    `days_to_sample_procurement`
  - Days to sample procurement.
* [STRING]    `hbv_test`
  - Hepatitis B virus (HBV) test
* [STRING]    `on_haart_therapy_at_cancer_diagnosis`
  - Text term to signify the administration of highly active antiretroviral therapy (HAART) at the time of cancer diagnosis NCI CDE: 2922679
* [STRING]    `hcv_test`
  - The indicator that describes whether or not HCV was performed
* [STRING]    `prior_aids_conditions`
  - Prior AIDS condition.
* [STRING]    `on_haart_therapy_prior_to_cancer_diagnosis`
  - Text term to signify the administration of highly active antiretroviral therapy (HAART) before or prior to the time of cancer diagnosis. NCI CDE: 3335156
* [STRING]    `kshv_hhv8_test`
  - Text indicator to respresent whether a serological herpes human virus 8 (HHV8) test was completed for an individual. NCI CDE: 3335774
* [STRING]    `days_to_hiv_diagnosis`
  - Time interval from the date of the initial pathologic diagnosis to the date of human immunodeficiency diagnosis, represented as a calculated number of days. NCI CDE: 4618491
* [STRING]    `hiv_status`
  - the result of a test to detect the presence of human immunodeficiency virus antibody in a patient. NCI CDE: 2180464
* [STRING]    `hiv_rna_load_at_diagnosis`
  - Number to represent the numeric value for a human immunodeficiency virus viral load (the number of HIV viral particles in a sample of blood plasma) assay performed on an individual at the time of diagnosis. NCI CDE: 2922674
* [STRING]    `cdc_hiv_risk_group`
  - The patient risk group category for the Human Immunodeficiency Virus (HIV). NCI CDE: 2542215
* [STRING]    `history_of_other_malignancy`
  - Clinical history of other malignancy.
* [STRING]    `history_immunosuppresive_dx`
  - Clinical history of immunosuppresive diagnosis.
* [STRING]    `nadir_cd4_counts`
  - A patient's nadir cd4 count.
* [STRING]    `history_relevant_infectious_dx_other`
  - History of other relevant infectious diagnosis
* [STRING]    `history_relevant_infectious_dx`
  - History of relevant infectious diagnosis
* [STRING]    `cd4_counts_at_diagnosis`
  - Cd4 counts at diagnosis
* [STRING]    `history_immunological_disease_other`
  - History of other immunological disease.
* [STRING]    `hpv_test`
  - The name of the procedure performed to describe the papillomavirus strain being tested. NCI CDE: 6028407
* [STRING]    `history_immunosuppressive_dx_other`
  - Clinical history of other immunosuppresive diagnosis.
* [STRING]    `history_immunological_disease`
  - History of immunological disease.
* [STRING]    `lost_follow_up`
  - The yes/no/unknown indicator used to describe whether a patient was unable to be contacted or seen for follow-up information. NCI CDE: 6161018
* [STRING]    `venous_invasion`
  - The indication of whether or not there has been extramural invasion of the veins by malignant cells. NCI CDE: 7038780
* [STRING]    `lymphatic_invasion`
  - The indication of whether or not malignant cells are present within lymphatic vessels. NCI CDE: 7038779
* [STRING]    `perineural_invasion_present`
  - The indication of whether or not there is a presence of malignant cells surrounding a nerve. NCI CDE: 7038781
* [STRING]    `her2_erbb_method_calculation_method_text`
  - Text to describe the method used to calculate HER2/ERBB2 positivity in a specimen or sample. NCI CDE: 3087487
* [STRING]    `her2_immunohistochemistry_level_result`
  - The gene that controls cell growth by making the human epidermal growth factor receptor 2, detected by immunohistochemical means and expressed as 0 through 4+. NCI CDE: 2178402
* [STRING]    `breast_carcinoma_immunohistochemistry_pos_cell_score`
  - The score assigned to a breast carcinoma sample on the basis of immunohistochemistry analysis. NCI CDE: 3133874
* [STRING]    `distant_metastasis_present_ind2`
  - The yes/no indicator whether distant metastases are present.
* [STRING]    `her2_erbb_pos_finding_fluorescence_in_situ_hybridization_calculation_method_text`
  - Text to describe the method used to calculate HER2/ERBB2 Fluorescence in situ Hybridization (FISH) positivity in a specimen or sample. NCI CDE: 3087929
* [STRING]    `breast_carcinoma_immunohistochemistry_progesterone_receptor_pos_finding_scale`
  - Text term to specify the immunohistochemistry intensity scale used for a positive finding for progesterone receptor in breast cancer tumor. NCI CDE: 3203083
* [STRING]    `breast_carcinoma_primary_surgical_procedure_name`
  - Text name of a surgical procedure performed for a person with a diagnosis of breast cancer. [Manually-curated]
* [STRING]    `er_level_cell_percentage_category`
  - Classification to represent ER Positive results expressed as a percentage value. NCI CDE: 3128341
* [STRING]    `breast_carcinoma_progesterone_receptor_status`
  - The progesterone receptor status of a primary breast tumor or metastases. NCI CDE: 6117728
* [STRING]    `breast_carcinoma_surgical_procedure_name`
  - Text name of a surgical procedure performed for a person with a diagnosis of breast cancer. [Manually-curated] NCI CDE: 2739580
* [STRING]    `breast_neoplasm_other_surgical_procedure_descriptive_text`
  - Text to describe a surgical procedure performed for a malignant neoplasm of the breast that is different from previously identified options. NCI CDE: 3124493
* [STRING]    `er_detection_method_text`
  - The free-text field to capture the method of measurement used to detect the status of the estrogen receptor. e.g., dextran coated charcoal. NCI CDE: 69
* [STRING]    `pos_finding_progesterone_receptor_other_measurement_scale_text`
  - Text to describe a different scale used to measure progesterone receptor (PR) positivity. NCI CDE: 3086857
* [STRING]    `her2_erbb_pos_finding_cell_percent_category`
  - Classification to represent the number of positive HER2/ERBB2 cells in a specimen or sample. NCI CDE: 3086980
* [STRING]    `her2_and_centromere_17_positive_finding_other_measurement_scale_text`
  - Text to describe a different scale used to measure HER2 and Centromere 17 positivity. NCI CDE: 3087923
* [STRING]    `pos_finding_metastatic_breast_carcinoma_estrogen_receptor_other_measuremenet_scale_text`
  - Text to describe a different scale used to measure metastatic breast carcinoma estrogen receptor (ER) positivity. NCI CDE: 3131877
* [STRING]    `metastatic_breast_carcinoma_progesterone_receptor_level_cell_percent_category`
  - Classification to represent metastatic breast carcinoma Progesterone Receptor (PR) positive results expressed as a percentage value. NCI CDE: 3131891
* [STRING]    `metastatic_breast_carcinoma_pos_finding_progesterone_receptor_other_measure_scale_text`
  - Text to describe a different scale used to measure progesterone receptor (PR) positivity. NCI CDE: 3131992
* [STRING]    `fluorescence_in_situ_hybridization_diagnostic_procedure_chromosome_17_signal_result_range`
  - Result of Chromosone 17 testing, expressed as a range of values. NCI CDE: 3104295
* [STRING]    `first_recurrent_non_nodal_metastatic_anatomic_site_descriptive_text`
  - Text to describe the first non-nodal site of metastatic disease that is different from previously identified choices. NCI CDE: 3124503
* [STRING]    `first_nonlymph_node_metastasis_anatomic_site`
  - Text term to identify the first anatomic site of non-nodal metastatic disease. NCI CDE: 3124499
* [STRING]    `immunohistochemistry_positive_cell_score`
  - The score assigned to a sample on the basis of immunohistochemistry analysis. NCI CDE: 2230166
* [STRING]    `axillary_lymph_node_stage_method_type`
  - The type of technique of staging (assessing the extent of a cancer within the body) of axillary lymph nodes from the area of the armpit. NCI CDE: 2516112
* [STRING]    `axillary_lymph_node_stage_other_method_descriptive_text`
  - Text to describe a technique of staging (assessing the extent of a cancer within the body) from the area of the armpit/axilla that is different from the options previously identified. NCI CDE: 3124496
* [STRING]    `metastatic_breast_carcinoma_progesterone_receptor_status`
  - Text term to represent the overall result of metastatic breast carcinoma Progresterone Receptor (PR) testing. NCI CDE: 3131884
* [STRING]    `metastatic_breast_carcinoma_immunohistochemistry_pr_pos_cell_score`
  - The score assigned to a progesterone receptor positive metastatic breast carcinoma sample on the basis of immunohistochemistry analysis. NCI CDE: 3131988
* [STRING]    `metastatic_breast_carcinoma_immunohistochemistry_er_pos_cell_score`
  - The score assigned to a metastatic breast carcinoma sample on the basis of immunohistochemistry analysis.
* [STRING]    `metastatic_breast_carcinoma_lab_proc_her2_neu_immunohistochemistry_receptor_status`
  - Text term to capture the result of medical procedure testing of a sample of metastatic breast carcinoma blood or tissue for HER2 by histochemical localization of immunoreactive substances using labeled antibodies as reagents. NCI CDE: 3131997
* [STRING]    `metastatic_breast_carcinoma_her2_neu_chromosone_17_signal_ratio_value`
  - A numeric value to represesent the measurement of Her2-/neu to chromosone 17 signal in a specimen or sample of metastatic breast carcinoma. NCI CDE: 3132903
* [STRING]    `surgical_procedure_purpose_other_text`
  - Text to capture the reason for a surgical procedure that is different from the purposes previously specified or mentioned. NCI CDE: 2467630
* [STRING]    `metastatic_breast_carcinoma_her2_erbb_pos_finding_fluorescence_in_situ_hybridization_calculation_method_text`
  - Text to describe the method used to calculate HER2/ERBB2 Fluorescence in situ Hybridization (FISH) positivity in a specimen or sample of metastatic breast carcinoma. NCI CDE: 3132910
* [STRING]    `metastatic_breast_carcinoma_her2_erbb_pos_finding_cell_percent_category`
  - Classification to represent the number of positive HER2/ERBB2 cells in a specimen or sample of metastatic breast carcinoma. NCI CDE: 3132322
* [STRING]    `breast_cancer_surgery_margin_status`
  - Text term to describe the pathologic findings of a patient's margins following a breast carcinoma surgical procedure. NCI CDE: 4792338
* [STRING]    `metastatic_breast_carcinoma_her2_erbb_method_calculation_method_text`
  - Text to describe the method used to calculate HER2/ERBB2 positivity in a specimen or sample of metastatic breast carcinoma tissue. NCI CDE: 3132452
* [STRING]    `breast_carcinoma_estrogen_receptor_status`
  - Text term to represent the overall result of Estrogen Receptor (ER) testing. NCI CDE: 2957359
* [STRING]    `her2_neu_and_centromere_17_copy_number_analysis_input_total_number_count`
  - Numeric value to represent the total number of Cells Counted for HER2 & Centromere 17 copy number. NCI CDE: 3087902
* [STRING]    `pgr_detection_method_text`
  - The free-text field to specify the method of measurement used to detect the status of the progesterone receptor (e.g., dextran coated charcoal). NCI CDE: 785
* [STRING]    `pos_finding_her2_erbb2_other_measurement_scale_text`
  - Text to describe a different scale used to measure HER2/ERBB2 positivity. NCI CDE: 3087479
* [STRING]    `breast_carcinoma_immunohistochemistry_er_pos_finding_scale`
  - Text term to specify the immunohistochemistry intensity scale used for a positive finding for estrogen receptor in breast cancer tumor. NCI CDE: 3203081
* [STRING]    `positive_finding_estrogen_receptor_other_measurement_scale_text`
  - Text to describe a different scale used to measure estrogen receptor (ER) positivity. NCI CDE: 3086851
* [STRING]    `metastatic_breast_carcinoma_erbb2_immunohistochemistry_level_result`
  - Result to signify the human epidermal growth factor receptor 2 intensity in a sample of metastatic breast carcinoma, detected by immunohistochemical means and expressed as 0 through 4+. NCI CDE: 3132444
* [STRING]    `metastatic_breast_carcinoma_pos_finding_other_scale_measurement_text`
  - Text to describe a different scale used to measure HER2 and Centromere 17 positivity in a sample or specimen of metastatic breast carcinoma tissue. NCI CDE: 3132907
* [STRING]    `her2_neu_chromosone_17_signal_ratio_value`
  - A numeric value to represent the measurement of Her2-/neu to chromosome 17 signal in a biospecimen. NCI CDE: 2497552
* [STRING]    `cytokeratin_immunohistochemistry_staining_method_micrometastasis_indicator`
  - Text term to identify whether keratin staining techniques were used to visualize the presence of micrometastasis in a tumor specimen. NCI CDE: 3086152
* [STRING]    `metastatic_breast_carcinoma_estrogen_receptor_detection_method_text`
  - The free-text field to capture the method of measurement used to detect the status of the estrogen receptor in a metastatic breast cancer sample. e.g., dextran coated charcoal. NCI CDE: 3131881
* [STRING]    `metastatic_breast_carcinoma_lab_proc_her2_neu_in_situ_hybridization_outcome_type`
  - The type of outcome for HER2 testing in a sample of metastatic breast carcinoma as determined by an in situ hybridization (FISH) assay. NCI CDE: 3132455
* [STRING]    `metastatic_breast_carcinoma_pos_finding_her2_erbb2_other_measure_scale_text`
  - Text to describe a different scale used to measure HER2/ERBB2 positivity in a sample of metastatic breast carcinoma. NCI CDE: 3132448
* [STRING]    `lab_proc_her2_neu_immunohistochemistry_receptor_status`
  - Text term to signify the result of the medical procedure that involves testing a sample of blood or tissue for HER2 by histochemical localization of immunoreactive substances using labeled antibodies as reagents. NCI CDE: 2957563
* [STRING]    `progesterone_receptor_level_cell_percent_category`
  - Classification to represent Progesterone Receptor Positive results expressed as a percentage value. NCI CDE: 3128342
* [STRING]    `metastatic_breast_carcinoma_estrogen_receptor_level_cell_percent_category`
  - Classification to represent metastatic breast carcinoma estrogen receptor (ER) positive results expressed as a percentage value. NCI CDE: 3131869
* [STRING]    `metastatic_breast_carcinoma_estrogen_receptor_status`
  - Text term to represent the overall result of metastatic breast carcinoma Estrogen Receptor (ER) testing. NCI CDE: 3131865
* [STRING]    `lab_procedure_her2_neu_in_situ_hybrid_outcome_type`
  - the type of outcome for HER2 as determined by an in situ hybridization (ISH) assay. NCI CDE: 2854089
* [STRING]    `her2_neu_breast_carcinoma_copy_analysis_input_total_number`
  - Result of HER2 Copy Number testing (for the primary tumor), expressed as a range of values. NCI CDE: 3133738
* [STRING]    `metastatic_breast_carcinoma_fluorescence_in_situ_hybridization_diagnostic_proc_centromere_17_signal_result_range`
  - Result of Centromere 17 testing in a sample or specimen of metastatic breast carcinoma, expressed as a range of values. NCI CDE: 3132887
* [STRING]    `her2_neu_and_centromere_17_copy_number_metastatic_breast_carcinoma_analysis_input_total_number_count`
  - Numeric value to represent the total number of cells counted in a sample of metastatic breast carcinoma for HER2 & Centromere 17 copy number. NCI CDE: 3132899
* [STRING]    `her2_neu_metastatic_breast_carcinoma_copy_analysis_input_total_number`
  - Result of HER2 Copy Number testing (for the metastatic tumor), expressed as a range of values NCI CDE: 3133734
* [STRING]    `metastatic_breast_carcinoma_progesterone_receptor_detection_method_text`
  - The free-text field to specify the method of measurement used to detect the status of the progesterone receptor (PR) in a sample of metastatic breast carcinoma, e.g., dextran coated charcoal. NCI CDE: 3131993
* [STRING]    `additional_pharmaceutical_therapy`
  - The yes/no indicator related to the additional administration of various treatment modalities that produce the desired therapeutic effect by means of change of hormone/hormones level after the return of a disease after a period of remission or new disease.
* [STRING]    `additional_radiation_therapy`
  - Text yes/no/unknown indicator to signify additional therapeutic application of radiation therapy after return of disease. NCI CDE: 3008761
* [STRING]    `lymphovascular_invasion_present`
  - Lymphovascular invasion present
* [STRING]    `pos_lymph_node_location_other`
  - Free-text field to capture another name of the location of the pathologically positive lymph node that is not already specified or mentioned. NCI CDE: 3151522
* [STRING]    `pos_lymph_node_location`
  - Text term to represent the name of the location of the pathologically positive lymph node. NCI CDE: 3151519
* [STRING]    `location_in_lung_parenchyma`
  - Location in lung parenchyma
* [STRING]    `pulmonary_function_test_performed`
  - Yes/no indicator of wether pulmonary function test was performed
* [STRING]    `pre_bronchodilator_fev1_fvc_percent`
  - Percentage value to represent result of Forced Expiratory Volume in 1 second (FEV1) divided by the Forced Vital Capacity (FVC) pre-bronchodilator. NCI CDE: 3302955
* [STRING]    `kras_mutation_result`
  - Text term to signify the ability to detect a mutation on the KRAS non wild-type gene. NCI CDE: 3135074
* [STRING]    `post_bronchodilator_fev1_percent`
  - Percentage value to represent result of Forced Expiratory Volume in 1 second (FEV1) divided by the Forced Vital Capacity (FVC) post-bronchodilator. NCI CDE: 3302956
* [STRING]    `pre_bronchodilator_fev1_percent`
  - Percentage value to represent result of Forced Expiratory Volume in 1 second (FEV1) divided by the Forced Vital Capacity (FVC) pre-bronchodilator. NCI CDE: 3302955
* [STRING]    `dlco_predictive_percent`
  - The result measuring the amount of carbon monoxide detected in a patient's lungs._A lab value of the percentage of predicted normal. NCI CDE: 6002276
* [STRING]    `egfr_mutation_performed`
  - Indicator of whether or not an analysis for mutation in the EGFR gene was performed. NCI CDE: 6063955
* [STRING]    `diagnosis`
  - Text name for the histologic subtype used to refine a diagnosis of lung cancer.
* [STRING]    `eml4_alk_translocation_result`
  - Text term that represents the specific exon identified with the EML4-ALK chromosomal translocation. NCI CDE: 6063968
* [STRING]    `egfr_mutation_result`
  - Text term to signify the ability to detect a mutation on the EGFR gene. NCI CDE: 3774251
* [STRING]    `post_bronchodilator_fev1_fvc_percent`
  - Percentage value to represent result of Forced Expiratory Volume in 1 second (FEV1) divided by the Forced Vital Capacity (FVC) post-bronchodilator. NCI CDE: 3302956
* [STRING]    `eml4_alk_translocation_performed`
  - Indicator of whether or not an analysis for translocation in the EML4-ALK gene was performed. NCI CDE: 6063976
* [STRING]    `eml4_alk_translocation_method`
  - eml4 alk translocation method
* [STRING]    `days_to_new_tumor_event_after_initial_treatment`
  - The numeric value to represent the day of a new tumor event after initial treatment, regardless of the type of event. NCI CDE: 3104042
* [STRING]    `hemoglobin_result`
  - Text term to represent the summary result of the medical procedure that involves testing a sample of blood for hemoglobin, red respiratory protein of erythrocytes, to help determine a diagnosis, plan treatment, check to see if treatment is working, or monitor the disease over time. NCI CDE: 3113466
* [STRING]    `serum_calcium_result`
  - Text term to represent the summary result of the medical procedure that involves testing a sample of blood for serum calcium, the amount of calcium found in clear liquid part of the blood that remains after blood cells and clotting proteins have been removed. NCI CDE: 3113470
* [STRING]    `platelet_qualitative_result`
  - The qualitative result of a laboratory test that involved testing a sample of blood for the level of platelets (plt). NCI CDE: 3104944
* [STRING]    `number_of_lymphnodes_positive`
  - The number of lymph nodes involved with disease as determined by pathologic examination.
* [STRING]    `erythrocyte_sedimentation_rate_result`
  - The qualitative result of a laboratory test that involved testing a sample of blood for the level of erythrocyte sedimentation rate (esr, sedrate). NCI CDE: 3104952
* [STRING]    `white_cell_count_result`
  - The value, in cells/mcl, for the medical procedure that involves testing a sample cerebrospinal fluid, the fluid flowing around the brain and spinal cord, for blood cells that are devoid of hemoglobin, capable of Ameboid motion and phagocytosis, and act as the principal components of the immune system.
* [STRING]    `malignant_neoplasm_metastatic_involvement_site`
  - Free text field to specify the anatomic location where evidence is detected for spread of cancer from a tumor composed of atypical neoplastic cells to another part of the body that is not already specified or mentioned. NCI CDE: 3178387
* [STRING]    `other_metastatic_involvement_anatomic_site`
  - Text description of anatomic sites of metastatic carcinoma that are different from the ones previously identified.
* [STRING]    `birth_control_pill_history_usage_category`
  - Classification to represent a women's use of oral contraceptives/birth control pills. NCI CDE: 3104217
* [STRING]    `alcohol_history_documented`
  - Indicator to signify whether or not the history of alcohol consumption was documented. NCI CDE: 3440205
* [STRING]    `frequency_of_alcohol_consumption`
  - Indicating the frequency of alcohol consumed when the participant was actively drinking. NCI CDE: 2202064
* [STRING]    `source_of_patient_death_reason`
  - Source of patient death reason
* [STRING]    `days_to_diagnostic_mri_performed`
  - Numeric value that represents the day that a diagnostic magnetic resonance imaging scan was performed.
* [STRING]    `days_to_diagnostic_computed_tomography_performed`
  - Time interval from the date of Computed Tomography (CT) scan to the date of initial pathologic diagnosis, represented as a calculated number of days.
* [STRING]    `amount_of_alcohol_consumption_per_day`
  - Numeric value that represents on the days when a person drank, on average, about how many drinks they had.
* [STRING]    `family_history_of_cancer`
  - Text indicator to represent a report or record of a cancer diagnosis in any relative with whom one half of an individual"s genes is shared (i.e., parent, sibling, offspring). NCI CDE: 2436860
* [STRING]    `loss_expression_of_mismatch_repair_proteins_by_ihc_result`
  - Loss expression of mismatch repair proteins by ihc result
* [STRING]    `preoperative_pretreatment_cea_level`
  - Preoperative pretreatment cea level
* [STRING]    `microsatellite_instability`
  - The yes/no indicator to signify the status of a tumor for microsatellite instability. NCI CDE: 6032776
* [STRING]    `number_of_loci_tested`
  - Text number of the amount of loci found to be abnormal tested to detect recessive mutations
* [STRING]    `history_of_colon_polyps`
  - History of colon polyps
* [STRING]    `number_of_first_degree_relatives_with_cancer_diagnosis`
  - Numeric value that represents the number of first degree relatives (parent, sibling, and/or child) diagnosed with cancer.
* [STRING]    `number_of_abnormal_loci`
  - Text number of the amount of loci found to be abnormal tested to detect recessive mutations
* [STRING]    `circumferential_resection_margin`
  - Numeric value used to describe the non-peritonealised bare area of rectum, comprising anterior and posterior segments, when submitted as a surgical specimen resulting from excision of cancer of the rectum. NCI CDE: 6161030
* [STRING]    `non_nodal_tumor_deposits`
  - Text indicator to describe the identification of the presence of tumor deposits in the pericolic or perirectal fat or in adjacent mesentery away from the leading edge of the tumor. NCI CDE: 3107051
* [STRING]    `braf_gene_analysis_result`
  - Text term to identify the result of the Mutational analysis and sequencing of the BRAF gene. NCI CDE: 3107189
* [STRING]    `colon_polyps_present`
  - Text to identify the name of a city in which the sample was procured.
* [STRING]    `kras_mutation_codon`
  - KRAS Gene Mutation Other Position
* [STRING]    `braf_gene_analysis_performed`
  - Indicator of whether or not an analysis for mutation in the BRAF gene was performed. NCI CDE: 6061813
* [STRING]    `synchronous_colon_cancer_present`
  - The yes/no indicator whether synchronous colon cancer is present. NCI CDE: 2185953
* [STRING]    `loss_expression_of_mismatch_repair_proteins_by_ihc`
  - Loss expression of mismatch repair proteins by ihc
* [STRING]    `barretts_esophagus`
  - Barretts esophagus
* [STRING]    `city_of_procurement`
  - Text to identify the name of a city in which the sample was procured.
* [STRING]    `reflux_history`
  - The yes/no/unknown/not reported indicator used to describe patients/participants who have a history of reflux disease. NCI CDE: 6059631
* [STRING]    `country_of_procurement`
  - Text term that describes the name of the country where the specimen was collected.
* [STRING]    `antireflux_treatment_type`
  - A chronic disorder characterized by reflux of the gastric and/or duodenal contents into the distal esophagus. It is usually caused by incompetence of the lower esophageal sphincter. Symptoms include heartburn and acid indigestion. It may cause injury to the esophageal mucosa. An action or administration of therapeutic agents to produce an effect that is intended to alter the course of a pathologic process. The act or process of gathering biospecimens for testing, diagnostic, propagation, treatment or research purposes. A specific point in the time continuum, including those established relative to an event. Given. Type; a subdivision of a particular kind of thing.
* [STRING]    `h_pylori_infection`
  - The yes/no/unknown indicator that identifies patients/participants who have a previous or current diagnosis of H. pylori infection. NCI CDE: 3203146
* [STRING]    `hypertension`
  - A human being._Abnormally high blood pressure._Indicator of Yes or No to a question. NCI CDE: 2935342
* [STRING]    `horm_ther`
  - Text description of the current status of a woman's use of hormone replacement therapy after menopause. NCI CDE: 3012813
* [STRING]    `pln_pos_ihc`
  - Number of peripheral lymph nodes by immunohistochemistry
* [STRING]    `surgical_approach`
  - Text description, or term used, for the type of surgical procedure that was performed on a patient. NCI CDE: 5653325
* [STRING]    `pregnancies`
  - The number of times, including this event, where a female participant conceived and became pregnant regardless of outcome.
* [STRING]    `diabetes`
  - The indicator that describes the absence or presence of whether or not diabetes, a disease in which the body does produce enough insulin or does not use properly and is unable to control the amount of sugar in the blood, that causes discomfort, dysfunction, or distress to the person affected or those in contact with the person is present during the indicated period. NCI CDE: 3610965
* [STRING]    `peritoneal_wash`
  - An indication of whether peritoneal washings were collected. NCI CDE: 5664775
* [STRING]    `pct_tumor_invasion`
  - Value for percent calculated as depth of myometrial invasion divided by depth of myometrial thickness.
* [STRING]    `prior_tamoxifen_administered_usage_category`
  - Information related to past tamoxifen administered._Earlier in time or order._An antineoplastic nonsteroidal selective estrogen receptor modulator (SERM). Tamoxifen competitively inhibits the binding of estradiol to estrogen receptors, thereby preventing the receptor from binding to the estrogen-response element on DNA. The result is a reduction in DNA synthesis and cellular response to estrogen. In addition, tamoxifen up-regulates the production of transforming growth factor B (TGFb), a factor that inhibits tumor cell growth, and down-regulates insulin-like growth factor 1 (IGF-1), a factor that stimulates breast cancer cell growth. (NCI04)_A manner, or usual, or accepted practice of using something._Category; used informally to mean a class of things. NCI CDE: 3104234
* [STRING]    `colorectal_cancer`
  - The yes/no indicator that identifies subjects with a current cancer diagnosis of pancreatic, colorectal or lung cancer. NCI CDE: 3528541
* [STRING]    `total_aor_lnp`
  - Total aor lnp
* [STRING]    `pln_pos_light_micro`
  - Pln pos light micro
* [STRING]    `total_pelv_lnp`
  - Total pelv lnp
* [STRING]    `total_pelv_lnr`
  - Total pelv lnr
* [STRING]    `aln_pos_light_micro`
  - The number of positive axillary lymph nodes by ligth-microscopy.
* [STRING]    `aln_pos_ihc`
  - The number of positive axillary lymph nodes by immunohistochemistry (IHC).
* [STRING]    `total_aor_lnr`
  - Total aor lnr
* [STRING]    `post_surgical_procedure_assessment_thyroid_gland_carcinoma_status`
  - Text term to describe a person's condition within three months after surgery and adjuvant therapy to treat a thyroid gland carcinoma. NCI CDE: 3186684
* [STRING]    `metastatic_neoplasm_confirmed_diagnosis_method_text`
  - Free text field to specify the name of the method used to establish or verify identification of a tumor that has spread from its original (primary) site of growth to another site that is not already specified or mentioned. NCI CDE: 3178376
* [STRING]    `metastatic_neoplasm_confirmed_diagnosis_method_name`
  - Text term to represent the name of the method used to establish or verify identification of a tumor that has spread from its original (primary) site of growth to another site. NCI CDE: 3178364
* [STRING]    `prior_glioma`
  - Yes/no indicator to history of prior glioma (GBM)
* [STRING]    `tumor_residual_disease`
  - Residual disease (RD) status, 1-10 mm, >20 mm,11-20 mm
* [STRING]    `jewish_origin`
  - Text names for Jewish heritage categories for a patient/participant on a clinical trial.
* [STRING]    `distant_metastasis_anatomic_site`
  - Distant Metastasis Location Anatomic Site
* [STRING]    `new_neoplasm_event_type`
  - Text term to identify a new tumor event. NCI CDE: 3119721
* [STRING]    `lymphnode_dissection_method_left`
  - Lymphnode dissection method left
* [STRING]    `lymphnode_neck_dissection`
  - Lymphnode neck dissection
* [STRING]    `egfr_amplication_status`
  - Text term to represent the status of the EGFR amplification.
* [STRING]    `hpv_status_by_ish_testing`
  - A procedure to determine the HPV status by ICH.
* [STRING]    `presence_of_pathological_nodal_extracapsular_spread`
  - Presence of pathological nodal extracapsular spread
* [STRING]    `p53_gene_analysis`
  - Text term to describe the status of the p53 gene. NCI CDE: 3124938
* [STRING]    `hpv_status_by_p16_testing`
  - HPV status by p16 testing
* [STRING]    `lymphnode_dissection_method_right`
  - Lymphnode dissection method right
* [STRING]    `eml4_alk_translocation_identified`
  - Indicator of whether or not a EML4-ALK chromosomal translocation was identified. NCI CDE: 6063959
* [STRING]    `egfr_mutation_identified`
  - Indicator of whether or not a mutation abnormality in the EGFR gene was identified.
* [STRING]    `supratentorial_localization`
  - The named locations of a grade I or grade II glioma arising from the intracranial venous sinus that lies in a superior and midline location above the interhemispheric fissure along the superior border of the falx cerebri of the brain. NCI CDE: 7114355
* [STRING]    `mold_or_dust_allergy_history`
  - Mold or dust allergy history
* [STRING]    `motor_movement_changes`
  - Motor movement changes
* [STRING]    `inherited_genetic_syndrome_found`
  - Inherited genetic syndrome found
* [STRING]    `seizure_history`
  - The yes/no/unknown response related to the participant's medical history of epilepsy/seizure disorder. NCI CDE: 3194632
* [STRING]    `asthma_history`
  - A yes or no indicator to ask whether there is a history of asthma. NCI CDE: 2178041
* [STRING]    `first_diagnosis_age_asth_ecz_hay_fev_mold_dust`
  - First diagnosis age asth ecz hay fev mold dust
* [STRING]    `first_diagnosis_age_of_food_allergy`
  - First diagnosis age of food allergy
* [STRING]    `ldh1_mutation_found`
  - ldh1 mutation found
* [STRING]    `tumor_location`
  - The site in or on the body at which the tumor identification test or result is performed or collected. NCI CDE: 6621372
* [STRING]    `ldh1_mutation_test_method`
  - ldh1 mutation test method
* [STRING]    `animal_insect_allergy_types`
  - Text name(s) of the specified type of allergy to animals or insects.
* [STRING]    `first_presenting_symptom`
  - The first symptom that is related to the metastatic disease of interest. NCI CDE: 7118710
* [STRING]    `animal_insect_allergy_history`
  - A person's stated observation of whether or not they have animal or insect allergies
* [STRING]    `first_presenting_symptom_longest_duration`
  - First presenting symptom longest duration
* [STRING]    `ldh1_mutation_tested`
  - ldh1 mutation tested
* [STRING]    `visual_changes`
  - Yes/no indicator of visual changes
* [STRING]    `first_diagnosis_age_of_animal_insect_allergy`
  - first diagnosis age of animal insect allergy
* [STRING]    `history_ionizing_rt_to_head`
  - History ionizing rt to head
* [STRING]    `sensory_changes`
  - Sensory changes
* [STRING]    `food_allergy_history`
  - A person's stated observation of whether or not they have any food allergies.
* [STRING]    `mental_status_changes`
  - Mental status changes
* [STRING]    `hay_fever_history`
  - Yes/No/Unknown indicator to identify patients/ participants who have a personal history of hay fever (seasonal pollen allergies). NCI CDE: 3133930
* [STRING]    `preoperative_corticosteroids`
  - Preoperative corticosteroids
* [STRING]    `preoperative_antiseizure_meds`
  - Preoperative antiseizure meds
* [STRING]    `family_history_of_primary_brain_tumor`
  - An indicator response which documents whether the parents, siblings or children of an individual have a history of a primary brain tumor. NCI CDE: 7118709
* [STRING]    `inherited_genetic_syndrome_result`
  - Inherited genetic syndrome result
* [STRING]    `days_to_initial_score_performance_status_scale`
  - Numeric value to represent the day of obtaining the initital score of the Performance Status Scale.
* [STRING]    `food_allergy_types`
  - Food allergy types
* [STRING]    `headache_history`
  - Pain in various parts of the head, not confined to the area of distribution of any nerve. Subjective reports made by a patient. An account of all medical events and problems a person has experienced. A caDSR representation term that is used to indicate a question with permissible values of yes/no NCI CDE: 3109852
* [STRING]    `eczema_history`
  - Yes/No/Unknown indicator to identify patients/ participants who have a personal history of eczema. NCI CDE: 3133925
* [STRING]    `other_genotyping_outcome_lab_results_text`
  - Free text field to specify the results of other genotypic assessments of mutation that is not already specified or mentioned. NCI CDE: 3179278
* [STRING]    `extrathyroid_carcinoma_present_extension_status`
  - Text term to describe the degree to which the primary tumor has extra thyroid extension. NCI CDE: 3179452
* [STRING]    `i_131_first_administered_dose`
  - A radioactive isotope of iodine with an atomic mass of 131, a half life of eight days, and potential antineoplastic activity. Selectively accumulating in the thyroid gland, iodine I 131 emits beta and gamma particles, thereby killing thyroid cells and decreasing thyroid hormone production._Preceding all others in time or space or degree._Given._The amount of medicine taken, or radiation given, at one time._Text; the words of something written. NCI CDE: 3232898
* [STRING]    `i_131_subsequent_administered_dose`
  - A radioactive isotope of iodine with an atomic mass of 131, a half life of eight days, and potential antineoplastic activity. Selectively accumulating in the thyroid gland, iodine I 131 emits beta and gamma particles, thereby killing thyroid cells and decreasing thyroid hormone production._Subsequent; immediately following in time or order._Given._The amount of medicine taken, or radiation given, at one time._Text; the words of something written. NCI CDE: 3232904
* [STRING]    `i_131_total_administered_dose`
  - A radioactive isotope of iodine with an atomic mass of 131, a half life of eight days, and potential antineoplastic activity. Selectively accumulating in the thyroid gland, iodine I 131 emits beta and gamma particles, thereby killing thyroid cells and decreasing thyroid hormone production._Pertaining to an entirety or whole, also constituting the full quantity or extent; complete; derived by addition._Given._The amount of medicine taken, or radiation given, at one time._Text; the words of something written. NCI CDE: 3232906
* [STRING]    `primary_neoplasm_focus_type`
  - Text term to describe whether the tumor or cancer first developed in a single or multiple locations. NCI CDE: 3174022
* [STRING]    `i_131_total_administered_preparation_technique`
  - A radioactive isotope of iodine with an atomic mass of 131, a half life of eight days, and potential antineoplastic activity. Selectively accumulating in the thyroid gland, iodine I 131 emits beta and gamma particles, thereby killing thyroid cells and decreasing thyroid hormone production._Pertaining to an entirety or whole, also constituting the full quantity or extent; complete; derived by addition._Given._The act or process of making something ready; also a medication made ready for administration; also an anatomic or pathologic specimen made ready and preserved for study._A practiced and regimented skill or series of actions._The words or language units by which a thing is known. NCI CDE: 3232952
* [STRING]    `person_lifetime_risk_radiation_exposure_indicator`
  - Text term to signify whether a person has been exposed to ionizing radiation. [Manually-curated] NCI CDE: 2816350
* [STRING]    `ret_ptc_rearrangement_genotyping_outcome_lab_results_text`
  - Free text field to specify the results of genotypic assessment of mutation in the RET/PEC gene. NCI CDE: 3179271
* [STRING]    `genotyping_results_gene_mutation_not_reported_reason`
  - Text term to capture the explanation related to missing results for genotypic analysis. NCI CDE: 3179383
* [STRING]    `neoplasm_depth`
  - The measurement extent downward or inward of remaining tumor expressed using Breslow 's thickness: maximal thickness of a primary cutaneous melanoma measured in tissue sections from the top of the epidermal granular layer, or from the ulcer base (if the tumor is ulcerated), to the bottom of the tumor, with metastatic rates correlating closely with tumor thickness. NCI CDE: 2593061
* [STRING]    `genotype_analysis_performed_indicator`
  - Text indicator to signify whether or not genotypic analysis was performed. NCI CDE: 3179001
* [STRING]    `ras_family_gene_genotyping_outcome_lab_results_text`
  - Free text field to specify the results of genotypic assessment of mutation in the RAS gene. NCI CDE: 3179266
* [STRING]    `neoplasm_length`
  - Annotation used to indicate the length of cancer tissue in a specimen, measured in mm. NCI CDE: 5542978
* [STRING]    `neoplasm_width`
  - Measurement of the width of a tumor composed of atypical neoplastic, often pleomorphic cells that invade other tissues within a hollow, thick-walled, muscular organ located within the pelvic cavity of a woman. NCI CDE: 3441689
* [STRING]    `radiosensitizing_agent_administered_indicator`
  - Drugs used to potentiate the effectiveness of radiation therapy in destroying unwanted cells._Given._Indicator of Yes, No, or Unknown to represent a condition. NCI CDE: 3232932
* [STRING]    `braf_gene_genotyping_outcome_lab_results_text`
  - Free text field to specify the results of genotypic assessment of mutation in the BRAF gene. NCI CDE: 3179257
* [STRING]    `lymph_node_preoperative_scan_indicator`
  - Text indicator to signify whether or not the medical imaging of the lymph nodes was performed prior to surgery. NCI CDE: 3178301
* [STRING]    `radiation_therapy_administered_preparation_technique_text`
  - Information related to radiation therapy administered to a patient._The act or process of making something ready; also a medication made ready for administration; also an anatomic or pathologic specimen made ready and preserved for study._A practiced and regimented skill or series of actions._Text; the words of something written. NCI CDE: 3232960
* [STRING]    `lymph_node_preoperative_assessment_diagnostic_imaging_type`
  - Text term to describe the type of lymph node medical imaging that was performed prior to surgery. NCI CDE: 3178310
* [STRING]    `patient_personal_medical_history_thyroid_gland_disorder_name`
  - Text term to represent the name of the thyroid gland disorder, found in the record of a patient's medical background. NCI CDE: 3176743
* [STRING]    `first_degree_relative_history_thyroid_gland_carcinoma_diagnosis_relationship_type`
  - Text term to describe the relationship to the participant of the first degree family member who has a history of thyroid cancer. NCI CDE: 3179002
* [STRING]    `radiation_therapy_administered_dose_text`
  - Information related to radiation therapy administered to a patient._The amount of medicine taken, or radiation given, at one time._Text; the words of something written. NCI CDE: 3232933
* [STRING]    `patient_personal_medical_history_thyroid_other_specify_text`
  - Free text field to specify the name of the thyroid gland disorder, found in the record of a patient's medical background that is not already specified or mentioned. NCI CDE: 3179397
* [STRING]    `primary_thyroid_gland_neoplasm_location_anatomic_site`
  - Text term to describe the specific location within the thyroid where the tumor or cancer first developed. NCI CDE: 3186750
* [STRING]    `lymphnodes_examined`
  - Lymphnodes examined
* [STRING]    `zone_of_origin`
  - A component of an address that specifies a location by identification of an area where products are manufactured.
* [STRING]    `days_to_bone_scan_performed`
  - Numeric value to represent the day that a bone scan was performed.
* [STRING]    `diagnostic_mri_performed`
  - The yes/no indicator that asks whether an MRI scan was performed. NCI CDE: 3534862
* [STRING]    `diagnostic_mri_result`
  - Text term to describe the result of a magnetic resonance imaging diagnostic procedure. NCI CDE: 3151441
* [STRING]    `psa_value`
  - The determination of the PSA (prostate specific antigen) present in a sample. NCI CDE: 7063440
* [STRING]    `days_to_first_biochemical_recurrence`
  - Numeric value to represent the day of the first biochemical recurrence.
* [STRING]    `secondary_pattern`
  -  Numeric value indicating the second-most frequent pattern or pathologic grade for a specimen or groups of specimens as interpreted by a pathologist using the Gleason Score scale. NCI CDE: 1284
* [STRING]    `primary_pattern`
  - Numeric value indicating the most frequent pattern or pathologic grade for a specimen or groups of specimens as interpreted by a pathologist using the Gleason Score scale. NCI CDE: 1282
* [STRING]    `diagnostic_ct_abd_pelvis_result`
  - Diagnostic ct abd pelvis result
* [STRING]    `bone_scan_results`
  - Yes/or no indicator for Information related to the results availability for a nuclear imaging method used to evaluate pathological bone metabolism.
* [STRING]    `biochemical_recurrence`
  - Indicator to ask if the patient has been diagnosed with a recurrence using biochemical markers.
* [STRING]    `tumor_level`
  - Text term to describe the site (apex, middle, base) within the prostate zonal anatomy used to identify the location of the tumor. NCI CDE: 7063204
* [STRING]    `gleason_score`
  - The Gleason score that provides a reproducible description of the glandular architecture of prostate tissue depending primarily on the microscopic patterns of cancerous glands and cell morphology. NCI CDE: 2433
* [STRING]    `number_of_lymphnodes_examined`
  - The total number of lymph nodes removed and pathologically assessed for disease.
* [STRING]    `days_to_psa`
  - Numeric value to represent the day that the most recent PSA was performed.
* [STRING]    `tertiary_pattern`
  - An integer representing the third most predominant Gleason pattern or grade present in an invasive prostate carcinoma. A teritary pattern can only be assigned in a radical prostatectomy specimen, and is not required. NCI CDE: 2431622
* [STRING]    `diagnostic_ct_abd_pelvis_performed`
  - Yes/no indicator related to evaluation based on a method of examining body organs by scanning them with X rays and using a computer to construct a series of cross-sectional scans along a single axis of the abdomen and pelvis.
* [STRING]    `family_medical_history_relative_family_member_relationship_type`
  - Family medical history relative family member relationship type
* [STRING]    `tumor_type`
  - Text term to represent the category for a neoplasm's histologic subtype. NCI CDE: 2831122
* [STRING]    `primary_tumor_multiple_present_ind`
  - Yes/no indicator to ask if multiple primary tumors were identified. NCI CDE: 64186
* [STRING]    `prior_systemic_therapy_type`
  - Text term to describe a systemic therapy modality. NCI CDE: 3119700
* [STRING]    `melanoma_clark_level_value`
  - Definition of the Clark level or depth of involvement of a melanoma in the skin or a specimen. NCI CDE: 2593051
* [STRING]    `melanoma_origin_skin_anatomic_site`
  - Text term for the skin site from which a primary melanoma originates. NCI CDE: 3108474
* [STRING]    `malignant_neoplasm_mitotic_count_rate`
  - Rate measured for the number of mitoses identified under the microscope in malignant neoplasm. NCI CDE: 3186135
* [STRING]    `breslow_depth_value`
  - Value representating Breslow's thickness of a cutaneous melanoma measured in tissue sections from the top of the epidermal granular layer, or from the ulcer base (if the tumor is ulcerated), to the bottom of the tumor; metastatic rates correlate closely with tumor thickness. (from On-line Medical Dictionary) NCI CDE: 2593055
* [STRING]    `tumor_tissue_site_1`
  - Tumor Tissue Site
* [STRING]    `melanoma_ulceration_indicator`
  - Text indicator to signify whether a melanoma has ulceration present. NCI CDE: 3108478
* [STRING]    `primary_neoplasm_melanoma_dx`
  - Primary neoplasm melanoma dx
* [STRING]    `new_tumor_dx_prior_submitted_specimen_dx`
  - New tumor dx prior submitted specimen dx
* [STRING]    `primary_anatomic_site_count`
  - Occurring first in time or sequence; original; of greatest rank or importance or value._A tumor composed of atypical neoplastic, often pleomorphic cells that invade other tissues. Malignant neoplasms often metastasize to distant anatomic sites and may recur after excision. The most common malignant neoplasms are carcinomas (adenocarcinomas or squamous cell carcinomas), Hodgkin and non-Hodgkin lymphomas, leukemias, melanomas, and sarcomas._Named locations of or within the body._Count of the number of tumors classified as primaries, not sites of metastatic disease. NCI CDE: 2967294
* [STRING]    `interferon_90_day_prior_excision_admin_indicator`
  - The yes/no/unknown indicator to determine whether the patient received IFN therapy 90 days prior to the resection of the specimen submitted. NCI CDE: 3162803
* [STRING]    `primary_melanoma_at_diagnosis_count`
  - Total number of the known primary tumors at the time of initial diagnosis. NCI CDE: 3427429
* [STRING]    `days_to_submitted_specimen_dx`
  - Numeric value to represent the day of the diagnosis for the submitted sample.
* [STRING]    `antireflux_treatment`
  - The yes/no/unknown indicator that identifies patients/participants who were receiving anti-reflux treatment at the time of sample procurement.
* [STRING]    `number_of_relatives_with_stomach_cancer`
  - A numeric value to represent the number of first degree relatives (parents, siblings, children) who have been diagnosed with stomach cancer.
* [STRING]    `family_history_of_stomach_cancer`
  - An indicator response which documents if a family history of stomach cancer. NCI CDE: 7063047
* [STRING]    `state_province_country_of_procurement`
  - State province country of procurement
* [STRING]    `specimen_collection_method_name`
  - The type of procedure or method used to collect a biospecimen or tissue sample. NCI CDE: 3131309
* [STRING]    `child_pugh_classification_grade`
  - The grade from an assessment method used in the prognosis of chronic liver disease, mainly cirrhosis. NCI CDE: 2931791
* [STRING]    `hist_of_non_mibc`
  - Hist of non mibc
* [STRING]    `occupation_primary_job`
  - The primary occupation of the participant for most of their adult employment. NCI CDE: 5714
* [STRING]    `person_concomitant_prostate_carcinoma_occurrence_indicator`
  - Text term to signify a person's diagnosis of prostatic carcinoma incidentally or at the same time as another cancer diagnosis, such as bladder carcinoma. NCI CDE: 3135387
* [STRING]    `person_concomitant_prostate_carcinoma_pathologic_t_stage`
  - Code to represent the extent of incidental or concomitant prostate carcinoma in the primary tumor site based on pathological assessment and the staging guidelines from the AJCC edition 7.0. NCI CDE: 3135398
* [STRING]    `cancer_diagnosis_cancer_type_icd9_text_name`
  - Diagnosis represented as a character short name using ICD-9 cancer types. NCI CDE: 2195089
* [STRING]    `non_mibc_tx`
  - Non mibc tx
* [STRING]    `bladder_carcinoma_extracapsular_extension_status`
  - Text term to describe the extent of extracapsular extension present in a case of bladder carcinoma. NCI CDE: 3130374
* [STRING]    `chemical_exposure_text`
  - A free text field to specify an exposure to a substance with a defined atomic or molecular structure that results from, or takes part in, reactions involving changes in its structure, composition, or properties. NCI CDE: 2596673
* [STRING]    `resp_maint_from_bcg_admin_month_dur`
  - Resp maint from bcg admin month dur
* [STRING]    `maint_therapy_course_complete`
  - Indicator to signify whether or not the patient completed one or more courses of maintenance therapy. NCI CDE: 3436266
* [STRING]    `induction_course_complete`
  - Indicator to signify whether or not the patient completed one or more courses of neoadjvant therapy. NCI CDE: 3436265
* [STRING]    `person_occupation_years_number`
  - The number that describes the duration of time expressed in number of years that a person has worked in a job. NCI CDE: 2435424
* [STRING]    `person_primary_industry_text`
  - Text to describe the industry in which a person's primary occupation time was spent. NCI CDE: 3135408
* [STRING]    `disease_extracapsular_extension_ind_3`
  -  Yes/no/unknown indicator that asks whether or not there is extracapsular extension. NCI CDE: 64165
* [STRING]    `complete_response_observed`
  - Indicator to signify whether or not the patient had a complete response to treatment. NCI CDE: 3436262
* [STRING]    `diagnosis_subtype`
  - Pathologic Subtype
* [STRING]    `diagnosis_age`
  - The numerical response indicating the age of a person, expressed in years, when they were diagnosed with a disease or disorder. NCI CDE: 4828691
* [STRING]    `mibc_90day_post_resection_bcg`
  - Mibc 90day post resection bcg
* [STRING]    `person_occupation_description_text`
  - The text that describes the type of business or industry associated with a person's job. NCI CDE: 2435398
* [STRING]    `surgical_procedure_name_other_specify_text`
  - The free-text field used to describe the name assigned to a surgical procedure done for diagnostic, surveillance, treatment, palliation, or study-directed purposes. NCI CDE: 3121814
* [STRING]    `relative_family_cancer_history_ind_3`
  - Yes/no/unknown indicator that asks whether any blood relatives have ever been diagnosed with cancer. NCI CDE: 2691192
* [STRING]    `vascular_tumor_cell_invasion_type`
  - Text term that represents the type of vascular tumor invasion. NCI CDE: 3168001
* [STRING]    `viral_hepatitis_serology`
  - Text term that describes the kind of serological laboratory test used to determine the positive or negative test result for hepatitis. NCI CDE: 4395982
* [STRING]    `liver_fibrosis_ishak_score_category`
  - The score or group of scores as described by Dr. Kamal G. Ishak and colleagues to assess the histopathologic degree of liver damage. NCI CDE: 3182621
* [STRING]    `ablation_embolization_tx_adjuvant`
  - Text indicator to signify whether or not the adjuvant ablation or embolization was performed post-operatively. Yes No Unknown Indicator. NCI CDE: 3172120
* [STRING]    `laboratory_procedure_prothrombin_time_result_value`
  - Numeric laboratory value of the prothrombin coagulation time in peripheral blood. NCI CDE: 2459694
* [STRING]    `laboratory_procedure_creatinine_result_lower_limit_of_normal_value`
  - Lower limit of normal of a renal creatinine lab. NCI CDE: 2234697
* [STRING]    `laboratory_procedure_alpha_fetoprotein_outcome_value`
  - The numerical quantity measured for laboratory result for alpha fetoprotein. NCI CDE: 2932074
* [STRING]    `laboratory_procedure_alpha_fetoprotein_outcome_upper_limit_of_normal_value`
  - A numerical quantity measured that is the top value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for particular laboratory result or other quantitative parameter for alpha fetoprotein (a protein normally produced by a developing fetus). NCI CDE: 2932064
* [STRING]    `laboratory_procedure_alpha_fetoprotein_outcome_lower_limit_of_normal_value`
  - A numerical quantity measured that is the bottom value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for particular laboratory result or other quantitative parameter for alpha fetoprotein (a protein normally produced by a developing fetus). NCI CDE: 3171861
* [STRING]    `laboratory_procedure_albumin_result_upper_limit_of_normal_value`
  - Laboratory procedure albumin result upper limit of normal value
* [STRING]    `laboratory_procedure_albumin_result_specified_value`
  - The value of a lab test used to determine the albumin level in the blood. NCI CDE: 58274
* [STRING]    `laboratory_procedure_creatinine_result_upper_limit_of_normal_value`
  - The value, in mg/dL, for the upper limit of normal for the medical procedure that involves testing a sample of blood for creatinine, the breakdown product of creatine, a constituent of muscle tissue, that is excreted by the kidney and whose serum level is used to evaluate kidney function. NCI CDE: 2183392
* [STRING]    `laboratory_prcoedure_platelet_result_upper_limit_of_normal_value`
  - Laboratory prcoedure platelet result upper limit of normal value
* [STRING]    `lab_procedure_platelet_result_specified_value`
  - The absolute peripheral platelet count (in 1000/mcL). NCI CDE: 58304
* [STRING]    `days_to_definitive_surgical_procedure_performed`
  - Numeric value that represents the day definitive surgical procedure was performed.
* [STRING]    `hematology_serum_creatinine_laboratory_result_value_in_mg_dl`
  - A value which captures the amount of Creatinine in the blood measured in milligrams per deciliter (mg/dL). Creatinine is derived from a constituent of muscle tissue, which is used to evaluate kidney glomerular filtration. [Manually-curated] NCI CDE: 2655822
* [STRING]    `history_hepato_carcinoma_risk_factor`
  - An individual's attribute, characteristic or exposure that increases the likelihood of developing a disease (WHO) that arises from hepatocytes resulting in hepatocellular carcinoma, or as diffuse liver involvement. NCI CDE: 7118713
* [STRING]    `history_hepato_carcinoma_risk_factor_other`
  - History hepato carcinoma risk factor other
* [STRING]    `cancer_diagnosis_first_degree_relative_number`
  - Numeric value that represents the number of first degree relatives (parent, sibling, and/or child) diagnosed with cancer. NCI CDE: 3171640
* [STRING]    `laboratory_prcoedure_platelet_result_lower_limit_of_normal_value`
  - Laboratory prcoedure platelet result lower limit of normal value
* [STRING]    `laboratory_procedure_international_normalization_ratio_result_lower_limit_of_normal_value`
  - Lower limit of normal of the International Normalization Ratio value. NCI CDE: 2799755
* [STRING]    `laboratory_procedure_albumin_result_lower_limit_of_normal_value`
  - The numeric laboratory value representing the lower level of the normal range of values for Albumin in peripheral blood serum used to comparatively reference the patient's lab result NCI CDE: 2004085
* [STRING]    `laboratory_procedure_total_bilirubin_result_specified_lower_limit_of_normal_value`
  - Laboratory procedure total bilirubin result specified lower limit of normal value
* [STRING]    `laboratory_procedure_total_bilirubin_result_specified_upper_limit_of_normal_value`
  - The institutional upper limit of normal value in mg/dL for the procedure that involves testing or manipulating a sample of blood in a laboratory setting for total bilirubin, a breakdown product of hemoglobin, liver lab. NCI CDE: 2003891
* [STRING]    `laboratory_procedure_total_bilirubin_result_upper_limit_normal_value`
  - The numeric laboratory value (units not specified) for the procedure that involves testing or manipulating a sample of blood in a laboratory setting for total bilirubin, a breakdown product of hemoglobin, liver lab. NCI CDE: 2004060
* [STRING]    `adjacent_hepatic_tissue_inflammation_extent_type`
  - Text term that represents the extent of active hepatic inflammation in adjacent tissue. NCI CDE: 3173974
* [STRING]    `laboratory_procedure_international_normalization_ratio_result_upper_limit_of_normal_value`
  - The upper limit of normal of the International Normalization Ratio value. NCI CDE: 2190394
* [STRING]    `mitotic_count`
  - Numeric response that indicates the mitoses counted microscopically per high power field. NCI CDE: 7069579
* [STRING]    `oligonucleotide_primer_pair_laboratory_procedure_performed_name`
  - Text term to represent the name of the method of oligonucleotide primer pair testing. NCI CDE: 3151487
* [STRING]    `radiation_type_notes`
  - Radiation type notes
* [STRING]    `number_of_successful_pregnancies_which_resulted_in_at_least_1_live_birth`
  - Count of the number of successful pregnancies that resulted in the birth of at least one child.
* [STRING]    `external_beam_radiation_therapy_administered_paraaortic_region_lymph_node_dose`
  - Numeric value to represent the total dose in cGY of external beam radiation treatment administered to the paraaortic nodes. NCI CDE: 3151106
* [STRING]    `concurrent_chemotherapy_dose`
  - Occurring or operating at the same time._The use of synthetic or naturally-occurring chemicals for the treatment of diseases. Although this term may be used to describe any therapy involving the use of chemical-based agents, it is most commonly used to refer to the variety of chemical-based agents employed to treat cancer. Cancer chemotherapy works by arresting or killing the growth and spread of cancer cells. Because cancer cells usually divide much faster than normal cells, they are often very sensitive to the inhibitory actions of chemotherapeutic agents. Chemotherapy may also include agents that enhance immune function or alter hormonal activity. (NCI04)_The total quantity or strength of a substance (drug or radiation) administered at one time. (NCI) NCI CDE: 3166172
* [STRING]    `chemotherapy_regimen_type`
  - The chemotherapy regimen or schedule and agent in the therapy of patient NCI CDE: 2007212
* [STRING]    `chemotherapy_negation_radiation_therapy_concurrent_not_administered_reason`
  - Text term to capture the explanation for a chemotherapy not being given concurrent to radiation therapy. NCI CDE: 3151120
* [STRING]    `postoperative_rx_tx_1`
  - Yes/no indicator of postoperative radiology treatment
* [STRING]    `dose_frequency_text`
  - The text that represents the planned dosage frequency for a agent. NCI CDE: 2179580
* [STRING]    `rt_pelvis_administered_total_dose`
  - A numeric value for the total dose volume of radiation therapy given to critical anatomic structures in the pelvic region. NCI CDE: 3006
* [STRING]    `cervical_neoplasm_pathologic_margin_involved_type`
  - Text term to describe the type of cervical cancer margin involvement. NCI CDE: 3151541
* [STRING]    `cervical_neoplasm_pathologic_margin_involved_text`
  - Free-text field to capture another type of cervical cancer margin involvement that is not already specified or mentioned. NCI CDE: 3151544
* [STRING]    `cervical_carcinoma_pelvic_extension_text`
  - Text term to capture comments related to the cervical cancer pelvic extension. NCI CDE: 3151605
* [STRING]    `cervical_carcinoma_corpus_uteri_involvement_indicator`
  - Text indicator to signify whether or not there was corpus uteri involvement. NCI CDE: 3151610
* [STRING]    `ectopic_pregnancy_count`
  - Number of ectopic pregnancies in a woman's history. NCI CDE: 2261915
* [STRING]    `rt_administered_type`
  - The type of radiation therapy given to a patient. NCI CDE: 61468
* [STRING]    `oligonucleotide_primer_pair_laboratory_procedure_performed_text`
  - Free-text field to capture another name for the method of oligonucleotide primer pair testing that is not already specified or mentioned. NCI CDE: 3151490
* [STRING]    `other_chemotherapy_agent_administration_specify`
  - Free-text field to specify the other chemotherapy agent administered. NCI CDE: 2426129
* [STRING]    `radiation_therapy_not_administered_reason`
  - The reason radiation therapy was not administered or given. NCI CDE: 2733266
* [STRING]    `patient_pregnancy_therapeutic_abortion_count`
  - The number of times for which a female participant conceived and became pregnant, but did not carry fetus to term due to medical intervention to end the pregnancy. NCI CDE: 2180648
* [STRING]    `days_to_laboratory_procedure_tumor_marker_squamous_cell_carcinoma_antigen_result`
  - Time interval from the date of Squamous Cellular Carcinoma Antigen (SCCA) Tumor Marker Result to the date of initial pathologic diagnosis, represented as a calculated number of days. NCI CDE: 5654374
* [STRING]    `days_to_performance_status_assessment`
  - The date of the final result of a determination of the value, significance, or extent of how well a patient is able to perform ordinary tasks and carry out daily activities.
* [STRING]    `prescribed_dose_units`
  - Code to represent the unit of measure (UOM) associated with a prescribed dose for treatment. NCI CDE: 3065815
* [STRING]    `diagnostic_ct_result_outcome`
  - Text term to describe the result of a computed tomography diagnostic procedure. NCI CDE: 3151439
* [STRING]    `patient_pregnancy_spontaneous_abortion_count`
  - the number of times for which a female participant conceived and became pregnant, but did not carry fetus to term due to natural occurrences or problems during the pregnancy. NCI CDE: 2180637
* [STRING]    `patient_pregnancy_count`
  - The number of times, including this event, where a female participant conceived and became pregnant regardless of outcome. NCI CDE: 2180638
* [STRING]    `fdg_or_ct_pet_performed_outcome`
  - Text term to describe the result of a fludeoxyglucose F 18 or computed tomography positron emission tomography scan. NCI CDE: 3151497
* [STRING]    `female_breast_feeding_or_pregnancy_status_indicator`
  - Text term to signify whether a woman is pregnant or nursing. NCI CDE: 3012573
* [STRING]    `standardized_uptake_value_cervix_uteri_assessment_measurement`
  - Numeric value that represents the standardized uptake of a positron emission tomography assessment measurement. NCI CDE: 3151615
* [STRING]    `pregnant_at_diagnosis`
  - A yes/no indicator that asks whether the patient was pregnant at diagnosis.
* [STRING]    `pregnancy_stillbirth_count`
  - Incidence of stillbirth as part of a woman's pregnancy history. NCI CDE: 2183304
* [STRING]    `patient_history_immune_system_and_related_disorders_text`
  - Free-text field to capture another name of immunosuppressive disease in the medical history of a patient that is not already specified or mentioned. NCI CDE: 3151449
* [STRING]    `patient_history_immune_system_and_related_disorders_name`
  - Text term to represent the name of immunosuppressive disease in the medical history of a patient. NCI CDE: 3151446
* [STRING]    `days_to_fdg_or_ct_pet_performed`
  - Time interval from the date of FDG-Positron Emission Tomography to the date of initial pathologic diagnosis, represented as a calculated number of days.
* [STRING]    `diagnostic_mri_result_outcome`
  - Text term to describe the result of a magnetic resonance imaging diagnostic procedure. NCI CDE: 3151441
* [STRING]    `radiation_therapy_1`
  - The yes/no indicator related to the administration of target radiation therapy NCI CDE: 3257225
* [STRING]    `radiation_therapy_not_administered_specify`
  - The free-text field to specify the reason radiation therapy was not administered or given. NCI CDE: 2733267
* [STRING]    `human_papillomavirus_laboratory_procedure_performed_name`
  - Text term to represent the name of the method of human papillomavirus testing. NCI CDE: 3151457
* [STRING]    `chemotherapy_negation_radiation_therapy_concurrent_administered_text`
  - Free-text field to capture another reason that is not already specified or mentioned for why concurrent chemotherapy was not given. NCI CDE: 3151824
* [STRING]    `lymph_node_location_positive_pathology_name`
  - Text term to represent the name of the location of the pathologically positive lymph node. NCI CDE: 3151519
* [STRING]    `keratinizing_squamous_cell_carcinoma_present_indicator`
  - Term relates to cell type describing degree of squamous differentiation. Keratinizing tumors have at least one well formed keratin pearl. All other patters are non-keratinizing. NCI CDE: 3151599
* [STRING]    `laboratory_procedure_tumor_marker_squamous_cell_carcinoma_antigen_result_value`
  - Numeric value to represent tumor marker Squamous Cell Carcinoma Antigen result. NCI CDE: 3151234
* [STRING]    `total_number_of_pregnancies`
  - Total number of pregnancies
* [STRING]    `hysterectomy_Performed_Ind_3`
  - The yes/no/unknown indicator that asks whether the patient had a hysterectomy. NCI CDE: 2001892
* [STRING]    `hysterectomy_performed_text`
  - Free-text field to capture another type of hysterectomy procedure performed that is not already specified or mentioned. NCI CDE: 3151506
* [STRING]    `human_papillomavirus_other_type_text`
  - Any of various papillomaviruses that infect the skin and mucous membranes of humans.sometimes progress to malignancy._Different than the one(s) previously specified or mentioned._Something distinguishable as an identifiable class based on common qualities._Text; the words of something written. NCI CDE: 3166168
* [STRING]    `hysterectomy_performed_type`
  - The type of hysterectomy being performed. NCI CDE: 2647164
* [STRING]    `lymphovascular_invasion_indicator`
  - Of or relating to the lymphatic vessels.:Local spread of a malignant neoplasm by infiltration or destruction of adjacent tissue; for epithelial neoplasms, invasion signifies infiltration beneath the epithelial basement membrane._Records whether dermal lymphatics invasion was present in the specimen under consideration. NCI CDE: 5543272
* [STRING]    `brachytherapy_first_reference_point_administered_total_dose`
  - Numeric value to represent the total dose in cGY of brachytherapy treatment given to the first reference point. NCI CDE: 3151100
* [STRING]    `brachytherapy_method_other_specify_text`
  - Free-text field to capture another type of brachytherapy treatment given that is not already specified or mentioned. NCI CDE: 3150976
* [STRING]    `lymph_node_location_positive_pathology_text`
  - Free-text field to capture another name of the location of the pathologically positive lymph node that is not already specified or mentioned. NCI CDE: 3151522
* [STRING]    `tumor_response_cdus_type`
  - The evaluation of tumor response by comparing the baseline tumor measurements to those taken after protocol intervention, per CDUS reporting requirements. NCI CDE: 2178525
* [STRING]    `brachytherapy_method_type`
  - The type of brachytherapy method used. NCI CDE: 2966127
* [STRING]    `agent_total_dose_count`
  - A total number of doses of a drug, vaccine or other agent administered to a patient. NCI CDE: 2180805
* [STRING]    `live_birth_number`
  - The number of live births the participant has experienced. NCI CDE: 2486644
* [STRING]    `human_papillomavirus_laboratory_procedure_performed_text`
  - Free-text field to capture another name for the method of human papillomavirus testing that is not already specified or mentioned. NCI CDE: 3151460
* [STRING]    `human_papillomavirus_type`
  - Text classification to represent the strain or type of human papillomavirus identified in an individual. NCI CDE: 2922649
* [STRING]    `performance_status_assessment_timepoint_category_other_text`
  - Text description of an 'other' performance status timing scale used in conjunction with a patient's therapy. NCI CDE: 3151756
* [STRING]    `ct_scan`
  - A Yes/No reponse to signify that a lesion or disease was seen on Computer Tomography (CT) scan. NCI CDE: 2004007
* [STRING]    `new_neoplasm_event_occurrence_anatomic_site`
  - New neoplasm event occurrence anatomic site
* [STRING]    `radiologic_tumor_width`
  - Numeric value for the width of the tumor reported on the computed tomography or magnetic resonance imaging immediately preceding the surgical resection. NCI CDE: 3528033
* [STRING]    `contiguous_organ_resection_site`
  - Text term to represent the name of the organ resected that was contiguous to the primary disease site.
* [STRING]    `radiologic_tumor_depth`
  - Numeric value for the depth of the tumor reported on the computed tomography or magnetic resonance imaging immediately preceding the surgical resection. NCI CDE: 3528032
* [STRING]    `radiologic_tumor_burden`
  - Numeric value of the sum of the maximum diameter of the primary tumor as reported on the computed tomography or magnetic resonance imaging at the time of the surgical resection. NCI CDE: 3532297
* [STRING]    `tumor_depth`
  - Text term for the degree to which a tumor has penetrated into organ or tissue. NCI CDE: 3808610
* [STRING]    `pathologic_tumor_width`
  - Numeric value for the width of the tumor as examined pathologically at the time of the surgical resection. NCI CDE: 3528041
* [STRING]    `tumor_multifocal`
  - Yes/no indicator to ask if the tumor is multifocal. NCI CDE: 64356
* [STRING]    `other_contiguous_organ_resection_site`
  - Touching or very close together. A part of the body that performs a specific function. For example, the heart is an organ. Removal or excision by surgical measures. Performed; carried out. A free text field used to describe a location of a position, site, or point in space where something can be found.
* [STRING]    `contiguous_organ_invaded`
  - Text indicator to signify whether or not the disease penetrated from the primary site to a contiguous site. NCI CDE: 3162817
* [STRING]    `pathologic_tumor_length`
  - Numeric value for the length of the tumor as examined pathologically at the time of the surgical resection. NCI CDE: 3528034
* [STRING]    `pathologic_tumor_depth`
  - Numeric value for the depth of the tumor as examined pathologically at the time of the surgical resection. NCI CDE: 3528040
* [STRING]    `pathologic_tumor_burden`
  - Numeric value of the sum of the maximum diameter of the new tumor as examined pathologically at the time of the surgical resection. NCI CDE: 3532298
* [STRING]    `radiologic_tumor_length`
  - Numeric value for the length of the tumor reported on the computed tomography or magnetic resonance imaging immediately preceding the surgical resection. NCI CDE: 3528021
* [STRING]    `tumor_total_necrosis_percent`
  - Text that represents the total amount of necrosis found in a sarcoma tumor. NCI CDE: 3300612
* [STRING]    `primary_tumor_lower_uterus_segment`
  - The original tumor._Lower; the bottom one of two._The hollow muscular organ in which the impregnated ovum is developed into the child; it is about 7.5 cm in length in the nonpregnant woman, and consists of a main portion (body) with an elongated lower part (neck), at the extremity of which is the opening (os). The upper rounded portion of the uterus, opposite the os, is the fundus, at each extremity of which is the horn marking the part where the uterine tube joins the uterus and through which the ovum reaches the uterine cavity after leaving the ovary. The organ is supported in the pelvic cavity by the broad ligaments, round ligaments, cardinal ligaments, and rectouterine and vesicouterine folds or ligaments. SYN metra, womb._One of the parts into which something naturally divides._An event, entity or condition that typically characterizes a prescribed environment or situation and determines or aids in determining whether certain stated circumstances exist or criteria are satisfied. NCI CDE: 2775554
* [STRING]    `days_to_well_differentiated_liposarcoma_resection`
  - Numeric value that represents the day that a resection of a well differentiated liposarcoma was performed.
* [STRING]    `metastatic_site_at_diagnosis_other`
  - Additional name of the organ site (single) within the body; may be referenced in primary site of disease, surgical intervention, or extent of disease documentation. NCI CDE: 2967298
* [STRING]    `metastatic_site_at_diagnosis`
  - Information related to established or verified identification by signs and symptoms of malignant tumor spread from an original (primary) site to another location in the body._Name of the organ site (single) within the body; may be referenced in primary site of disease, surgical intervention, or extent of disease documentation. NCI CDE: 2967298
* [STRING]    `ss18_ssx_testing_method`
  - Text term that represents the laboratory test method used to obtain the result of the laboratory test for the SS18-SSX fusion protein expression status for the synovial sarcoma. NCI CDE: 3733517
* [STRING]    `ss18_ssx_fusion_status`
  - Text term that represents the result of the laboratory test for the SS18-SSX fusion protein expression status for the synovial sarcoma. NCI CDE: 3733516
* [STRING]    `specific_tumor_total_necrosis_percent`
  - specific tumor total necrosis percent
* [STRING]    `leiomyosarcoma_histologic_subtype`
  - leiomyosarcoma histologic subtype
* [STRING]    `metastatic_neoplasm_confirmed`
  - Yes/no indicator to ask if identification of malignant tumor spread from an original (primary) site to another location in the body has been established or verified. NCI CDE: 65384
* [STRING]    `local_disease_recurrence`
  - Yes/no indicator to specify whether local recurrence of the disease has been detected. NCI CDE: 62652
* [STRING]    `days_to_well_differentiated_liposarcoma_primary_dx`
  - Numeric value that represents the day of the primary diagnosis of well differentiated liposarcoma.
* [STRING]    `mpnst_neurofibromatosis`
  - Mpnst neurofibromatosis
* [STRING]    `mpnst_exisiting_plexiform_neurofibroma`
  - Mpnst exisiting plexiform neurofibroma
* [STRING]    `mpnst_nf1_genetic_testing`
  - Mpnst nf1 genetic testing
* [STRING]    `mpnst_specific_mutations`
  - Mpnst specific mutations
* [STRING]    `well_differentiated_liposarcoma_primary_dx`
  - Time interval from the date of primary diagnosis of well differentiated liposarcoma to the date of initial pathologic diagnosis, represented as a calculated number of days.
* [STRING]    `leiomyosarcoma_major_vessel_involvement`
  - Text term to represent the category of major blood vessel involved in leiomyosarcoma. NCI CDE: 3243330
* [STRING]    `discontiguous_lesion_count`
  - An operation in which a term denies or inverts the meaning of another term or construction._Touching or very close together._(LEE-zhun) An area of abnormal tissue change._Quantity; how much there is of something that you can measure._the quantity of specified lesions. NCI CDE: 3162604
* [STRING]    `mpnst_neurofibromatosis_heredity`
  - Mpnst neurofibromatosis heredity
* [STRING]    `maximum_tumor_dimension`
  - Maximum tumor dimension
* [STRING]    `alcoholic_exposure_category`
  - Category to describe the patient's current level of alcohol use as self-reported by the patient. NCI CDE: 3457767
* [STRING]    `planned_surgery_status`
  - Indicator and/or text term to describe the intent to use a surgical procedure to treat the cancer. NCI CDE: 3440231
* [STRING]    `esophageal_tumor_involvement_site`
  - Text term that describes the portion of the esophagus divided in thirds in which the tumor involvement is located. NCI CDE: 3295806
* [STRING]    `esophageal_tumor_cental_location`
  - Text term that describes the portion of the esophagus divided in thirds in which the tumor is centered. NCI CDE: 3295805
* [STRING]    `lymph_node_metastasis_radiographic_evidence`
  - Indicator to signify whether or not radiographic evidence exists to support the finding of lymph node metastasis. NCI CDE: 3440228
* [STRING]    `days_to_pancreatitis_onset`
  - Numeric value to represent the day that the patient was diagnosed with clinical chronic pancreatitis.
* [STRING]    `days_to_diabetes_onset`
  - Numeric value to represent the day that the patient was diagnosed with diabetes.
* [STRING]    `adenocarcinoma_invasion`
  - Yes/No indicator about adenocarcinoma invasion.
* [STRING]    `surgery_performed_type`
  - The type of surgery performed.
* [STRING]    `columnar_metaplasia_present`
  - Indicator to signify whether or not esophageal columnar metaplasia is present. NCI CDE: 3440218
* [STRING]    `relative_cancer_type`
  - Text that describes which and how many of the patient's first degree relatives have been diagnosed with pancreatic cancer. NCI CDE: 3287339
* [STRING]    `amt_alcohol_consumption_per_day`
  - Numeric value that represents on the days when a person drank, on average, about how many drinks they had.
* [STRING]    `columnar_mucosa_goblet_cell_present`
  - Indicator to signify whether or not goblet cells were present in esophageal columnar mucosa. NCI CDE: 3440219
* [STRING]    `history_of_chronic_pancreatitis`
  - History of chronic pancreatitis
* [STRING]    `history_of_diabetes`
  - HIstory of diabetes
* [STRING]    `goblet_cells_present`
  - Goblet cells present
* [STRING]    `history_of_esophageal_cancer`
  - History of esophageal cancer
* [STRING]    `histologic_grading_tier_category`
  - Term to describe the number of levels or 'tiers' in the system used to describe the cellular histologic grade in a tissue specimen. NCI CDE: 3385981
* [STRING]    `columnar_mucosa_dysplasia`
  - Text term to describe the amount of dysplasia found within the benign esophageal columnar mucosa. NCI CDE: 3440917
* [STRING]    `number_of_relatives_diagnosed`
  - Number of relatives diagnosed with cancer
* [STRING]    `state_province_of_procurement`
  - State province of procurement
* [STRING]    `treatment_prior_to_surgery`
  - Text term to describe the kind of treatment given to an individual prior to surgery.
* [STRING]    `initial_diagnosis_by`
  - Initial diagnosis by
* [STRING]    `surgery_performed_type_other`
  - Surgery performed type other
* [STRING]    `country_of_birth`
  - The country in which a person was born
* [STRING]    `disease_detected_on_screening`
  - Disease detected on screening
* [STRING]    `history_pheo_or_para_include_benign`
  - History pheo or para include benign
* [STRING]    `outside_adrenal`
  - Text term to describe any tumor related to the specimen that is outside of the adrenal glands. NCI CDE: 3693063
* [STRING]    `history_pheo_or_para_anatomic_site`
  - Text field to describe the anatomic site of the prior pheochromocytoma or paraganglioma. NCI CDE: 3693062
* [STRING]    `family_member_relationship_type`
  - The subgroup that describes the state of connectedness between members of the unit of society organized around kinship ties. NCI CDE: 2690165
* [STRING]    `post_op_ablation_embolization_tx`
  - Post op ablation embolization tx
* [STRING]    `days_to_pre_orchi_serum_test`
  - Time interval in days from the date of the patient's initial pathologic diagnosis to the date that the pre-orchiectomy serum marker tests were obtained.
* [STRING]    `post_orchi_hcg`
  - Post orchi hcg
* [STRING]    `bilateral_diagnosis_timing_type`
  - Text term to describe the timing of the diagnosis of bilateral malignant testicular germ cell tumor. NCI CDE: 3901753
* [STRING]    `post_orchi_ldh`
  - Post orchi ldh
* [STRING]    `testis_tumor_microextent`
  - Testis tumor microextent
* [STRING]    `undescended_testis_corrected`
  - Text term to signify whether or not the undescended testis was corrected.
* [STRING]    `post_orchi_lh`
  - Post orchi lh
* [STRING]    `post_orchi_lymph_node_dissection`
  - Indicator that signifies whether or not the retroperitoneal lymph nodes were dissected after orchiectomy and if so, whether it was before or after chemotherapy was given. NCI CDE: 3953323
* [STRING]    `post_orchi_testosterone`
  - Numerical representation of the amount of testosterone in serum measured after orchiectomy. NCI CDE: 3901839
* [STRING]    `serum_markers`
  - Serum tumor markers (S)
* [STRING]    `undescended_testis_corrected_age`
  - Numeric and text description for the approximate age in months or years at which an individual had an undescended testis corrected.
* [STRING]    `undescended_testis_method_left`
  - Text term to describe the method by which the left undescended testis was corrected. NCI CDE: 4340449
* [STRING]    `relation_testicular_cancer`
  - Text term that describes an individual's relationship to a biological relative who has been diagnosed with malignant testicular germ cell tumor. NCI CDE: 3901751
* [STRING]    `postoperative_tx`
  - Name of postoperative treatment.
* [STRING]    `testis_tumor_macroextent`
  - Testis tumor macroextent
* [STRING]    `synchronous_tumor_histology_pct`
  - Synchronous tumor histology pct
* [STRING]    `pre_orchi_afp`
  - Pre orchi afp
* [STRING]    `pre_orchi_hcg`
  - Pre orchi hcg
* [STRING]    `pre_orchi_ldh`
  - Pre orchi ldh
* [STRING]    `pre_orchi_lh`
  - Prevorchi lh
* [STRING]    `pre_orchi_testosterone`
  - Pre orchi testosterone
* [STRING]    `synchronous_tumor_histology_type`
  - Synchronous tumor histology type
* [STRING]    `relative_family_cancer_hx_text`
  - Relative family cancer hx text
* [STRING]    `days_to_post_orchi_serum_test`
  - Numeric value to represent the day of the serum tumor markers after orchiectomy.
* [STRING]    `undescended_testis_method_right`
  - Text term to describe the method by which the right undescended testis was corrected. NCI CDE: 4340450
* [STRING]    `testis_tumor_macroextent_other`
  - Testis tumor macroextent other
* [STRING]    `days_to_bilateral_tumor_dx`
  - Time interval from the date of initial pathologic diagnosis to the date of bilateral testicular cancer diagnosis, represented as a calculated number of day
* [STRING]    `level_of_non_descent`
  - Level of non descent
* [STRING]    `post_orchi_afp`
  - Post orchi afp
* [STRING]    `intratubular_germ_cell_neoplasm`
  - Intratubular germ cell neoplasm
* [STRING]    `igcccg_stage`
  - Igcccg stage
* [STRING]    `history_of_undescended_testis`
  - History of undescended testis
* [STRING]    `molecular_test_result`
  - Term to describe an abnormal result of molecular analysis. NCI CDE: 3121628
* [STRING]    `history_hypospadias`
  - Text term to signify whether or not an individual has a history of a congenital abnormality in which the external urethral orifice is on the underside of the penis. NCI CDE: 3896751
* [STRING]    `history_fertility`
  - Text term to describe an individual's capacity to conceive or to induce conception. NCI CDE: 3896771
* [STRING]    `histological_percentage`
  - Text field to capture the numerical percentage for the confirmed histologic diagnosis of the submitted tumor, based on the pathology review. NCI CDE: 3729998
* [STRING]    `first_treatment_success`
  - First treatment success
* [STRING]    `family_history_testicular_cancer`
  - Yes/no indicator of family history of testicular cancer
* [STRING]    `family_history_other_cancer`
  - The yes/no indicator of family history of type of cancer of that is not already mentioned or specified in a list of values.
* [STRING]    `masaoka_stage`
  - Extent of the thymoma tumor using the Masaoka Staging system. NCI CDE: 3952848
* [STRING]    `history_myasthenia_gravis`
  - Indicator to signify whether or not the patient has a history of myasthenia gravis. NCI CDE: 3950458
* [STRING]    `section_myasthenia_gravis`
  - Section myasthenia gravis
* [STRING]    `new_neoplasm_occurrence_anatomic_site_text`
  - Text to describe the anatomic location of the return of tumor after treatment, at a specific distant metastatic location. NCI CDE: 3128033
* [STRING]    `percent_tumor_sarcomatoid`
  - Percent value of tumor that is sarcomatoid in renal cell carcinoma.
* [STRING]    `presence_of_sarcomatoid_features`
  - Presence of sarcomatoid features
* [STRING]    `tmem127`
  - tmem127
* [STRING]    `therapeutic_mitotane_lvl_recurrence`
  - Therapeutic mitotane lvl recurrence
* [STRING]    `therapeutic_mitotane_lvl_macroscopic_residual`
  - Therapeutic mitotane lvl macroscopic residual
* [STRING]    `therapeutic_mitotane_levels_achieved`
  - Therapeutic mitotane levels achieved
* [STRING]    `metastatic_neoplasm_initial_diagnosis_anatomic_site`
  - Metastatic neoplasm initial diagnosis anatomic site
* [STRING]    `mitoses_count`
  - Numeric representation of the mitoses count per 50 high power fields. NCI CDE: 3646391
* [STRING]    `mitotane_therapy`
  - Indicator to signify whether or not mitotane therapy was given. NCI CDE: 3646372
* [STRING]    `mitotane_therapy_adjuvant_setting`
  - Mitotane therapy adjuvant setting
* [STRING]    `mitotane_therapy_for_macroscopic_residual_disease`
  - Mitotane therapy for macroscopic residual disease
* [STRING]    `mitotic_rate`
  - The numeric response that indicates the rate measured for the number of mitoses identified under the microscope in malignant neoplasm. NCI CDE: 6941877
* [STRING]    `sinusoid_invasion`
  - Sinusoid invasion
* [STRING]    `therapeutic_mitotane_lvl_progression`
  - Therapeutic mitotane lvl progression
* [STRING]    `excess_adrenal_hormone_diagnosis_method_type`
  - Text term to describe the method by which the diagnosis of adrenal hormone excess was made. NCI CDE: 3646387
* [STRING]    `molecular_analysis_performed_indicator`
  - Text indicator to signify whether any molecular testing was performed for an individual. NCI CDE: 3121565
* [STRING]    `excess_adrenal_hormone_history_type`
  - Text term that represents the kind of adrenal hormone excess in the patient's history. NCI CDE: 3646386
* [STRING]    `necrosis`
  - The indication that the histologic feature of tumor necrosis is present. NCI CDE: 6790121
* [STRING]    `sdhd`
  - The text response indicating whether a mutation was identified while performing the SDHD gene mutation analysis. NCI CDE: 6790163
* [STRING]    `sdhc`
  - The text response indicating whether a mutation was identified while performing the SDHC gene mutation analysis. NCI CDE: 6790162
* [STRING]    `nuclear_grade_III_IV`
  - Nuclear grade III IV
* [STRING]    `sdhb`
  - The text response indicating whether a mutation was identified while performing the SDHB gene mutation analysis. NCI CDE: 6790161
* [STRING]    `sdhaf2_sdh5`
  - sdhaf2 sdh5
* [STRING]    `sdha`
  - The text response indicating whether a mutation was identified while performing the SDHA gene mutation analysis.
* [STRING]    `atypical_mitotic_figures`
  - Atypical mitotic figures
* [STRING]    `ct_scan_findings`
  - Text term to describe the result of a computed tomography diagnostic procedure.
* [STRING]    `ret`
  - RET Oncogene Mutation Status.
* [STRING]    `cytoplasm_presence_less_than_equal_25_percent`
  - Percentage expressing the quantity of cancer cells identified by dye applied to the cytoplasm of a cell during microscopic assessment of a tissue sample by a specialist in cellular function.
* [STRING]    `weiss_venous_invasion`
  - Weiss venous invasion
* [STRING]    `weiss_score`
  - Numeric value to represent the sum of the individual scores for each Weiss criterion assessment to determine the overall Weiss score. NCI CDE: 3648744
* [STRING]    `vhl`
  - The text response indicating whether a germ-line mutation was identified while performing the VHL gene mutation analysis. NCI CDE: 6790146
* [STRING]    `invasion_of_tumor_capsule`
  - Invasion of tumor capsule
* [STRING]    `diffuse_architecture`
  - Diffuse architecture
* [STRING]    `serum_mesothelin_lower_limit`
  - Numerical quantity measured that is the bottom value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for serum mesothelin result. NCI CDE: 3629986
* [STRING]    `asbestos_exposure_type`
  - Text term that describes a kind of exposure to asbestos. NCI CDE: 3629989
* [STRING]    `pleurodesis_performed_90_days`
  - Indicator to signify whether or not pleurodesis was performed 90 days prior to cancer sample procurement. NCI CDE: 3646080
* [STRING]    `mesothelioma_detection_method`
  - Mesothelioma detection method
* [STRING]    `history_asbestos_exposure`
  - History asbestos exposure
* [STRING]    `pleurodesis_performed_prior`
  - Indicator to signify whether or not pleurodesis was performed prior to cancer sample procurement. NCI CDE: 3646078
* [STRING]    `family_history_cancer_type`
  - Text that describes which and how many of the patient's first degree relatives have been diagnosed with cancer.
* [STRING]    `family_history_cancer_type_other`
  - Text that describes which and how many of the patient's first degree relatives have been diagnosed with another cancer that is not already mentioned or specified. NCI CDE: 3287343
* [STRING]    `asbestos_exposure_age`
  - Numeric representation of the age of a person when they were first exposed to asbestos. NCI CDE: 3629991
* [STRING]    `serum_mesothelin_prior_tx`
  - Serum mesothelin prior tx
* [STRING]    `asbestos_exposure_years`
  - Numeric representation of the length of time in years that a person was exposured to asbestos. NCI CDE: 3629992
* [STRING]    `serum_mesothelin_upper_limit`
  - Numerical quantity measured that is the highest value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for serum mesothelin result. NCI CDE: 3629987
* [STRING]    `asbestos_exposure_source`
  - Text term that describes the origination of an initial exposure to asbestos. NCI CDE: 3629990
* [STRING]    `suv_of_pleura_max`
  - suv of pleura max
* [STRING]    `primary_occupation`
  - Primary occupation of the participant for most of their adult employment. NCI CDE: 5714
* [STRING]    `primary_occupation_years_worked`
  - Primary occupation years worked
* [STRING]    `primary_occupation_other`
  - Primary occupation other
* [STRING]    `creatinine_norm_range_lower`
  - Laboratory procedure creatinine result lower limit of normal value
* [STRING]    `creatinine_norm_range_upper`
  - Laboratory procedure creatinine result upper limit of normal value
* [STRING]    `asbestos_exposure_age_last`
  - Numeric representation of the age of a person when they experienced the final exposure to asbestos. NCI CDE: 3629993
* [STRING]    `creatinine_prior_tx`
  - Creatinine prior tx
* [STRING]    `tumor_basal_diameter`
  - Numeric value in millimeters for the lowest layer of a tumor. NCI CDE: 3870453
* [STRING]    `tumor_basal_diameter_mx`
  - Numeric value in millimeters for the lowest layer of a tumor.
* [STRING]    `metastatic_site`
  - Text term that describes the anatomic site of the metastatic disease.
* [STRING]    `tumor_thickness`
  - Tumor thickness value
* [STRING]    `microvascular_density_mvd`
  - Numeric representation of the microvascular density (MVD) of the tissue specimen. NCI CDE: 3874272
* [STRING]    `tumor_shape_pathologic_clinical`
  - Text term to represent the description of the shape of a tumor determined by clinical or pathological techniques.
* [STRING]    `tumor_infiltrating_lymphocytes`
  - Description of degree of lymphocytic infiltration surrounding and disrupting tumor cells of the vertical growth phase in a cutaneous melanoma. NCI CDE: 2431591
* [STRING]    `tumor_morphology_percentage`
  - Numerical percentage range for the confirmed histologic diagnosis of the submitted tumor, based on the pathology review.
* [STRING]    `tumor_thickness_measurement`
  - Text term that represents the technique used to measure the tumor thickness. NCI CDE: 3870440
* [STRING]    `tumor_infiltrating_macrophages`
  - Text term that describes the qualitative amount of non-neoplastic macrophages that infiltrate a tumor. NCI CDE: 3874291
* [STRING]    `pet_ct_standardized_values`
  - Standarized values of the PET/CT Exam.
* [STRING]    `eye_color`
  - Text term that represents the color of an individual's eyes. NCI CDE: 3870394
* [STRING]    `other_metastatic_site`
  - Text term to signify the presence of anatomic sites of metastatic disease that are different than the one(s) previously specified or mentioned [Manually-curated] NCI CDE: 2760050
* [STRING]    `extravascular_matrix_patterns`
  - Extravascular matrix patterns
* [STRING]    `histological_type_1`
  - Histological type 1
* [STRING]    `extranocular_nodule_size`
  - Extranocular nodule size
* [STRING]    `extrascleral_extension`
  - Indicator to signify whether or not the uveal melanoma has spread beyond the sclera. NCI CDE: 3874292
* [STRING]    `gene_expression_profile`
  - Text term that represents the class designation resulting from gene expression profiling. NCI CDE: 3870395
* [STRING]    `cytogenetic_abnormality`
  - An irregularity in the number or structure of chromosomes, usually in the form of a gain (duplication), loss (deletion), exchange (translocation), or alteration in sequence (inversion) of genetic material._The investigation, analysis and recognition of the presence and nature of disease, condition, or injury from expressed signs and symptoms; also, the scientific determination of any kind; the concise results of such an investigation._Indicator of Yes, No, Unknown, Not Done, or Not Applicable to a question.[manually curated] NCI CDE: 2760479
* [STRING]    `result_of_immunophenotypic_analysis`
  - Result of immunophenotypic analysis
* [STRING]    `prior_immunosuppressive_therapy_other`
  - Prior immunosuppressive therapy other
* [STRING]    `prior_immunosuppressive_therapy_type`
  - Text term to describe the immunosuppressive therapy used to treat a patient's prior immunological disease. NCI CDE: 3233638
* [STRING]    `prior_infectious_disease`
  - Text term used to identify a patient's prior history of relevant infectious diseases. NCI CDE: 3233642
* [STRING]    `igk_genotype_results_1`
  - Text term to define the results of IgK genotype testing. NCI CDE: 3233565
* [STRING]    `immunophenotypic_analysis_method`
  - The method used for immunophenotyping._to perform immunophenotype tests on pathology samples. NCI CDE: 64540
* [STRING]    `igk_genotype_results`
  - igk genotype results
* [STRING]    `bone_marrow_biopsy_done`
  - Yes/no indicator to ask if a bone marrow biopsy procedure was performed.
* [STRING]    `bone_marrow_involvement`
  - Yes/no/unknown/not available indicator related to involvement of the patient's bone marrow by disease. NCI CDE: 3296100
* [STRING]    `bone_marrow_involvement_1`
  - Yes/no indicator to ask if the bone marrow has been affected by the patient's disease. NCI CDE: 2180550
* [STRING]    `prior_infectious_disease_other`
  - Text to describe a patient's other prior history of relevant infectious diseases not specified elsewhere. NCI CDE: 3233643
* [STRING]    `ebv_positive_malignant_cells_percent`
  - Numeric value to represent the percentage of EBV positive malignant cells. NCI CDE: 3233649
* [STRING]    `b_lymphocyte_genotyping_method_1`
  - The method used to perform B-Cell genotyping. NCI CDE: 3233449
* [STRING]    `prior_immunologic_disease_type`
  - Text term describing a patient's prior medical history as related to immunological diseases. NCI CDE: 3233628
* [STRING]    `igh_genotype_results_1`
  - Text term to define the results of IgH genotype testing. NCI CDE: 3233560
* [STRING]    `b_lymphocyte_genotyping_method`
  - The method used to perform B-Cell genotyping. NCI CDE: 3233449
* [STRING]    `prior_immunologic_disease_other`
  - Text to describe a patient's other prior medical history as related to immunological diseases not already specified or mentioned. NCI CDE: 3233629
* [STRING]    `maximum_tumor_bulk_anatomic_location`
  - Text description to represent the anatomic location (nodal or extranodal) of the maximum tumor bulk. NCI CDE: 3233300
* [STRING]    `immunophenotypic_analysis_results`
  - Text term to define the results of immunophenotypic analysis. NCI CDE: 3234626
* [STRING]    `maximum_tumor_bulk_anatomic_site`
  - Text term to represent the anatomic location (including nodal or extranodal site) of the maximum tumor bulk. NCI CDE: 3639616
* [STRING]    `immunophenotypic_analysis_test`
  - Immunophenotypic analysis test
* [STRING]    `extranodal_sites_involvement_number`
  - Numeric value to represent the number of extranodal sites involved clinically and/or pathologically with malignant lymphoma at the time of initial diagnosis. NCI CDE: 3233242
* [STRING]    `immunophenotypic_analysis_tested`
  - Immunophenotypic analysis tested indicator.
* [STRING]    `ebv_status_malignant_cells_method`
  - The method used to perform diagnostic testing for the presence of EBV positive malignant cells. NCI CDE: 3233656
* [STRING]    `percent_ebv_positive_malignant_cells`
  - Numeric value to represent the percentage of EBV positive malignant cells.
* [STRING]    `tumor_resected_max_dimension`
  - Tumor resected maximum dimension.
* [STRING]    `immunophenotypic_analysis_methodology`
  - immunophenotypic analysis methodology
* [STRING]    `igh_genotype_results`
  - igh genotype results
* [STRING]    `ebv_diagnostic_methodology`
  - ebv diagnostic methodology
* [STRING]    `follicular_component_percent`
  - Percentage of follicular component.
* [STRING]    `abnormality_tested_methodology`
  - Methodology of cytogenetic abnormality test, examples: gain, loss, translocation, etc.
* [STRING]    `nodal_anatomic_site`
  - Nodal anatomic site
* [STRING]    `histology_of_bone_marrow_sample`
  - Histology of bone marrow sample
* [STRING]    `abnormality_tested_methodology_1`
  - Methodology of cytogenetic abnormality test, examples: gain, loss, translocation, etc.
* [STRING]    `ldh_upper_limit`
  - ldh upper limit
* [STRING]    `number_of_involved_extranodal_sites`
  - Numeric value to represent the number of extranodal sites involved clinically and/or pathologically with malignant lymphoma at the time of initial diagnosis.
* [STRING]    `extranodal_disease_involvement_site`
  - Description of the anatomic location of extranodal disease involvement at the time of initial diagnosis of malignant lymphoma. NCI CDE: 3288482
* [STRING]    `ebv_antibody_status`
  - The result of a test to detect the presence of Epstein-Barr virus antibody in a patient. NCI CDE: 2003961
* [STRING]    `extranodal_disease_involvement_site_other`
  - Extranodal disease involvement site other
* [STRING]    `genetic_abnormality_tested_other`
  - Text term to identify other genetic abnormalities not otherwise specified for which a patient was tested. NCI CDE: 3234685
* [STRING]    `genetic_abnormality_tested_1`
  - Text term to identify specific genetic abnormalities for which a patient was tested. NCI CDE: 3234675
* [STRING]    `genetic_abnormality_tested`
  - Genetic abnormality tested
* [STRING]    `genetic_abnormality_results_other`
  - Text term that describes a genetic abnormality test result that was not previously mentioned or specified. NCI CDE: 4459354
* [STRING]    `genetic_abnormality_results`
  - Text term to define the results of genetic testing. NCI CDE: 3234680
* [STRING]    `percentage_of_follicular_component`
  - Numeric value to represent the percentage of the follicular component within the diffuse large B-cell lymphoma.
* [STRING]    `pet_scan_results`
  - PET scan results.
* [STRING]    `other_genetic_abnormality_tested`
  - Text term to identify other genetic abnormalities not otherwise specified for which a patient was tested.
* [STRING]    `epstein_barr_viral_status`
  - A finding based on the viral load assay of the Epstein-Barr virus which may be an indicator of disease status. NCI CDE: 7062938
* [STRING]    `lymph_node_involvement_site`
  - Free text field to identify the lymph nodes which are anatomic sites of disease. NCI CDE: 61293
* [STRING]    `mib1_positive_percentage_range`
  - Numeric value to represent the percentage range of MIB-1 positive cells thru immunophenotypic analysis. NCI CDE: 3233414
* [STRING]    `mib1_positive_percentage_range_1`
  - Numeric value to represent the percentage range of MIB-1 positive cells thru immunophenotypic analysis. NCI CDE: 3233414
* [STRING]    `genetic_abnormality_method_other`
  - Text term that describes a genetic abnormality test method that was not previously mentioned or specified. NCI CDE: 4459355
* [STRING]    `extranodal_involvment_site_other`
  - Name of other anatomic site of extranodal disease.
* [STRING]    `ldh_lab_value`
  - ldh lab value
* [STRING]    `hiv_positive_status`
  - HIV positive status
* [STRING]    `ldh_level`
  - Information related to the result of the medical procedure that involves testing a sample of blood for lactic dehydrogenase, a family of homotetrameric cytoplasmic enzymes involved in the conversion of L-lactate and NAD to pyruvate and NADH in the final step of anaerobic glycolysis._A position on a scale measuring intensity, quality, or amount._A family of homotetrameric cytoplasmic enzymes involved in the conversion of L-lactate and NAD to pyruvate and NADH in the final step of anaerobic glycolysis. In vertebrates, genes for three different subunits (LDH-A, LDH-B and LDH-C) exist. NCI CDE: 6323378
* [STRING]    `ldh_norm_range_upper`
  - The top value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for lactate dehydrogenase (units not specified). NCI CDE: 2597015
* [STRING]    `abnormality_tested_results_1`
  - Results of cytogenetic abnormality test, examples: gain, loss, translocation, etc.
* [STRING]    `abnormality_tested_results`
  - Results of cytogenetic abnormality test, examples: gain, loss, translocation, etc.
* [STRING]    `genetic_abnormality_method`
  - Text term to classify the testing method used to determine the genetic abnormality. NCI CDE: 3234684
* [STRING]    `bone_marrow_sample_histology`
  - Bone marrow sample histology.
* [STRING]    `albumin_result_upper_limit`
  - Numeric laboratory value representing the upper level of the normal range of values for Albumin in peripheral blood serum. NCI CDE: 2004086
* [STRING]    `vascular_tumor_cell_type`
  - Text term that represents the type of vascular tumor invasion. NCI CDE: 3168001
* [STRING]    `albumin_result_lower_limit`
  - Numeric laboratory value representing the lower level of the normal range of values for Albumin in peripheral blood serum used to comparatively reference the patient's lab result NCI CDE: 2004085
* [STRING]    `albumin_result_specified_value`
  - Value of a lab test used to determine the albumin level in the blood. NCI CDE: 58274
* [STRING]    `platelet_result_upper_limit`
  - Top value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for peripheral platelet count laboratory result or other quantitative parameter (units not specified). NCI CDE: 2596499
* [STRING]    `intern_norm_ratio_upper_limit`
  - Upper limit of normal of the International Normalization Ratio value. NCI CDE: 2190394
* [STRING]    `cholangitis_tissue_evidence`
  - Text term to describe the kind of evidence present in adjacent tissue related to primary sclerosing cholangitis (PSC). NCI CDE: 3916091
* [STRING]    `relative_family_cancer_history`
  - Yes/no/unknown indicator that asks whether any blood relatives have ever been diagnosed with cancer. NCI CDE: 2691192
* [STRING]    `platelet_result_lower_limit`
  - The lower limit of normal for peripheral platelet laboratory value. NCI CDE: 2003885
* [STRING]    `hist_hepato_carcinoma_risk`
  - Text term to represent the name of the primary condition that increases a person's chance of developing a malignant tumor of the hepatocytes
* [STRING]    `hist_hepato_carc_fact`
  - Text term to represent the name of the primary condition that increases a person's chance of developing a malignant tumor of the hepatocytes. NCI CDE: 3171846
* [STRING]    `cancer_first_degree_relative`
  - Numeric value that represents the number of first degree relatives (parent, sibling, and/or child) diagnosed with cancer. NCI CDE: 3171640
* [STRING]    `creatinine_lower_level`
  - Lowest value of the range of statistical characteristics that are supposed to represent accepted standard for patient's sample of blood for creatinine, the breakdown product of creatine, a constituent of muscle tissue, that is excreted by the kidney and whose serum level is used to evaluate kidney function.
* [STRING]    `prothrombin_time_result_value`
  - Numeric laboratory value of the prothrombin coagulation time in peripheral blood. NCI CDE: 2459694
* [STRING]    `ca_19_9_level_upper`
  - The number that represents the reported high limit of the cancer antigen 19-9 test reference range.
* [STRING]    `ca_19_9_level_lower`
  - The number that represents the reported low limit of the cancer antigen 19-9 test reference range.
* [STRING]    `ca_19_9_level`
  - CA 19-9 level in the blood.
* [STRING]    `creatinine_upper_limit`
  - Numeric laboratory value representing the upper level of the normal range of values for Creatinine in peripheral blood serum. NCI CDE: 2004064
* [STRING]    `surgical_procedure_name`
  - The name of surgical procedure. NCI CDE: 7063813
* [STRING]    `creatinine_value_in_mg_dl`
  - A value which captures the amount of Creatinine in the blood measured in milligrams per deciliter (mg/dL)
* [STRING]    `bilirubin_lower_limit`
  - Value, units of measure not specified, of the lowest value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for particular laboratory result related to testing a sample of blood for direct bilirubin, bilirubin which reacts with sulfanilic acid at acidic pH to produce a red colored complex and is bound to glucuronide to form conjugated bilirubin (direct bilirubin) and is measured a colorimetric method. NCI CDE: 3294386
* [STRING]    `total_bilirubin_upper_limit`
  - Numeric laboratory value (units not specified) for the procedure that involves testing or manipulating a sample of blood in a laboratory setting for total bilirubin, a breakdown product of hemoglobin, liver lab. NCI CDE: 2004060
* [STRING]    `platelet_result_count`
  - The absolute platelet count.
* [STRING]    `fibrosis_ishak_score`
  - The score or group of scores as described by Dr. Kamal G. Ishak and colleagues to assess the histopathologic degree of liver damage. NCI CDE: 3182621
* [STRING]    `fetoprotein_outcome_value`
  - Numerical quantity measured for a laboratory result for alpha fetoprotein derived from cerebrospinal fluid. NCI CDE: 3385649
* [STRING]    `fetoprotein_outcome_upper_limit`
  - Numerical quantity measured that is the top value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for particular laboratory result or other quantitative parameter for alpha fetoprotein (a protein normally produced by a developing fetus). NCI CDE: 2932064
* [STRING]    `fetoprotein_outcome_lower_limit`
  - Numerical quantity measured that is the bottom value of the range of statistical characteristics that are supposed to represent accepted standard, non-pathological pattern for particular laboratory result or other quantitative parameter for alpha fetoprotein (a protein normally produced by a developing fetus). NCI CDE: 3171861
* [STRING]    `inter_norm_ratio_lower_limit`
  - Lower limit of normal of the International Normalization Ratio value. NCI CDE: 2799755
* [STRING]    `family_cancer_type_txt`
  - The  type of family relative that has a history of cancer.
* [STRING]    `bilirubin_upper_limit`
  - Numeric laboratory value representing the upper level of the normal range of values for direct bilirubin, a breakdown product of hemoglobin. NCI CDE: 3233756
* [STRING]    `days_to_last_known_alive`
  - Numeric value to represent the day of which the patient's survival status of alive could be verified.

