# `isb-cgc-bq.CPTAC.RNAseq_hg38_gdc_current.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `primary_site`
  - Anatomical site of the cancer under investigation or review
* [STRING]    `case_barcode`
  - Original case barcode
* [STRING]    `sample_barcode`
  - sample barcode, eg. TCGA-12-1089-01A. One sample may have multiple sets of expression values corresponding to multiple aliquots; use GROUP BY appropriately in queries
* [STRING]    `aliquot_barcode`
  - TCGA aliquot barcode, eg. TCGA-12-1089-01A-01D-0517-31
* [STRING]    `gene_name`
  - Gene name eg. TTN, DDR1
* [STRING]    `gene_type`
  - The type of genetic element the reads mapped to, eg. protein_coding, ribozyme
* [STRING]    `Ensembl_gene_id`
  - The Ensembl gene ID from the underlying file, but stripped of the version suffix -- eg. ENSG00000185028
* [STRING]    `Ensembl_gene_id_v`
  - The Ensembl gene ID from the underlying file, including the version suffix -- eg. ENSG00000235943.1
* [INT64]    `unstranded`
  - Number of mapped reads mapping to both strands of the genomic region of each gene as calculated by STAR
* [INT64]    `stranded_first`
  - Number of mapped reads mapping to only the first strand of the genomic region of each gene as calculated by STAR
* [INT64]    `stranded_second`
  - Number of mapped reads mapping to only the second strand of the genomic region of each gene as calculated by STAR
* [FLOAT64]    `tpm_unstranded`
  - Transcripts per million with transcripts normalized for length, as calculated by a custom GDC pipeline
* [FLOAT64]    `fpkm_unstranded`
  - Fragments per kilobase of transcript per million mapped reads (FPKM) calculation, intended to control for transcript length and overall sequencing quantity
* [FLOAT64]    `fpkm_uq_unstranded`
  - Upper quartile FPKM (FPKM-UQ), a modified FPKM calculation in which the protein coding gene in the 75th percentile position is substituted for the sequencing quantity. This is thought to provide a more stable value than including the noisier genes at the extremes
* [STRING]    `sample_type_name`
  - The longer name of the sample type; eg. Primary Tumor, Recurrent Tumor, etc
* [STRING]    `case_gdc_id`
  - Unique GDC identifier for this case (corresponds to the case_barcode)
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode)
* [STRING]    `aliquot_gdc_id`
  - Unique GDC identifier for this aliquot (corresponds to the aliquot_barcode)
* [STRING]    `file_gdc_id`
  - Unique GDC identifier for the file containing the expression values (corresponds to the file_barcode)
* [STRING]    `platform`
  - Platform used to generate data; eg. IlluminaHiSeq or IlluminaGA

