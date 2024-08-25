# `isb-cgc.TCGA_hg19_data_v0.DNA_Methylation_chr12.md`

## Column details

* [STRING]    `project_short_name`
  - Abbreviated form of the project name; eg. TCGA-BRCA (there are 33 unique projects within the TCGA program)
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_barcode`
  - Original TCGA sample barcode, eg TCGA-12-1089-01A
* [STRING]    `aliquot_barcode`
  - Original TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `probe_id`
  - Unique probe identifier (eg cg04676771) from the Illumina Human Methylation array -- please refer to the annotation table (isb-cgc:platform_reference.methylation_annotation) for more details about any particular probe
* [FLOAT64]    `beta_value`
  - Normalized DNA methylation beta value (between 0 and 1, where 0 indicates completely un-methylated and 1 indicates fully methylated)
* [STRING]    `platform`
  - Platform name used to generate this data -- either HumanMethylation450 or HumanMethylation27

