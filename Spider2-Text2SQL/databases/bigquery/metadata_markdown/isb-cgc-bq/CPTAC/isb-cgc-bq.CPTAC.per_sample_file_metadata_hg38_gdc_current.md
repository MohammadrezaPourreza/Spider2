# `isb-cgc-bq.CPTAC.per_sample_file_metadata_hg38_gdc_current.md`

## Column details

* [STRING]    `file_gdc_id`
  - Unique GDC identifier for this file (corresponds to the file_barcode)--this can be used to access more information from the GDC data portal like this: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba4
* [STRING]    `case_gdc_id`
  - GDC unique identifier
* [STRING]    `case_barcode`
  - Submitter identifier, e.g. HCC1954, TCGA-ZX-AA5X, etc.
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode), e.g. a1ec9279-c1a6-4e58-97ed-9ec1f36187c5--this can be used to access more information from the GDC data portal
* [STRING]    `sample_barcode`
  - Original/submitter sample ID
* [STRING]    `sample_type_name`
  - The longer name of the sample type, e.g. Primary Tumor, Recurrent Tumor, etc.
* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation, eg. TCGA-OV, etc.
* [STRING]    `project_short_name_suffix`
  - The code representing a project within a program. For some programs, this can be a disease code.
* [STRING]    `program_name`
  - Program name, e.g. TCGA or TARGET
* [STRING]    `data_type`
  - Experimental source of the data type, e.g. Tissue slide image, RNA-Seq
* [STRING]    `data_category`
  - Category description of the underlying data, e.g. Clinical, Raw Sequencing Data, Simple Nucleotide Variation, Transcriptome Profiling, etc.
* [STRING]    `experimental_strategy`
  - Experimental strategy used to generate data (where applicable) e.g. WXS, RNA-Seq
* [STRING]    `file_type`
  - File type--e.g. aligned_reads, simple_somatic_mutation, gene_expression, etc.
* [INT64]    `file_size`
  - The size of the file measured in bytes
* [STRING]    `data_format`
  - File format of the underlying data, e.g. BCR XML, BAM
* [STRING]    `platform`
  - Platform used to generate this data, e.g. Illumina, Affymetrix SNP 6.10
* [STRING]    `file_name_key`
  - GDC path to original bam or vcf file
* [STRING]    `index_file_id`
  - BAM or VCF index file GDC file UUID
* [STRING]    `index_file_name_key`
  - GDC path to original vcf or bam index file
* [INT64]    `index_file_size`
  - Where available, size of the index file in bytes
* [STRING]    `access`
  - Data accessibility policy (open or controlled)
* [STRING]    `acl`
  - Access Control List--if access is controlled, this field contains the dbGaP accession, e.g. phs000179

