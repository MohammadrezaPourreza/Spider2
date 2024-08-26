# `isb-cgc-bq.HTAN_versioned.srrs_clinical_tier2_r5.md`

## Column details

* [STRING]    `Days_to_Progression`
  - Number of days between the date used for index and the date the patient's disease progressed. If not applicable please enter 'Not Applicable'
* [STRING]    `Last_Known_Disease_Status`
  - Text term that describes the last known state or condition of an individual's neoplasm.
* [STRING]    `Days_to_Last_Known_Disease_Status`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days. If not applicable please enter 'Not Applicable'
* [STRING]    `Year_of_Death`
  - Numeric value to represent the year of the death of an individual.
* [STRING]    `Progression_or_Recurrence_Type`
  - The text term used to describe the type of progressive or recurrent disease or relapsed disease.
* [STRING]    `Progression_or_Recurrence`
  - Yes/No/unknown indicator to identify whether a patient has had a new tumor event after initial treatment.
* [STRING]    `Cancer_Incidence_Location`
  - The county and state in which the patient lives and to which the cancer_incidence data correlates. Record as "County, State" as they appear in the incidence box from which the cancer_incidence data is obtained in the https://gis.cancer.gov/canceratlas/tableview/ website
* [STRING]    `Morphology`
  - The third edition of the International Classification of Diseases for Oncology, published in 2000 used principally in tumor and cancer registries for coding the site (topography) and the histology (morphology) of neoplasms. The study of the structure of the cells and their arrangement to constitute tissues and, finally, the association among these to form organs. In pathology, the microscopic process of identifying normal and abnormal morphologic characteristics in tissues, by employing various cytochemical and immunocytochemical stains. A system of numbered categories for representation of data.
* [STRING]    `Days_to_Progression_Free`
  - Number of days between the date used for index and the date the patient's disease was formally confirmed as progression-free. If not applicable please enter 'Not Applicable'
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Race`
  - An arbitrary classification of a taxonomic group that is a division of a species. It usually arises as a consequence of geographical isolation withina a species and is characterized by shared heredity, physical attributes and behavior, and in the case of humans, by common history, nationality, or geographic distribution.
* [STRING]    `Site_of_Resection_or_Biopsy`
  - The text term used to describe the anatomic site of the resection or biopsy of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [STRING]    `Stop_Days_from_Index`
  - Number of days from the date of birth (index date) to the end date of the event (e.g. exposure to environmental factor, treatment start, etc.). Note: if the event occurs at a single time point, e.g. a diagnosis or a lab test, the values for this column is 'Not Applicable'
* [STRING]    `NCI_Atlas_Cancer_Site`
  - The primary tumor site used to calculate the incidence rate using the NCI Cancer Atlas, a digital atlas which provides geographical data related to cancer utilizing the Surveillance, Epidemiology, and End Results (SEER) Program cancer incidence rates for 2013 to 2017
* [STRING]    `Cancer_Incidence`
  - Incidence of specific cancer type in a defined area (a number between 0 and 100). The rate of incident cases per population of 100,000 persons of a specific type of cancer as designated in the "primary_diagnosis" data element in the county where the patient resides, using the most recent 2013-2017 NCI Cancer Atlas derived data.  Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/. Enter the zip code in the main text field and use the asociated county on the right side of the result field. On the https://gis.cancer.gov/canceratlas/tableview/ website, choose "Incidence" from the Topic dropdown menu, state of interest from the Area menu, "All Races" from the Race menu, and the cancer type ("Both Sexes" when possible) from the Statistic menu. Find the county of interest and enter the numeric Age-Adjusted Rate per 100,000 as the value.
* [STRING]    `Progression_or_Recurrence_Anatomic_Site`
  - The text term used to describe the anatomic site of resection; biopsy; tissue or organ of biospecimen origin; progression or recurrent disease; treatment
* [STRING]    `Days_to_Death`
  - Number of days between the date used for index and the date from a person's date of death represented as a calculated number of days. If not applicable please enter 'Not Applicable'
* [STRING]    `Age_at_Diagnosis`
  - Age at the time of diagnosis expressed in number of days since birth.
* [STRING]    `Ethnicity`
  - An individual's self-described social and cultural grouping, specifically whether an individual describes themselves as Hispanic or Latino. The provided values are based on the categories defined by the U.S. Office of Management and Business and used by the U.S. Census Bureau.
* [STRING]    `Cause_of_Death_Source`
  - The text term used to describe the source used to determine the patient's cause of death.
* [STRING]    `Treatment_Type`
  - Text term that describes the kind of treatment administered.
* [STRING]    `Tumor_Grade`
  - Numeric value to express the degree of abnormality of cancer cells, a measure of differentiation and aggressiveness.
* [STRING]    `Test_Result`
  - The text term used to describe the result of the molecular test. If the test result was a numeric value see test_value. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Years_Smoked`
  - Numeric value (or unknown) to represent the number of years a person has been smoking.
* [STRING]    `Medically_Underserved_Area`
  - Areas or populations designated by HRSA as having too few primary care providers, high infant mortality, high poverty or a high elderly population:  Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/ - enter the zip code in the main text field and use the associated county on the right side of the result field. Go to data.hrsa.gov website and select "Query Data". Pick the Medically Underserved Areas/Populations (MUA/P) data source in the step 1 menu and select "View Data". Enter the name of the county (_______ county) in the first "Service Area" column, adding the state in the 5th column may help direct you to the data.  If the designation type in the third column is "medically underserved area" enter "Yes" as the value. If the county generates a "No data available in table" enter "No" as the value.  A value of "Unknown" indicates that sufficient data was not available to look up the value.  If value is yes, complete the Medically_underserved_score d
* [STRING]    `Days_to_Follow_Up`
  - Number of days between the date used for index and the date of the patient's last follow-up appointment or contact. If not applicable please enter 'Not Applicable'
* [STRING]    `Vital_Status`
  - The survival state of the person registered on the protocol.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Primary_Diagnosis`
  - Text term used to describe the patient's histologic diagnosis, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [STRING]    `Country_of_Birth`
  - Country where the patient was born.
* [STRING]    `Tumor_Largest_Dimension_Diameter`
  - Numeric value used to describe the maximum diameter or dimension of the primary tumor, measured in centimeters.
* [STRING]    `Medically_Underserved_Score`
  - Index of Medical Underservice (IMU) score, a number between 0 and 100, where 0 represents completely underserved and 100 represents best served or least underserved. Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/. Enter the zip code in the main text field and use the asociated county on the right side of the result field. Go to data.hrsa.gov website and select Query Data. Pick the Medically Underserved Areas/Populations (MUA/P) data source in the step 1 menu and select View Data. Enter the name of the county (______ county) in the first "Service Area" column, adding the state in the 5th column may help direct you to the data. Enter the Index of Medical Underservice Score in the fourth column to one decimal place as the value.
* [STRING]    `Gender`
  - Text designations that identify gender. Gender is described as the assemblage of properties that distinguish people on the basis of their societal roles. [Identification of gender is based upon self-report and may come from a form, questionnaire, interview, etc.]
* [STRING]    `Molecular_Analysis_Method`
  - The text term used to describe the method used for molecular analysis. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Days_to_Recurrence`
  - Number of days between the date used for index and the date the patient's disease recurred. If not applicable please enter 'Not Applicable'
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Gene_Symbol`
  - The text term used to describe a gene targeted or included in molecular analysis. For rearrangements, this is should be used to represent the reference gene. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Start_Days_from_Index`
  - Number of days from the date of birth (index date) to the date of an event (e.g. exposure to environmental factor, treatment start, etc.). If not applicable please enter 'Not Applicable'
* [STRING]    `Pack_Years_Smoked`
  - Numeric computed value to represent lifetime tobacco exposure defined as number of cigarettes smoked per day x number of years smoked divided by 20.
* [STRING]    `Tissue_or_Organ_of_Origin`
  - The text term used to describe the anatomic site of origin, of the patient's malignant disease, as described by the World Health Organization's (WHO) International Classification of Diseases for Oncology (ICD-O).
* [STRING]    `Days_to_Last_Follow_up`
  - Time interval from the date of last follow up to the date of initial pathologic diagnosis, represented as a calculated number of days. If not applicable please enter 'Not Applicable'
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Education_Level`
  - Highest level of education that the patient completed (direct patient-derived information)
* [STRING]    `Cause_of_Death`
  - The cause of death
* [STRING]    `Rural_vs_Urban`
  - Density of population in the county of residence, based on census data (updated last on 4/28/20). Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/. Enter the zip code in the main text field and use the associated county on the right side of the result field. Go to https://www2.census.gov/programs-surveys/acs/data/covid_19/Data_Profiles_for_HHS/050-County_By_State/. Select the dp02_XX.csv file where XX = the two letter abbreviation for the appropriate state. On row 166 find the total population for the appropriate county.  If the total population is <2,500 enter a value of "Rural Population"; if 2,500 - 50,000 enter a value of "Urban Cluster"; or if >50,000 enter "Urban Population"
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest

