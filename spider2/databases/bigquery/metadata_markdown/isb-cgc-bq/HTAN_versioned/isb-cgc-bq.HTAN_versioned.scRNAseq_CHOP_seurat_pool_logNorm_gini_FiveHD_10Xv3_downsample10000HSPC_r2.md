# `isb-cgc-bq.HTAN_versioned.scRNAseq_CHOP_seurat_pool_logNorm_gini_FiveHD_10Xv3_downsample10000HSPC_r2.md`

## Column details

* [INT64]    `iObs`
  - Index to cell barcodes.
* [INT64]    `iVar`
  - Index to gene IDs.
* [FLOAT64]    `X_value`
  - Expression value for a given gene and cell.
* [STRING]    `Cell_Name`
  - Cell Barcode
* [FLOAT64]    `nCount_RNA`
  - Number of counts per cell.
* [INT64]    `nFeature_RNA`
  - Number of genes identified per cell.
* [STRING]    `Sample`
  - Sample ID
* [FLOAT64]    `Perc_mito`
  - Percent mitochondrial RNA considering total counts.
* [INT64]    `Seurat_Clusters`
  - seurat cluster, resolution = 1.6
* [FLOAT64]    `Pseudotime`
  - Pseudotime value by Slingshot
* [FLOAT64]    `S_Score`
  - S phase score, computed by seurat 
* [FLOAT64]    `G2M_Score`
  - G2M phase score, computed by seurat 
* [STRING]    `Phase`
  - Estimated phase of the cell cycle. G2M,S,G1
* [FLOAT64]    `HeatShock_Score`
  - Heat Shock score, computed by seurat 
* [STRING]    `Cell_Type`
  - Final cell type annotation
* [STRING]    `Gene_Name`
  - Gene Symbol

