# `isb-cgc.TCGA_hg38_data_v0.RNAseq_Gene_Expression.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-DX-A8BN
* [STRING]    `sample_barcode`
  - TCGA sample barcode, eg TCGA-12-1089-01A. One sample may have multiple sets of CN segmentations corresponding to multiple aliquots; use GROUP BY appropriately in queries
* [STRING]    `aliquot_barcode`
  - TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-31
* [STRING]    `gene_name`
  - Gene name e.g. TTN, DDR1, etc.
* [STRING]    `gene_type`
  - The type of genetic element the reads mapped to, eg protein_coding, ribozyme
* [STRING]    `Ensembl_gene_id`
  - The Ensembl gene ID from the underlying file, but stripped of the version suffix -- eg ENSG00000185028
* [STRING]    `Ensembl_gene_id_v`
  - The Ensembl gene ID from the underlying file, including the version suffix  --  eg ENSG00000235943.1
* [INT64]    `HTSeq__Counts`
  - Number of mapped reads to each gene as calculated by the Python package HTSeq. https://docs.gdc.cancer.gov/Encyclopedia/pages/HTSeq-Counts/
* [FLOAT64]    `HTSeq__FPKM`
  - FPKM is implemented at the GDC on gene-level read counts that are produced by HTSeq1 and generated using custom. scripts https://docs.gdc.cancer.gov/Encyclopedia/pages/HTSeq-FPKM/
* [FLOAT64]    `HTSeq__FPKM_UQ`
  - Fragments Per Kilobase of transcript per Million mapped reads (FPKM) is a simple expression level normalization method. The FPKM normalizes read count based on gene length and the total number of mapped reads. https://docs.gdc.cancer.gov/Encyclopedia/pages/HTSeq-FPKM/
* [STRING]    `case_gdc_id`
  - Unique GDC identifier for this case (corresponds to the case_barcode).  Can be used to access more information from the GDC data portal like this:   https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba36
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode), eg a1ec9279-c1a6-4e58-97ed-9ec1f36187c5  --  this can be used to access more information from the GDC data portal
* [STRING]    `aliquot_gdc_id`
  - Unique GDC identifier for this aliquot (corresponds to the aliquot_barcode), eg 7fbfdb3e-1fd2-4206-8d2e-7f68e4a15844  --  this can be used to access more information from the GDC data portal
* [STRING]    `file_gdc_id`
  - Unique GDC identifier for this file (corresponds to the file_barcode)  --  this can be used to access more information from the GDC data portal like this: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba43
* [STRING]    `platform`
  - Platform used to generate data; either IlluminaHiSeqor IlluminaGA

