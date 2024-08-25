# `isb-cgc.TCGA_bioclin_v0.Clinical.md`

## Column details

* [STRING]    `program_name`
  - Program Name, always TCGA (The Cancer Genome Atlas) in this table.
* [STRING]    `case_barcode`
  - TCGA patient/case barcode; e.g. TCGA-06-0119
* [STRING]    `case_gdc_id`
  - GDC unique identifer for this case; e.g. 7b4ce492-ff40-4bf1-b3e8-75ff83e8746d. This identifier can be used to find more information at the GDC Data Portal ( https://portal.gdc.cancer.gov/cases/7b4ce492-ff40-4bf1-b3e8-75ff83e8746d )
* [STRING]    `program_dbgap_accession_number`
  - Program dbGaP accession number, eg phs000178
* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; e.g. TCGA-OV, etc.
* [STRING]    `project_name`
  - Project Name; frequently the same as or similar to the project disease type eg   Acute Lymphoblastic Leukemia - Phase II   or   Breast Invasive Carcinoma   etc
* [STRING]    `disease_code`
  - A code representing the type of cancer. Values can be found at https://gdc.cancer.gov/resources-TCGA-users/TCGA-code-tables/TCGA-study-abbreviations; e.g. OV, GBM, LUAD
* [STRING]    `gender`
  - Participant gender; e.g. Male, Female
* [STRING]    `vital_status`
  - Survival state of the participant; e.g. dead, alive
* [STRING]    `race`
  - The race of a participant, independent from ethnicity; e.g. White, Black or African American, Asian, Native Hawaiian or other Pacific Islander, American Indian or Alaska Native
* [STRING]    `ethnicity`
  - The ethnic origination of a participant, independent from race; e.g. Not Hispanic or Latino, Hispanic or Latino
* [INT64]    `age_at_diagnosis`
  - Age, in years, at which a condition or disease was first diagnosed
* [INT64]    `days_to_birth`
  - Days since birth (a negative value, relative to the date of diagnosis which is considered to be t=0)
* [INT64]    `days_to_death`
  - If vital_status indicates 'dead', then this is the number of days to death (a positive value) relative to the date of diagnosis.
* [INT64]    `days_to_initial_pathologic_diagnosis`
  - The number of days to initial pathologic diagnosis
* [INT64]    `days_to_last_followup`
  - If vital_status indicates 'alive', then this is the number of days from the date of diagnosis to the last followup (communication contact).
* [INT64]    `days_to_last_known_alive`
  - Number of days from the date of diagnosis to the last day on which a person was known to be alive. This field is a combination of the days_to_last_followup and days_to death fields. Therefore, this field can be used whether the vital_status is 'alive' or 'dead'.
* [INT64]    `days_to_submitted_specimen_dx`
  - Numeric value to represent the day of the diagnosis for the submitted sample.
* [STRING]    `clinical_stage`
  - The stage of the cancer, based on results of tests done before surgery, such as physical exams and imaging scans; e.g. Stage I, Stage II, Stage III, Stage IV
* [STRING]    `clinical_T`
  - The clinical T score is a rating of the extent of the primary tumor, based on results of tests done before surgery, such as physical exams and imaging scans; e.g. T1, T2, T3, T4
* [STRING]    `clinical_N`
  - The clinical N score is a rating of the extent of cancer within nearby lymph nodes, based on results of tests done before surgery, such as physical exams and imaging scans; e.g. N1, N2, N3
* [STRING]    `clinical_M`
  - The clinical M score is a rating of metastasis, that is, how much cancer has spread to distant sites. It is based on results of tests done before surgery, such as physical exams and imaging scans; e.g. MX, M0, M1
* [STRING]    `pathologic_stage`
  - The stage of the cancer, based on surgery or biopsy; e.g. Stage I, Stage II, Stage III, Stage IV
* [STRING]    `pathologic_T`
  - The pathologic T score is a rating of the extent of the primary tumor, based on surgery or biopsy; e.g. T1, T2, T3, T4
* [STRING]    `pathologic_N`
  - The pathologic N score is a rating of the extent of cancer within nearby lymph nodes, based on surgery or biopsy; e.g. N1, N2, N3
* [STRING]    `pathologic_M`
  - The pathologic M score is a rating of metastasis, that is, how much cancer has spread to distant sites. It is based on surgery or biopsy; e.g. MX, M0, M1
* [INT64]    `year_of_initial_pathologic_diagnosis`
  - Four digit year of the initial pathologic diagnosis
* [STRING]    `tumor_tissue_site`
  - The location on the body where the tumor exists; e.g. Brain, Ovary, Lung, etc.
* [STRING]    `primary_neoplasm_melanoma_dx`
  - Indicates whether a person had a primary diagnosis of melanoma; e.g. Yes, No
* [STRING]    `anatomic_neoplasm_subdivision`
  - The spatial location, subdivisions and/or atomic site name of a tumor; e.g. Rectum, Larynx, Tonsil, etc.
* [STRING]    `country`
  - Country of the participant; e.g. Germany, United States, Canada, etc.
* [STRING]    `other_dx`
  - Indicator and type of other diagnosis; e.g. No; Yes, History of Prior Malignancy; Yes, History of Synchronous/Bilateral Malignancy; Both History of Synchronous/Bilateral and Prior Malignancy
* [STRING]    `other_malignancy_anatomic_site`
  - The site on the body where the other malignancy occurred; e.g. Bladder, Uterus, etc.
* [STRING]    `other_malignancy_type`
  - Indicates whether another malignancy occurred before or at the same time; e.g. Prior Malignancy, Synchronous Malignancy
* [STRING]    `other_malignancy_histological_type`
  - The histological type of cancer of the other malignancy; e.g. Adenosquamous, Astrocytoma, etc.
* [STRING]    `history_of_neoadjuvant_treatment`
  - Describes the patient's history of neoadjuvant treatment and the kind of treament given prior to resection of the tumor; e.g. Yes, Pharmaceutical Treatment Prior to Resection, etc.
* [STRING]    `primary_therapy_outcome_success`
  - Kind of outcome achieved after the completion of the initial course of treatment; e.g. Complete Remission/Response, Progressive Disease, etc.
* [STRING]    `histological_type`
  - The histological type of cancer; e.g. Adenosquamous, Astrocytoma, etc.
* [STRING]    `neoplasm_histologic_grade`
  - Rating which expresses the degree of abnormality of cancer cells, a measure of differentiation and aggressiveness; e.g. G1, G2, G3, G4
* [STRING]    `icd_10`
  - Alphanumeric value used to describe the disease code from the tenth version of the International Classification of Disease (ICD-10)
* [STRING]    `icd_o_3_site`
  - Code that represents the site of the disease using the third edition of the International Classification of Diseases for Oncology, published in 2000, used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms
* [STRING]    `icd_o_3_histology`
  - Code that represents the histology of the disease using the third edition of the International Classification of Diseases for Oncology, published in 2000, used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms
* [STRING]    `person_neoplasm_cancer_status`
  - The participant's cancer status; e.g. With Tumor, Tumor Free
* [STRING]    `residual_tumor`
  - Status of the tissue margin following surgical resection; e.g. R0, R1, R2, RX
* [STRING]    `tumor_type`
  - Tumor Type; e.g. Primary, Type 1, Type 2
* [STRING]    `new_tumor_event_after_initial_treatment`
  - Indicates whether a patient has had a new tumor event after initial treatment; Yes, No
* [STRING]    `lymphnodes_examined`
  - Indicator whether the lymph nodes were examined; e.g. Yes, No
* [INT64]    `number_of_lymphnodes_examined`
  - The number of lymph nodes examined
* [INT64]    `number_of_lymphnodes_positive_by_he`
  - The number of lymph nodes involved with disease as determined by histological examination
* [STRING]    `lymphatic_invasion`
  - Indicator if small or thin-walled vessel invasion is present, indicating lymphatic involvement; e.g. Yes, No
* [STRING]    `venous_invasion`
  - Indicator if large vessel or venous invasion was detected by surgery or presence in a tumor specimen; e.g. Yes, No
* [STRING]    `lymphovascular_invasion_present`
  - Indicator if  invasion of a cancer to the blood vessels and/or lymphatics invasion is present; e.g. Yes, No
* [STRING]    `bcr`
  - Biospecimen Core Resource; e.g. Nationwide Children's Hospital, Washington University
* [INT64]    `batch_number`
  - The BCR Batch Code; see https://gdc.cancer.gov/resources-TCGA-users/TCGA-code-tables/bcr-batch-codes for explanation of the codes
* [STRING]    `tss_code`
  - Tissue Source Site Code; see https://gdc.cancer.gov/resources-TCGA-users/TCGA-code-tables/tissue-source-site-codes for explanation of codes
* [INT64]    `age_began_smoking_in_years`
  - Age, in years, that the participant began smoking
* [INT64]    `year_of_tobacco_smoking_onset`
  - Four-digit year that the participant started smoking; e.g. 2010
* [INT64]    `stopped_smoking_year`
  - Four-digit year that the participant stopped smoking; e.g. 2010
* [INT64]    `tobacco_smoking_history`
  - Category describing current smoking status and smoking history as self-reported by a participant.; e.g. 1, 2, etc.
* [FLOAT64]    `number_pack_years_smoked`
  - The number of packs smoked per day times the number of years smoked by the participant
* [FLOAT64]    `height`
  - Height of participant in centimeters
* [FLOAT64]    `weight`
  - Weight of participant in kilograms
* [FLOAT64]    `bmi`
  - Body Mass Index of participant
* [STRING]    `mononucleotide_and_dinucleotide_marker_panel_analysis_status`
  - Status of the mononucleotide and dinucleotide marker panel analysis; microsatellite-stable (MSS), low level MSI (MSI-L) if less than 40% of markers were altered and high level MSI (MSI-H) if greater than 40% of markers were altered
* [STRING]    `menopause_status`
  - A female participant's menopausal status; e.g. Post, Pre, Indeterminate, Peri
* [STRING]    `pregnancies`
  - The number of times (including currently if it applies) that a female participant has been pregnant, regardless of outcome.
* [STRING]    `hpv_status`
  - Indicates whether the participant has a record of a positive finding for human papillomavirus; e.g. Positive, Negative, Indeterminate
* [STRING]    `hpv_calls`
  - HPV strains; e.g. HPV18, HPV45, etc.
* [STRING]    `h_pylori_infection`
  - Indicator of previous or current diagnosis of Helicobactor pylori infection; e.g. Yes, No, Never, Current
* [INT64]    `gleason_score_combined`
  - The Gleason Score (ranging from 1 -5) is the grade of the aggressiveness of prostate cancer. The combined Gleason Score is the primary Gleason score  (for the largest area of the tumor) added to the secondary Gleason Score (for the next largest section of the tumor).
* [FLOAT64]    `psa_value`
  - A male participant's Prostrate-Specific Antigen (PSA) value
* [STRING]    `colorectal_cancer`
  - Indicates whether the participant has colorectal cancer; e.g. Yes, No
* [STRING]    `history_of_colon_polyps`
  - Indicator if the participant had a previous history of colon polyps as noted in the history/physical or previous endoscopic report(s); e.g. Yes, No

