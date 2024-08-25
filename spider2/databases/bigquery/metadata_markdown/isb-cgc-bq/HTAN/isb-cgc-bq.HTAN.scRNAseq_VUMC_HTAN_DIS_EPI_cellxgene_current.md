# `isb-cgc-bq.HTAN.scRNAseq_VUMC_HTAN_DIS_EPI_cellxgene_current.md`

## Column details

* [INT64]    `iObs`
  - Index to cell barcodes
* [INT64]    `iVar`
  - Index to gene IDs
* [FLOAT64]    `X_value`
  - Expression value for a given gene and cell
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `HTAN_Specimen_ID`
  - HTAN ID associated with a biosample based on HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `author_cell_type`
  - ABS = absorptive cells, TUF = tuft cells, EE = enteroendocrine cells, ASC = adenoma specific cells, TAC = transient amplifying cells, CT = crypt top cells, GOB = goblet cells, SSC= serrated specific cells, STM = stem cells
* [STRING]    `Polyp_Type`
  - TA = tubular adenoma, HP = hyperplastic polyp, TVA = tubulovillus adenoma, SSL = sessile serrated lesion, UNC = unclassified, NL = normal
* [STRING]    `Sample_Classification`
  - AD = conventional adenoma, SER = serrated polyp, UNC = unclassified, NL = normal
* [STRING]    `cell_type_ontology_term_id`
  - Cell Ontology ID (i.e. CL:0000784)  (REF: https://www.ebi.ac.uk/ols/ontologies/cl)
* [STRING]    `disease_ontology_term_id`
  - MONDO disease ontology ID (REF: https://www.ebi.ac.uk/ols/ontologies/mondo) (ex. MONDO:0100426 or PATO:0000461 for 'normal')
* [STRING]    `donor_id`
  - Identifies a unique individual that data were derived from
* [STRING]    `assay_ontology_term_id`
  - Experimental Factor Ontology ID (REF: https://www.ebi.ac.uk/ols/ontologies/efo)
* [STRING]    `tissue_ontology_term_id`
  - Uber-anatomy ontology ID (REF: https://www.ebi.ac.uk/ols/ontologies/uberon) (ex.UBERON:2001190)
* [STRING]    `sex_ontology_term_id`
  - Phenotype And Trait Ontology ID, PATO:0000384 for male, PATO:0000383 for female, or unknown if unavailable
* [STRING]    `development_stage_ontology_term_id`
  - Human Developmental Stages ID (REF: https://www.ebi.ac.uk/ols/ontologies/hsapdv) or Mouse Developmental Stages ID (REF: https://www.ebi.ac.uk/ols/ontologies/mmusdv) (HsapDv if human, MmusDv if mouse, unknown if information unavailable)
* [STRING]    `self_reported_ethnicity_ontology_term_id`
  - If human, the Human Ancestry Ontology ID (i.e. HANCESTRO:0005) (REF: https://www.ebi.ac.uk/ols/ontologies/hancestro); "multiethnic" if more than one ethnicity. "Unknown" if human and no information, else "na" if non-human
* [STRING]    `organism_ontology_term_id`
  - NCBITaxon ID (REF: https://www.ncbi.nlm.nih.gov/taxonomy) (ex. NCBITaxon:9606 for human, NCBITaxon:10090 for mouse)
* [STRING]    `suspension_type`
  - Cell, nucleus, or na, as corresponding to sample preparation
* [BOOL]    `is_primary_data`
  - Indicates if the sample is primary or not (True/False)
* [STRING]    `cell_type`
  - The type of cell (i.e. T-cell)
* [STRING]    `assay`
  - An assay based on 10X Genomics. Example : 100x3’ v2
* [STRING]    `disease`
  - Description of disease (example: lung adenocarcinoma) or normal cells
* [STRING]    `organism`
  - The genus and species from which biosamples are derived
* [STRING]    `sex`
  - Phenotypic sex
* [STRING]    `tissue`
  - Derived from UBERON or CL terms that best describes the tissue that the cell was derived from.
* [STRING]    `self_reported_ethnicity`
  - Ethnicity of the individual (obtained from HANCESTRO terms for Homo sapiens)
* [STRING]    `development_stage`
  - Human development stage derived from HsapDv term  (Example if data is Homo sapiens, development stage is obtained from Link. HsapDv:0000114 - 20-year-old human stage)
* [BOOL]    `feature_is_filtered`
  - Indicates if the feature (gene) was/should be filtered in analysis
* [STRING]    `feature_name`
  - Gene name from HUGO Human Gene Nomenclature Committee (https://www.genenames.org/)
* [STRING]    `feature_reference`
  - A reference to the feature: NCBI Taxonomy ID
* [STRING]    `feature_biotype`
  - Biological type of feature (e.g. gene)

