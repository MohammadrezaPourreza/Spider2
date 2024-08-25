# `pancancer-atlas.Filtered.Purity_Ploidy_All_Samples_filtered.md`

## Column details

* [STRING]    `AliquotBarcode`
  - TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-28
* [STRING]    `ParticipantBarcode`
  - TCGA barcode identifier for the study participant, eg TCGA-02-0001
* [STRING]    `SampleBarcode`
  - Barcode of the biospecimen sample, eg TCGA-13-1489-02A
* [STRING]    `CallStatus`
  - Either 'called' or NULL indicating if data data were analyzed or not, respectively
* [FLOAT64]    `Purity`
  - Purity estimates; values betwen 0 and 1 representing the fraction of cancer cells in a solid tumor sample
* [FLOAT64]    `Ploidy`
  - Value based on the DNA content of the tumor cell population compared to normal diploid
* [FLOAT64]    `Genome_doublings`
  - Number of whole genome doublings
* [FLOAT64]    `Coverage_for_80_power`
  -  Average coverage necessary to obtain 80% power in 80% fraction of the genome
* [FLOAT64]    `Cancer_DNA_fraction`
  - Cancer DNA fractions; more information available at https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4383288/
* [FLOAT64]    `Subclonal_genome_fraction`
  - Subclonal genome fractions; more information available at https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4383288/
* [STRING]    `Solution`
  - New' or 'old' calculations/solutions
* [STRING]    `Study`
  - TCGA study abbreviation, eg LAML. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tcga-study-abbreviations
* [STRING]    `SampleTypeLetterCode`
  - Letter code of the sample type using the TCGA standards, eg TPN, EBV. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/sample-type-codes
* [STRING]    `SampleType`
  - There are 10 sample types: Blood Derived Normal, Primary solid Tumor, Solid Tissue Normal, Recurrent Solid Tumor, Metastatic, Additional - New Primary, Primary Blood Derived Cancer - Peripheral Blood, Buccal Cell Normal, Additioanal Metastatic, Bone Marrrow Normal

