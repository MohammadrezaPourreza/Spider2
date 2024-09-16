SELECT
  genex.case_barcode AS case_barcode,
  genex.sample_barcode AS sample_barcode,
  genex.aliquot_barcode AS aliquot_barcode,
  genex.HGNC_gene_symbol AS HGNC_gene_symbol,
  clinical_info.Variant_Type AS Variant_Type,
  genex.gene_id AS gene_id,
  genex.normalized_count AS normalized_count,
  genex.project_short_name AS project_short_name,
  clinical_info.demo__gender AS gender,
  clinical_info.demo__vital_status AS vital_status,
  clinical_info.demo__days_to_death AS days_to_death
FROM ( /* This will get the clinical information for the cases*/
  SELECT
    case_list.Variant_Type AS Variant_Type,
    case_list.case_barcode AS case_barcode,
    clinical.demo__gender,
    clinical.demo__vital_status,
    clinical.demo__days_to_death
  FROM
    /* this will get the unique list of cases having the CDKN2A gene mutation in bladder cancer BLCA cases*/
    (SELECT
      mutation.case_barcode,
      mutation.Variant_Type
    FROM
      `isb-cgc-bq.TCGA_versioned.somatic_mutation_hg19_DCC_2017_02` AS mutation
    WHERE
      mutation.Hugo_Symbol = 'CDKN2A'
      AND project_short_name = 'TCGA-BLCA'
    GROUP BY
      mutation.case_barcode,
      mutation.Variant_Type
    ORDER BY
      mutation.case_barcode
      ) AS case_list /* end case_list */
  INNER JOIN
    `isb-cgc-bq.TCGA.clinical_gdc_current` AS clinical
  ON
    case_list.case_barcode = clinical.submitter_id /* end clinical annotation */ ) AS clinical_info
INNER JOIN
  `isb-cgc-bq.TCGA_versioned.RNAseq_hg19_gdc_2017_02` AS genex
ON
  genex.case_barcode = clinical_info.case_barcode
WHERE
  genex.HGNC_gene_symbol IN ('MDM2', 'TP53', 'CDKN1A','CCNE1')
ORDER BY
  case_barcode,
  HGNC_gene_symbol