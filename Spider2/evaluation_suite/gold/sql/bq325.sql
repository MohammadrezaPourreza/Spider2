WITH ranked_genes AS (
    SELECT 
        locus2gene.study_id, 
        genes.gene_name, 
        lead_variants.pval,
        ROW_NUMBER() OVER (
            PARTITION BY locus2gene.study_id, genes.gene_name 
            ORDER BY lead_variants.pval
        ) AS rn
    FROM 
        `bigquery-public-data.open_targets_genetics.locus2gene` AS locus2gene
    INNER JOIN 
        `bigquery-public-data.open_targets_genetics.studies` AS study_metadata
        ON locus2gene.study_id = study_metadata.study_id
    INNER JOIN 
        `bigquery-public-data.open_targets_genetics.genes` AS genes
        ON locus2gene.gene_id = genes.gene_id
    INNER JOIN 
        `bigquery-public-data.open_targets_genetics.variant_disease` AS lead_variants
        ON locus2gene.pos = lead_variants.lead_pos
        AND locus2gene.chrom = lead_variants.lead_chrom
        AND locus2gene.study_id = lead_variants.study_id
)
SELECT 
    gene_name
FROM 
    ranked_genes
WHERE 
    rn = 1
ORDER BY 
    pval ASC
LIMIT 10;