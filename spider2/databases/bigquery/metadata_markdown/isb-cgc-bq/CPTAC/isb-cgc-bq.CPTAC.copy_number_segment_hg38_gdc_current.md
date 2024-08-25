# `isb-cgc-bq.CPTAC.copy_number_segment_hg38_gdc_current.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; e.g. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-DX-A8BN
* [STRING]    `primary_site`
  - Anatomical site of the cancer under investigation or review
* [STRING]    `sample_barcode`
  - sample barcode, eg TCGA-12-1089-01A
* [STRING]    `aliquot_barcode`
  - aliquot barcode, eg TCGA-12-1089-01A-01D-0517-02
* [STRING]    `chromosome`
  - Chromosome, possible values: chr1-22, and chrX
* [INT64]    `start_pos`
  - 1-based start chromosome position of isoform
* [INT64]    `end_pos`
  - 1-based end chromosome position of isoform
* [INT64]    `copy_number`
  - The sum of the Major and Minor Copy Numbers
* [INT64]    `major_copy_number`
  - The Copy Number of the more prevalent allele set in the dataset for the genomic region
* [INT64]    `minor_copy_number`
  - The Copy Number of the less prevalent allele set in the dataset for the genomic region
* [STRING]    `case_gdc_id`
  - Unique GDC identifier for this case (corresponds to the case_barcode).  Can be used to access more information from the GDC data portal like this:   https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba10
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode), eg a1ec9279-c1a6-4e58-97ed-9ec1f36187c5  --  this can be used to access more information from the GDC data portal
* [STRING]    `aliquot_gdc_id`
  - Unique GDC identifier for this aliquot (corresponds to the aliquot_barcode), eg 7fbfdb3e-1fd2-4206-8d2e-7f68e4a15844  --  this can be used to access more information from the GDC data portal
* [STRING]    `file_gdc_id`
  - Unique GDC identifier for this file (corresponds to the file_barcode)  --  this can be used to access more information from the GDC data portal like this: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba17

