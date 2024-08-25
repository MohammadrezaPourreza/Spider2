# `isb-cgc-bq.HTAN_versioned.clinical_tier1_demographics_r2.md`

## Column details

* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Ethnicity`
  - An individual's self-described social and cultural grouping, specifically whether an individual describes themselves as Hispanic or Latino. The provided values are based on the categories defined by the U.S. Office of Management and Business and used by the U.S. Census Bureau.
* [STRING]    `Gender`
  - Text designations that identify gender. Gender is described as the assemblage of properties that distinguish people on the basis of their societal roles. [Identification of gender is based upon self-report and may come from a form, questionnaire, interview, etc.]
* [STRING]    `Race`
  - An arbitrary classification of a taxonomic group that is a division of a species. It usually arises as a consequence of geographical isolation withina a species and is characterized by shared heredity, physical attributes and behavior, and in the case of humans, by common history, nationality, or geographic distribution.
* [STRING]    `Vital_Status`
  - The survival state of the person registered on the protocol.
* [STRING]    `Days_to_Birth`
  - Number of days between the date used for index and the date from a person's date of birth represented as a calculated negative number of days.
* [STRING]    `Country_of_Residence`
  - Country of Residence at enrollment
* [STRING]    `Age_Is_Obfuscated`
  - The age of the patient has been modified for compliance reasons. The actual age differs from what is reported. Other date intervals for this patient may also be modified.
* [STRING]    `Year_Of_Birth`
  - Numeric value to represent the calendar year in which an individual was born.
* [STRING]    `Occupation_Duration_Years`
  - The number of years a patient worked in a specific occupation.
* [STRING]    `Premature_At_Birth`
  - The yes/no/unknown indicator used to describe whether the patient was premature (less than 37 weeks gestation) at birth.
* [STRING]    `Weeks_Gestation_at_Birth`
  - Numeric value used to describe the number of weeks starting from the approximate date of the biological mother's last menstrual period and ending with the birth of the patient.
* [STRING]    `Year_of_Death`
  - Numeric value to represent the year of the death of an individual.
* [STRING]    `Age_at_Index`
  - For GDC submission only - this is going to be always 0 since HTAN's index is the date of birth
* [STRING]    `Cause_of_Death`
  - The cause of death
* [STRING]    `Cause_of_Death_Source`
  - The text term used to describe the source used to determine the patient's cause of death.
* [STRING]    `Days_to_Death`
  - Number of days between the date used for index and the date from a person's date of death represented as a calculated number of days.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0

