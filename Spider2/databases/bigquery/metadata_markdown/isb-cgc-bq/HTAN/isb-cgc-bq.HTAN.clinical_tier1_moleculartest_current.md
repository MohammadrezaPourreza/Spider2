# `isb-cgc-bq.HTAN.clinical_tier1_moleculartest_current.md`

## Column details

* [STRING]    `Blood_Test_Normal_Range_Upper`
  - Numeric value used to describe the upper limit of the normal range used to describe a healthy individual at the institution where the test was completed.
* [STRING]    `Transcript`
  - Alphanumeric value used to describe the transcript of a specific genetic variant. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Blood_Test_Normal_Range_Lower`
  - Numeric value used to describe the lower limit of the normal range used to describe a healthy individual at the institution where the test was completed.
* [STRING]    `Histone_Variant`
  - The text term used to describe a specific histone variants, which are proteins that substitute for the core canonical histones.
* [STRING]    `Ploidy`
  - Text term used to describe the number of sets of homologous chromosomes.
* [STRING]    `Mismatch_Repair_Mutation`
  - The yes/no/unknown indicator used to describe whether the mutation included in molecular testing was known to have an affect on the mismatch repair process. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Timepoint_Label`
  - Label to identify the time point at which the clinical data or biospecimen was obtained (e.g. Baseline, End of Treatment, Overall survival, Final). NO PHI/PII INFORMATION IS ALLOWED.
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Stop_Days_from_Index`
  - Number of days from the date of birth (index date) to the end date of the event (e.g. exposure to environmental factor, treatment start, etc.). Note: if the event occurs at a single time point, e.g. a diagnosis or a lab test, the values for this column is 'Not Applicable'
* [STRING]    `Locus`
  - Alphanumeric value used to describe the locus of a specific genetic variant. Example: NM_001126114.
* [STRING]    `Antigen`
  - The text term used to describe an antigen included in molecular testing. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Variant_Origin`
  - The text term used to describe the biological origin of a specific genetic variant. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Laboratory_Test`
  - The text term used to describe the medical testing used to diagnose, treat or further understand a patient's disease.
* [STRING]    `Intron`
  - Intron number targeted or included in molecular analysis. If a specific genetic variant is being reported, this property can be used to capture the intron where that variant is located.
* [STRING]    `Exon`
  - Exon number targeted or included in a molecular analysis. If a specific genetic variant is being reported, this property can be used to capture the exon where that variant is located. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `AA_Change`
  - Alphanumeric value used to describe the amino acid change for a specific genetic variant. Example: R116Q. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Clinical_Biospecimen_Type`
  - The text term used to describe the biological material used for testing, diagnostic, treatment or research purposes. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Zygosity`
  - The text term used to describe the zygosity of a specific genetic variant.
* [STRING]    `Variant_Type`
  - The text term used to describe the type of genetic variation.
* [STRING]    `Cell_Count`
  - Numeric value used to describe the number of cells used for molecular testing. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Pathogenicity`
  - The text used to describe a variant's level of involvement in the cause of the patient's disease according to the standards outlined by the American College of Medical Genetics and Genomics (ACMG).
* [STRING]    `Copy_Number`
  - Numeric value used to describe the number of times a section of the genome is repeated or copied within an insertion, duplication or deletion variant. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Clonality`
  - The text term used to describe whether a genomic variant is related by descent from a single progenitor cell. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Test_Units`
  - The text term used to describe the units of the test value for a molecular test. This property is used in conjunction with test_value. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Loci_Count`
  - Numeric value used to describe the number of loci tested.
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `Chromosome`
  - The text term used to describe a chromosome targeted or included in molecular testing. If a specific genetic variant is being reported, this property can be used to capture the chromosome where that variant is located. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Molecular_Analysis_Method`
  - The text term used to describe the method used for molecular analysis. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Test_Analyte_Type`
  - The text term used to describe the type of analyte used for molecular testing. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `HTAN_Participant_ID`
  - HTAN ID associated with a patient based on HTAN ID SOP (eg HTANx_yyy )
* [STRING]    `Molecular_Consequence`
  - The text term used to describe the molecular consequence of genetic variation. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Gene_Symbol`
  - The text term used to describe a gene targeted or included in molecular analysis. For rearrangements, this is should be used to represent the reference gene. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Loci_Abnormal_Count`
  - Numeric value used to describe the number of loci determined to be abnormal.
* [STRING]    `Specialized_Molecular_Test`
  - Text term used to describe a specific test that is not covered in the list of molecular analysis methods. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Start_Days_from_Index`
  - Number of days from the date of birth (index date) to the date of an event (e.g. exposure to environmental factor, treatment start, etc.). If not applicable please enter 'Not Applicable'
* [STRING]    `Histone_Family`
  - The text term used to describe the family, or classification of a group of basic proteins found in chromatin, called histones.
* [STRING]    `Cytoband`
  - Alphanumeric value used to describe the cytoband or chromosomal location targeted or included in molecular analysis. If a specific genetic variant is being reported, this property can be used to capture the cytoband where the variant is located. Format: [chromosome][chromosome arm].[band+sub-bands]. Example: 17p13.1. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `Second_Exon`
  - The second exon number involved in molecular variation. If a specific genetic variant is being reported, this property can be used to capture the second exon where that variant is located. This property is typically used for a translocation where two different locations are involved in the variation.
* [STRING]    `Second_Gene_Symbol`
  - The text term used to describe a secondary gene targeted or included in molecular analysis. For rearrangements, this is should represent the location of the variant. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Test_Result`
  - The text term used to describe the result of the molecular test. If the test result was a numeric value see test_value. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here.
* [STRING]    `Test_Value`
  - The text term or numeric value used to describe a specific result of a molecular test. Note: This node is meant to capture molecular tests that were completed clinically for the participant and only includes data from diagnostic array that was completed prior to research sequencing was done. Do not include data related to research assay outputs here
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest

