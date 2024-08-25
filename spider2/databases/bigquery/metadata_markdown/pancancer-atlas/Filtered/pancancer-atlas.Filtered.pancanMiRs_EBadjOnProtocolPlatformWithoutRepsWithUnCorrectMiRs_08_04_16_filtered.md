# `pancancer-atlas.Filtered.pancanMiRs_EBadjOnProtocolPlatformWithoutRepsWithUnCorrectMiRs_08_04_16_filtered.md`

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
* [STRING]    `ID`
  - One of 1870 unique miRNA ids (aka symbols) contained in this table, eg hsa-mir-21 -- relevant reference information can be found in the isb-cgc:genome_reference dataset in the tables miRBase_v20 and miRBase_v20_hsa_gff3
* [FLOAT64]    `miRNAexpr`
  - Normalized abundance (i.e., reads per million, RPM)
* [STRING]    `Corrected`
  - Corrected and Uncorrected indicator that specify if the miRs were corrected by the EBN+ method. See more details at https://www.synapse.org/#!Synapse:syn6171109

