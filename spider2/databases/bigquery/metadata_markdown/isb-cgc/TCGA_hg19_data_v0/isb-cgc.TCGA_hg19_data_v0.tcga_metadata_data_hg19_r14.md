# `isb-cgc.TCGA_hg19_data_v0.tcga_metadata_data_hg19_r14.md`

## Column details

* [STRING]    `file_gdc_id`
  - Unique GDC identifier for this file (corresponds to the file_barcode)  --  this can be used to access more information from the GDC data portal like this: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba19
* [STRING]    `case_gdc_id`
  - GDC unique identifier for this case (corresponds to the case_barcode), eg 6d10d4ee-6331-4bba-93bc-a7b64cc0b22a  --  this can be used to access more information from the GDC data portal like this:   https://portal.gdc.cancer.gov/cases/6d10d4ee-6331-4bba-93bc-a7b64cc0b22a
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode), eg a1ec9279-c1a6-4e58-97ed-9ec1f36187c5  --  this can be used to access more information from the GDC data portal
* [STRING]    `sample_barcode`
  - Original TCGA sample barcode, eg TCGA-12-1089-01A  --  note that one sample may have multiple aliquots and therefore multiple sets of CN segmentations; so be sure to use GROUP BY appropriately in your queries
* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `disease_code`
  - A code representing the type of cancer. Values can be found at https://gdc.cancer.gov/resources-TCGA-users/TCGA-code-tables/TCGA-study-abbreviations; eg. OV, GBM, LUAD
* [STRING]    `program_name`
  - Program Name, always TCGA (The Cancer Genome Atlas) in this table.
* [STRING]    `data_type`
  - Experimental source of the data type, eg Tissue slide image, RNA-Seq
* [STRING]    `data_category`
  - Category description of the underlying data, eg Clinical, Raw Sequencing Data, Simple Nucleotide Variation, Transcriptome Profiling  , etc
* [STRING]    `experimental_strategy`
  - Experimental strategy used to generate data (where applicable) e.g. WXS, RNA-Seq
* [STRING]    `type`
  - Description of the data, eg. clinical_supplement, aligned_reads
* [INT64]    `file_size`
  - The size of the file measured in bytes
* [STRING]    `data_format`
  - File format of the underlying data, eg BCR XML, BAM
* [STRING]    `platform`
  - Platform used to generate data; either IlluminaHiSeq (for close to 93% of samples) or IlluminaGA
* [STRING]    `file_name_key`
  - GDC path to original bam or vcf file
* [STRING]    `index_file_id`
  - BAM  or VCF index file GDC file UUID
* [STRING]    `index_file_name_key`
  - GDC path to original vcf or bam index file 
* [INT64]    `index_file_size`
  - Where available, size of the index file in bytes 
* [STRING]    `access`
  - Data accessibility policy (open or controlled)
* [STRING]    `acl`
  - Access Control List -- if access is controlled, this field contains the dbGaP accession, eg phs000179

