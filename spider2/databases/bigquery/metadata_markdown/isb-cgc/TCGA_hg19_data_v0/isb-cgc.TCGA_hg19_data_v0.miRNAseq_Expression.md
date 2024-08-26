# `isb-cgc.TCGA_hg19_data_v0.miRNAseq_Expression.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_barcode`
  - Original TCGA sample barcode, eg TCGA-12-1089-01A  --  note that one sample may have multiple aliquots and therefore multiple sets of CN segmentations; so be sure to use GROUP BY appropriately in your queries
* [STRING]    `aliquot_barcode`
  - Original TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `mirna_id`
  - One of 1870 unique miRNA ids (aka symbols) contained in this table, eg hsa-mir-21  --  relevant reference information can be found in the isb-cgc:genome_reference dataset in the tables miRBase_v20 and miRBase_v20_hsa_gff3
* [INT64]    `read_count`
  - Number of reads that were mapped to this mirna_id
* [FLOAT64]    `reads_per_million_miRNA_mapped`
  - Read count normalized by total reads mapped divided by 1 million
* [STRING]    `cross_mapped`
  - A short isomiR read may map exactly to mature strands whose sequences are similar but not identical, when the read sequence does not capture the bases that distinguish these miRNAs (e.g. hsa-mir-30a at 6q13 and hsa-mir-30e at 1p34.2, which differ at position 18). We report such a <line_feed> read as cross-mapped, and we increment the read count for each MIMAT that it mapped to. Either Y or N -- fewer than 2% are Y
* [STRING]    `file_gdc_id`
  - Unique GDC identifier for this file (corresponds to the file_barcode)  --  this can be used to access more information from the GDC data portal like this: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba17
* [STRING]    `case_gdc_id`
  - GDC unique identifier for this case (corresponds to the case_barcode), eg 6d10d4ee-6331-4bba-93bc-a7b64cc0b22a  --  this can be used to access more information from the GDC data portal like this:   https://portal.gdc.cancer.gov/cases/6d10d4ee-6331-4bba-93bc-a7b64cc0b22a
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode), eg a1ec9279-c1a6-4e58-97ed-9ec1f36187c5  --  this can be used to access more information from the GDC data portal
* [STRING]    `aliquot_gdc_id`
  - Unique GDC identifier for this aliquot (corresponds to the aliquot_barcode), eg 7fbfdb3e-1fd2-4206-8d2e-7f68e4a15844  --  this can be used to access more information from the GDC data portal

