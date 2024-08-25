# `isb-cgc-bq.HTAN_versioned.clinical_tier2_r4.md`

## Column details

* [STRING]    `Sentinel_Lymph_Node_Count`
  - Numeric count of sentinel lymph nodes.
* [STRING]    `COVID19_Positive_Lab_Test_Indicator`
  - The indicator that describes whether or not there was a COVID-19 positive test result.
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Known_Genetic_Predisposition_Mutation`
  - A yes/no/unknown indicator to identify whether there is a known genetic predisposition mutation present in the patient.
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Extent_of_Tumor_Resection`
  - The degree to which the lesion has been cut out, or resected.
* [STRING]    `Prior_Sites_of_Radiation`
  - The anatomic location to which radiation treatment was administered to a patient prior to enrollment on a protocol.
* [STRING]    `Cancer_Incidence_Location`
  - The county and state in which the patient lives and to which the cancer_incidence data correlates. Record as "County, State" as they appear in the incidence box from which the cancer_incidence data is obtained in the https://gis.cancer.gov/canceratlas/tableview/ website
* [STRING]    `Ecig_vape_use`
  - Use of non-traditional cigarette nicotine delivery device (electronic cigarette, ENDS - electronic nicotine delivery system)
* [STRING]    `Ecig_vape_times_per_day`
  - e-cig frequency of use (times per day—one “time” consists of around 15 puffs or lasts around 10 minutes)
* [STRING]    `Cancer_Incidence`
  - Incidence of specific cancer type in a defined area (a number between 0 and 100). The rate of incident cases per population of 100,000 persons of a specific type of cancer as designated in the "primary_diagnosis" data element in the county where the patient resides, using the most recent 2013-2017 NCI Cancer Atlas derived data.  Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/. Enter the zip code in the main text field and use the asociated county on the right side of the result field. On the https://gis.cancer.gov/canceratlas/tableview/ website, choose "Incidence" from the Topic dropdown menu, state of interest from the Area menu, "All Races" from the Race menu, and the cancer type ("Both Sexes" when possible) from the Statistic menu. Find the county of interest and enter the numeric Age-Adjusted Rate per 100,000 as the value.
* [STRING]    `COVID19_Current_Status`
  - The patient's current COVID-19 status of sign or symptom events or interventions
* [STRING]    `Mode_of_Cancer_Detection`
  - Text term used to describe the mode of cancer detection, like standard of care screening or random detection
* [STRING]    `Tumor_Extranodal_Extension_Indicator`
  - The indicator to determine extranodal involvement or extent of the disease.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Cancer_Associated_Gene_Mutations`
  - Type of inherited germline or other gene mutations that confers heightened susceptibility to cancer identified in patient history
* [STRING]    `Second_hand_smoke_exposure_years`
  - The number of cumulative years of the patient's exposure to second-hand cigarette smoke
* [STRING]    `Other_Biopsy_Resection_Site`
  - A description of the location on or within the human body where the surgical biopsy/resection procedure was performed (Not covered under HTAN Clinical Data Tier 1)
* [STRING]    `Concomitant_Medication_Received_Type`
  - An enumerated list of the type of concomitant medication received by the patient.
* [STRING]    `COVID19_Cancer_Treatment_Followup`
  - Indicator that describes if cancer treatment was modified for the patient due to COVID-19 infectious disorder
* [STRING]    `COVID19_Complications_Severity`
  - Text term that retrospectively indicates the worst complications during COVID-19 infectious disorder in the patient.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Precancerous_Condition_Type`
  - The classification of pre-cancerous cells found in a specific collection of data being studied by the Consortium for Molecular and Cellular Characterization of Screen-Detected Lesions (MCL).
* [STRING]    `COVID19_Antibody_Testing`
  - Text term that demonstrates the test results of immunoglobulin M (IgM) and immunoglobulin G (IgG) antibodies to the SARS-CoV-2 virus in subject serum samples.
* [STRING]    `Mismatch_Repair_System_Status`
  - The text that best describes the condition or state of MMR (mismatch repair system) in the patient
* [STRING]    `Immunosuppression`
  - The indicator that describes whether or not immunosuppressive therapy was administered.
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Hereditary_Cancer_Predisposition_Syndrome`
  - History of presence of inherited genetic predisposition syndrome that confers heightened susceptibility to cancer in the patient.
* [STRING]    `Lab_Tests_for_MMR_Status`
  - Laboratory tests used to evaluate the status of mismatch repair pathways
* [STRING]    `Medically_Underserved_Area`
  - Areas or populations designated by HRSA as having too few primary care providers, high infant mortality, high poverty or a high elderly population:  Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/ - enter the zip code in the main text field and use the associated county on the right side of the result field. Go to data.hrsa.gov website and select "Query Data". Pick the Medically Underserved Areas/Populations (MUA/P) data source in the step 1 menu and select "View Data". Enter the name of the county (_______ county) in the first "Service Area" column, adding the state in the 5th column may help direct you to the data.  If the designation type in the third column is "medically underserved area" enter "Yes" as the value. If the county generates a "No data available in table" enter "No" as the value.  A value of "Unknown" indicates that sufficient data was not available to look up the value.  If value is yes, complete the Medically_underserved_score d
* [STRING]    `Family_Member_Vital_Status_Indicator`
  - The response indicates whether the family member of the patient with a history of cancer is alive. (Extension to GDC attributes in Family History Tier 1)
* [STRING]    `Country_of_Birth`
  - Country where the patient was born.
* [STRING]    `Stop_Days_from_Index`
  - Number of days from the date of birth (index date) to the end date of the event (e.g. exposure to environmental factor, treatment start, etc.). Note: if the event occurs at a single time point, e.g. a diagnosis or a lab test, the values for this column is 'Not Applicable'
* [STRING]    `Rural_vs_Urban`
  - Density of population in the county of residence, based on census data (updated last on 4/28/20). Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/. Enter the zip code in the main text field and use the associated county on the right side of the result field. Go to https://www2.census.gov/programs-surveys/acs/data/covid_19/Data_Profiles_for_HHS/050-County_By_State/. Select the dp02_XX.csv file where XX = the two letter abbreviation for the appropriate state. On row 166 find the total population for the appropriate county.  If the total population is <2,500 enter a value of "Rural Population"; if 2,500 - 50,000 enter a value of "Urban Cluster"; or if >50,000 enter "Urban Population"
* [STRING]    `Medically_Underserved_Score`
  - Index of Medical Underservice (IMU) score, a number between 0 and 100, where 0 represents completely underserved and 100 represents best served or least underserved. Use patient zip code to find the county the patient lives in by going to https://www.unitedstateszipcodes.org/. Enter the zip code in the main text field and use the asociated county on the right side of the result field. Go to data.hrsa.gov website and select Query Data. Pick the Medically Underserved Areas/Populations (MUA/P) data source in the step 1 menu and select View Data. Enter the name of the county (______ county) in the first "Service Area" column, adding the state in the 5th column may help direct you to the data. Enter the Index of Medical Underservice Score in the fourth column to one decimal place as the value.
* [STRING]    `Sentinel_Node_Positive_Assessment_Count`
  - The number or amount of metastatic neoplasms related to the confirmed presence of disease or specific microorganisms during examination of the first rounded mass of lymphatic tissue to which cancer is likely to spread from the primary tumor.
* [STRING]    `Education_Level`
  - Highest level of education that the patient completed (direct patient-derived information)
* [STRING]    `Satellite_Metastasis_Present_Indicator`
  - A yes/no indicator to ask if intransit metastases or satellite lesions are present.
* [STRING]    `COVID19_Occurrence_Indicator`
  - The indicator that describes whether or not a COVID-19 infectious disorder occurred.
* [STRING]    `Chewing_tobacco_daily_use_count`
  - The quantity of daily use of tobacco, in the form of a plug, usually flavored, for chewing rather than smoking.
* [STRING]    `Ecig_vape_30_day_use_num`
  - Number of days e-cigarettes or vaping device was used in the last 30 days
* [STRING]    `Start_Days_from_Index`
  - Number of days from the date of birth (index date) to the date of an event (e.g. exposure to environmental factor, treatment start, etc.). If not applicable please enter 'Not Applicable'
* [STRING]    `Mutational_Signatures`
  - Mutational signatures identified in the patient, includes signatures linked to selected exogenous carcinogens, endogenous and enzymatic modification of DNA or defective DNA repair. Note: Include only outputs of tests that were completed clinically for the participant and only include data from a diagnostic array that was completed prior to research sequencing was done. 
* [STRING]    `Type_of_smoke_exposure_cumulative_years`
  - The number of cumulative years of the patient's specific type of smoke exposure
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest

