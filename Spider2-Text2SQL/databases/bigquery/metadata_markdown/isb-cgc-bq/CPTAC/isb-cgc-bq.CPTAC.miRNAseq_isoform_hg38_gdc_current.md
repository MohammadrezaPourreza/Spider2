# `isb-cgc-bq.CPTAC.miRNAseq_isoform_hg38_gdc_current.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation, eg TARGET-AML
* [STRING]    `case_barcode`
  - Original TARGET case barcode, eg TARGET-20-PASCGR
* [STRING]    `sample_barcode`
  - TARGET sample barcode, eg TARGET-20-PASWAT-09A
* [STRING]    `aliquot_barcode`
  - TARGET aliquot barcode, eg TARGET-20-PAJLIP-01A-01R
* [STRING]    `primary_site`
  - Anatomical site of the cancer under investigation or review
* [STRING]    `miRNA_id`
  - Unique miRNA id (aka symbol), eg hsa-mir-21  --  relevant reference information can be found in the isb-cgc:genome_reference dataset in the tables miRBase_v21 and miRBase_v21_hsa_gff3
* [STRING]    `chromosome`
  - Chromosome, possible values: chr1-22, and chrX
* [INT64]    `start_pos`
  - 1-based start chromosome position of isoform
* [INT64]    `end_pos`
  - 1-based end chromosome position of isoform
* [STRING]    `strand`
  - Either + or - to denote whether read mapped to the sense (+) or anti-sense (-) strand
* [INT64]    `read_count`
  - Number of reads that were mapped to this mirna_id
* [FLOAT64]    `reads_per_million_miRNA_mapped`
  - Read count normalized by total reads mapped divided by 1 million
* [STRING]    `cross_mapped`
  - A short isomiR read may map exactly to mature strands whose sequences are similar but not identical, when the read sequence does not capture the bases that distinguish these miRNAs (e.g. hsa-mir-30a at 6q13 and hsa-mir-30e at 1p34.2, which differ at position 18). We report such a <line_feed> read as cross-mapped, and we increment the read count for each MIMAT that it mapped to. Either Y or N -- fewer than 2% are Y
* [STRING]    `sample_type_name`
  - The longer name of the sample type; eg. Primary Tumor, Recurrent Tumor, etc
* [STRING]    `case_gdc_id`
  - GDC unique identifier for this case (corresponds to the case_barcode)  --  this can be used to access more information from the GDC data portal like this:   https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba13
* [STRING]    `sample_gdc_id`
  - Unique GDC identifier for this sample (corresponds to the sample_barcode), eg a1ec9279-c1a6-4e58-97ed-9ec1f36187c5  --  this can be used to access more information from the GDC data portal
* [STRING]    `aliquot_gdc_id`
  - Unique GDC identifier for this aliquot (corresponds to the aliquot_barcode), eg 7fbfdb3e-1fd2-4206-8d2e-7f68e4a15844  --  this can be used to access more information from the GDC data portal
* [STRING]    `file_gdc_id`
  - Unique GDC identifier for this file (corresponds to the file_barcode)  --  this can be used to access more information from the GDC data portal like this: https://portal.gdc.cancer.gov/files/c21b332c-06c6-4403-9032-f91c8f407ba13
* [STRING]    `miRNA_transcript`
  - The type of transcript -- either mature, precursor, unannotated, or stemloop  (if this value is not mature, then the mirna_accession field will be null)
* [STRING]    `miRNA_accession`
  - The mature miRNA accession id (eg MIMAT0000062) -- note that this can also be null, in the event that this read does not map to a mature portion of the miRNA

