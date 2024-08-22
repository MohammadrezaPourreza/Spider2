# `pancancer-atlas.Filtered.EBpp_AdjustPANCAN_IlluminaHiSeq_RNASeqV2_genExp_filtered.md`

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
* [STRING]    `Symbol`
  - eg TP53, LRP1B, etc (same as Hugo_Symbol field except blank instead of Unknown
* [STRING]    `Entrez`
  - Entrez ID from the NCBI, eg 730971
* [FLOAT64]    `normalized_count`
  - Normalized gene expression

