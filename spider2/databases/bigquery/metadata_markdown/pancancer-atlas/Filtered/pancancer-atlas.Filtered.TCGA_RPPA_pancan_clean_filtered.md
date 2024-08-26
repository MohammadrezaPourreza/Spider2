# `pancancer-atlas.Filtered.TCGA_RPPA_pancan_clean_filtered.md`

## Column details

* [STRING]    `ParticipantBarcode`
  - TCGA barcode identifier for the study participant, eg TCGA-02-0001
* [STRING]    `SampleBarcode`
  - Barcode of the biospecimen sample, eg TCGA-13-1489-02A
* [STRING]    `AliquotBarcode`
  - TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-28
* [STRING]    `SampleTypeLetterCode`
  - Letter code of the sample type using the TCGA standards, eg TPN, EBV. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/sample-type-codes
* [STRING]    `SampleType`
  - There are 10 sample types: Blood Derived Normal, Primary solid Tumor, Solid Tissue Normal, Recurrent Solid Tumor, Metastatic, Additional - New Primary, Primary Blood Derived Cancer - Peripheral Blood, Buccal Cell Normal, Additioanal Metastatic, Bone Marrrow Normal
* [STRING]    `Study`
  - TCGA study abbreviation, eg LAML. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tcga-study-abbreviations
* [STRING]    `Protein`
  - Protein symbol and phosphorylation status (if applicable), eg P53, JNK_pT183Y185
* [FLOAT64]    `Value`
  - Expression level of protein as measured by reverse-phase protein arrays (RPPAs).Examples: 0.204238725,-0.01826295

