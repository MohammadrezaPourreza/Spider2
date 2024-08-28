# `isb-cgc.TCGA_hg19_data_v0.Copy_Number_Segment_Masked.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_barcode`
  - Original TCGA sample barcode, eg TCGA-12-1089-01A  --  note that one sample may have multiple aliquots and therefore multiple sets of CN segmentations; so be sure to use GROUP BY appropriately in your queries
* [STRING]    `aliquot_barcode`
  - Original TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `chromosome`
  - Chromosome, possible values: chr1-22, and chrX
* [INT64]    `start_pos`
  - 1-based start chromosome position of CN segment start-position
* [INT64]    `end_pos`
  - 1-based end chromosome position of CN segment end- position
* [INT64]    `num_probes`
  - Number of probes in the SNP array used to infer this CN segment
* [FLOAT64]    `segment_mean`
  - Mean CN value for this segment -- the value is base2 log(CN/2), centered at 0
* [STRING]    `platform`
  - Platform used to generate these data (Genome_Wide_SNP_6 for this data)

