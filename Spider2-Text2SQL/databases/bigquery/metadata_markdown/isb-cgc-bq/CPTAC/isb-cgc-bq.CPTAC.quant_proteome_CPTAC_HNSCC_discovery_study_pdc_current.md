# `isb-cgc-bq.CPTAC.quant_proteome_CPTAC_HNSCC_discovery_study_pdc_current.md`

## Column details

* [STRING]    `case_id`
  - Unique identifier associated with a specific patient (e.g. 24cb0fcb-63d6-11e8-bcf1-0a2705229b82)
* [STRING]    `sample_id`
  - Unique PDC identifier for this sample (e.g. e8d83eb9-693a-11ea-b1fd-0aad30af8a83)
* [STRING]    `aliquot_id`
  - Unique PDC identifier for this aliquot (e.g. e8db124a-693a-11ea-b1fd-0aad30af8a83)
* [STRING]    `aliquot_submitter_id`
  - Aliquot submitter id assigned by program (e.g. T14)
* [STRING]    `aliquot_run_metadata_id`
  - Uniquely identifies the aliquot by how it was used in the experiment (based on the labelling reagent and/or biological replicate)
* [STRING]    `study_name`
  - Name of the study (e.g. Pediatric Brain Cancer Pilot Study - Phosphoproteome)
* [FLOAT64]    `protein_abundance_log2ratio`
  - Average log-ratio of sample reporter-ion to common reference of peptide ions associated with the gene in acquisitions from a specific biological sample
* [STRING]    `gene_id`
  - Unique gene identifier assigned by PDC
* [STRING]    `gene_symbol`
  - Gene symbol, sourced by PDC from NCBI
* [STRING]    `NCBI_gene_id`
  - NCBI gene identifier
* [STRING]    `authority`
  - Designating authority for the gene id
* [STRING]    `authority_gene_id`
  - Unique identifier assigned by authority (e.g. HGNC)
* [STRING]    `gene_description`
  - Description of the gene, sourced by PDC from NCBI
* [STRING]    `organism`
  - Gene organism, sourced by PDC from NCBI
* [STRING]    `chromosome`
  - NCBI gene chromosome
* [STRING]    `locus`
  - Gene cytoband, sourced by PDC from NCBI
* [STRING]    `uniprotkb_id`
  - Oldest UniProt id found in 'proteins' column list, derived programmatically
* [STRING]    `uniprotkb_ids`
  - Every UniProt id found in 'proteins' column list
* [STRING]    `proteins`
  - Semi-colon separated list of protein accessions associated with the gene; includes identifiers from multiple sources (e.g. UniProt, NCBI RefSeq database)
* [STRING]    `assays`
  - CPTAC Assay accessions for the peptides associated with the gene

