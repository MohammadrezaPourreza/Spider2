# `isb-cgc.TCGA_hg19_data_v0.RNAseq_Gene_Expression_UNC_RSEM.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_barcode`
  - Original TCGA sample barcode, eg TCGA-12-1089-01A
* [STRING]    `aliquot_barcode`
  - Original TCGA aliquot barcode, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `HGNC_gene_symbol`
  - HUGO Gene Nomenclature Committee gene symbol, based on gene_id in original data file, eg AMY1A. Null if no gene symbol could be found (see documentation for additional details regarding ETL) http://isb-cancer-genomics-cloud.readthedocs.io/en/latest/sections/data/data2/ETL_mRNAexpression.html
* [INT64]    `gene_id`
  - The gene symbol. In this table, gene symbol is gene namee.g. ENSG00000251562
* [FLOAT64]    `normalized_count`
  - Normalized gene expression from original rsem.genes.normalized_results file
* [STRING]    `original_gene_symbol`
  - Gene symbol from the original data file, differs if the approved gene symbol has since changed, eg C11orf17 became AKIP1
* [STRING]    `platform`
  - Platform used to generate data; either IlluminaHiSeq (for close to 93% of samples) or IlluminaGA

