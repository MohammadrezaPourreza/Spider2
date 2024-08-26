# `isb-cgc.TCGA_hg19_data_v0.Somatic_Mutation_DCC.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-12-1089  --  note that each case typically has a primary-tumor sample and a matched-normal (blood or adjacent tissue) sample; please refer to the TCGA Biospecimen table for more details
* [STRING]    `sample_barcode_tumor`
  - TCGA sample barcode for the tumor, eg TCGA-12-1089-01A. One sample may have multiple sets of CN segmentations corresponding to multiple aliquots; use GROUP BY appropriately in queries
* [STRING]    `sample_barcode_normal`
  - TCGA sample barcode for the normal control, eg TCGA-12-1089-01A. One sample may have multiple sets of CN segmentations corresponding to multiple aliquots; use GROUP BY appropriately in queries
* [STRING]    `aliquot_barcode_tumor`
  - TCGA aliquot barcode for the tumor, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `aliquot_barcode_normal`
  - TCGA aliquot barcode for the normal control, eg TCGA-12-1089-01A-01D-0517-01
* [STRING]    `NCBI_Build`
  - The reference genome used for the alignment (GRCh37)
* [STRING]    `HGNC_UniProt_ID_Supplied_By_UniProt`
  - UniProt ID
* [INT64]    `Entrez_Gene_Id`
  - Entrez gene ID (an integer). 0 is used for regions that do not correspond to a gene region or Ensembl ID
* [STRING]    `Variant_Classification`
  - Translational effect of variant allele
* [STRING]    `Variant_Type`
  - Type of mutation. TNP (tri-nucleotide polymorphism) is analogous to DNP (di-nucleotide polymorphism) but for three consecutive nucleotides. ONP (oligo-nucleotide polymorphism) is analogous to TNP but for consecutive runs of four or more (SNP, DNP, TNP, ONP, INS, DEL, or Consolidated)
* [STRING]    `Chromosome`
  - Chromosome, possible values: chr1-22, and chrX
* [INT64]    `Start_Position`
  - Lowest numeric position of the reported variant on the genomic reference sequence. Mutation start coordinate
* [INT64]    `End_Position`
  - End position, in 1-based integer coordinates
* [STRING]    `Mutation_Status`
  - An assessment of the mutation as somatic, germline, LOH, post transcriptional modification, unknown, or none. The values allowed in this field are constrained by the value in the Validation_Status field
* [STRING]    `Genome_Change`
  - Location and Base Genome Change
* [STRING]    `cDNA_Change`
  - CDNA change. Examples: c.3236G>A,c.143_147delCTGCC, c.4417_4418insCAA
* [STRING]    `Protein_Change`
  - Changes an amino acid to another amino acid e.g. p.G464V
* [STRING]    `Annotation_Transcript`
  - Ensembl Annotation Transcript ID (e.g. ENST00000366560.3)
* [INT64]    `CCLE_ONCOMAP_Total_Mutations_In_Gene`
  - Total number of mutations in genes in CCLE Oncomap data
* [STRING]    `Center`
  - One or more genome sequencing center reporting the variant
* [INT64]    `COSMIC_Total_Alterations_In_Gene`
  - Total Alteration in Gene
* [STRING]    `DbSNP_RS`
  - dbSNP reference SNP number, eg rs121913500 -- may be a comma-delimited list, or may be null
* [STRING]    `DbSNP_Val_Status`
  - DbSNP validation status is reported as a semicolon-separated list of statuses. The union of all rs-IDs is taken when there are multiple
* [STRING]    `DNARepairGenes_Role`
  - DNA Repair Genes Role
* [STRING]    `DrugBank`
  - Associated Drug Bank Names and IDs
* [FLOAT64]    `GC_Content`
  - Percent GC content
* [STRING]    `GENCODE_Transcript_Name`
  - Transcript Name from GENCODE
* [STRING]    `GENCODE_Transcript_Status`
  - Transcript Status from GENCODE
* [STRING]    `GENCODE_Transcript_Type`
  - Transcript Type from GENCODE, for more information: https://www.gencodegenes.org/pages/biotypes.html
* [STRING]    `Gene_Type`
  - Gene type. eg protein_coding, lincRNA, etc
* [STRING]    `GO_Biological_Process`
  - GO Biological Process, for more information: http://geneontology.org/docs/ontology-documentation/
* [STRING]    `GO_Cellular_Component`
  - GO Cellular Component. For more information: http://geneontology.org/docs/ontology-documentation/
* [STRING]    `GO_Molecular_Function`
  - GO Molecular Function, for more information: http://geneontology.org/docs/ontology-documentation/
* [STRING]    `HGNC_Accession_Numbers`
  - HGNC Accession Numbers
* [STRING]    `HGNC_CCDS_IDs`
  - HGNC CCDS IDs
* [STRING]    `HGNC_Ensembl_ID_Supplied_By_Ensembl`
  - Ensembl ID
* [INT64]    `HGNC_HGNC_ID`
  - HGNC ID
* [STRING]    `HGNC_Locus_Group`
  - HGNC Locus Group
* [STRING]    `HGNC_Locus_Type`
  - HGNC Locus Type
* [STRING]    `HGNC_OMIM_ID_Supplied_By_NCBI`
  - OMIM ID
* [STRING]    `HGNC_RefSeq_Supplied_By_NCBI`
  - RefSeq ID
* [STRING]    `HGNC_UCSC_ID_Supplied_By_UCSC`
  - UCSC ID
* [STRING]    `Hugo_Symbol`
  - HUGO symbol for the gene (HUGO symbols are always in all caps). Unknown is used for regions that do not correspond to a gene
* [STRING]    `Normal_Seq_Allele1`
  - Primary data genotype. Matched normal sequencing allele 1. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases (cleared in somatic MAF)
* [STRING]    `Normal_Seq_Allele2`
  - Matched normal sequencing allele 2
* [STRING]    `Normal_Validation_Allele1`
  - Secondary data from orthogonal technology. Matched normal genotyping (validation) for allele 1. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases (cleared in somatic MAF)
* [STRING]    `Normal_Validation_Allele2`
  - Secondary data from orthogonal technology. Matched normal genotyping (validation) for allele 2 (cleared in somatic MAF)
* [STRING]    `OREGANNO_ID`
  - Open Regulatory Annotation Database Id. Example: OREG0026204, OREG0023259
* [STRING]    `Ref_Context`
  - Reference allele per VCF specs, and its five flanking base pairs
* [STRING]    `Reference_Allele`
  - The plus strand reference allele at this position. Includes the deleted sequence for a deletion or - for an insertion
* [STRING]    `Refseq_Prot_Id`
  - RefSeq Protein ID e.g. NP_000134.2
* [STRING]    `Secondary_Variant_Classification`
  - Secondary Variant Classification
* [STRING]    `Sequencer`
  - Instrument used to produce primary sequence data
* [STRING]    `Sequence_Source`
  - Molecular assay type used to produce the analytes used for sequencing. Allowed values are a subset of the SRA 1.5 library_strategy field values. This subset matches those used at CGHub
* [STRING]    `SwissProt_Acc_Id`
  - SwissProt Accesssion ID
* [STRING]    `SwissProt_Entry_Id`
  - SwissProt Entry ID
* [INT64]    `Transcript_Exon`
  - Transcript Exon
* [STRING]    `Transcript_Position`
  - Transcript Position
* [STRING]    `Transcript_Strand`
  - DNA strand (1 or -1) on which the transcript/feature lies
* [STRING]    `Tumor_Seq_Allele1`
  - Primary data genotype for tumor sequencing (discovery) allele 1. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases
* [STRING]    `Tumor_Seq_Allele2`
  - Primary data genotype for tumor sequencing (discovery) allele 2. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases
* [STRING]    `Tumor_Validation_Allele1`
  - Secondary data from orthogonal technology. Tumor genotyping (validation) for allele 1. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases
* [STRING]    `Tumor_Validation_Allele2`
  - Secondary data from orthogonal technology. Tumor genotyping (validation) for allele 2
* [INT64]    `UniProt_AApos`
  - UniProt AA position
* [STRING]    `UniProt_Region`
  - UniProt Region
* [STRING]    `Validation_Method`
  - The assay platforms used for the validation call

