# `isb-cgc.TCGA_hg19_data_v0.Protein_Expression.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_barcode`
  - Original TCGA sample barcode, eg TCGA-12-1089-01A  --  note that one sample may have multiple aliquots and therefore multiple sets of CN segmentations; so be sure to use GROUP BY appropriately in your queries
* [STRING]    `aliquot_barcode`
  - Original TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `gene_name`
  - Gene name e.g. eg TTN, DDR1, etc
* [STRING]    `protein_base_name`
  - Protein name e.g. AR, MAPK
* [STRING]    `phospho`
  - If the antibody targets a phosphorylated protein, this field will contain that information, eg pS473  --  otherwise this field will be null
* [STRING]    `protein_name`
  - Protein symbol with phosphorylation status, eg ACC_pS79
* [FLOAT64]    `protein_expression`
  - Expression level of protein as measured by reverse-phase protein arrays. https://bioinformatics.mdanderson.org/public-software/tcpa/
* [STRING]    `antibody_source`
  - Animal of origin for the antibody M (Mouse), R (Rabbit), G (Goat)
* [STRING]    `validation_status`
  - Validation status of antibody by correlation of RPPA data with Western blot: V, E, C. For more information: https://bioinformatics.mdanderson.org/public-software/mclp/

