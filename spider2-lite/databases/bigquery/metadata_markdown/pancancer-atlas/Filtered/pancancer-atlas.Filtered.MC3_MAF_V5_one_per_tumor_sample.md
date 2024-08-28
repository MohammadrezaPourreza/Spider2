# `pancancer-atlas.Filtered.MC3_MAF_V5_one_per_tumor_sample.md`

## Column details

* [STRING]    `ParticipantBarcode`
  - TCGA barcode identifier for the study participant, eg TCGA-02-0001
* [STRING]    `Tumor_SampleBarcode`
  - Original TCGA tumor sample barcode.TCGA-WC-A885-01A, TCGA-HQ-A2OF-01A.
* [STRING]    `Tumor_AliquotBarcode`
  - Original TCGA tumor aliquote barcode. Examples: TCGA-WC-A885-01A,TCGA-XF-AAN3-01A
* [STRING]    `Normal_SampleBarcode`
  - Sample Barcode For The Normal Tissue. Examples: TCGA-V4-A9EI-10A, TCGA-V4-A9EI-10A
* [STRING]    `Normal_AliquotBarcode`
  - Aliquot Barcode For The Normal Tissue. Examples: TCGA-CR-7385-10A-01D-2013-08, TCGA-DX-A3M1-10A-01D-A22A-09
* [STRING]    `Normal_SampleTypeLetterCode`
  - Sample Type Letter Code. The subset of 4 values currently used are: NBC, NB, NT, NBM. See https://Gdc.Cancer.Gov/Resources-Tcga-Users/Tcga-Code-Tables/Sample-Type-Codes
* [STRING]    `Study`
  - TCGA study abbreviation, eg LAML. Full list available at https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tcga-study-abbreviations
* [STRING]    `Hugo_Symbol`
  - HUGO symbol for the gene (HUGO symbols are always in all caps). "Unknown" is used for regions that do not correspond to a gene
* [STRING]    `HGVSp_Short`
  - Protein sequence of the variant in HGVS recommended format, but using 1-letter amino-acid codes. "p.=" signifies no change in the protein
* [STRING]    `Variant_Classification`
  - Translational effect of variant allele; eg. Missense_Mutation, Nonsense_Mutation, etc.
* [STRING]    `HGVSc`
  - The coding sequence of the variant in HGVS recommended format
* [STRING]    `CENTERS`
  - One or more genome sequencing center reporting the variant
* [STRING]    `FILTER`
  - List of failed filters (if any), or "PASS" indicating the variant has passed all filters.

