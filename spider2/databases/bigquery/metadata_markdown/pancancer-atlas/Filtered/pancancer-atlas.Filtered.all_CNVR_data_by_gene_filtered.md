# `pancancer-atlas.Filtered.all_CNVR_data_by_gene_filtered.md`

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
* [STRING]    `Gene_Symbol`
  - eg TP53, LRP1B, etc (same as Hugo_Symbol field except blank instead of Unknown
* [INT64]    `Locus_ID`
  - Gene locus ID, eg.  57380, 100616303
* [STRING]    `Cytoband`
  - Full cytoband name, including chromosome. E.g, 17p13.2 See https://www.ncbi.nlm.nih.gov/Class/MLACourse/Original8Hour/Genetics/chrombanding.html
* [FLOAT64]    `GISTIC_Calls`
  - Gistic Copy Number calls

