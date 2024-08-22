# `isb-cgc.TCGA_hg19_data_v0.Somatic_Mutation_MC3.md`

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
* [STRING]    `Hugo_Symbol`
  - HUGO symbol for the gene (HUGO symbols are always in all caps). Unknown is used for regions that do not correspond to a gene
* [STRING]    `NCBI_Build`
  - The reference genome used for the alignment (GRCh37)
* [STRING]    `Chromosome`
  - Chromosome, possible values: 1, X, etc (ie does not include chr prefix)
* [INT64]    `Start_Position`
  - Lowest numeric position of the reported variant on the genomic reference sequence. Mutation start coordinate
* [INT64]    `End_Position`
  - End position, in 1-based integer coordinates
* [STRING]    `Variant_Classification`
  - Translational effect of variant allele
* [STRING]    `Variant_Type`
  - Type of mutation. TNP (tri-nucleotide polymorphism) is analogous to DNP (di-nucleotide polymorphism) but for three consecutive nucleotides. ONP (oligo-nucleotide polymorphism) is analogous to TNP but for consecutive runs of four or more (SNP, DNP, TNP, ONP, INS, DEL, or Consolidated)
* [STRING]    `Reference_Allele`
  - The plus strand reference allele at this position. Includes the deleted sequence for a deletion or - for an insertion
* [STRING]    `Tumor_Seq_Allele1`
  - Primary data genotype for tumor sequencing (discovery) allele 1. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases
* [STRING]    `Tumor_Seq_Allele2`
  - Primary data genotype for tumor sequencing (discovery) allele 2. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases
* [STRING]    `dbSNP_RS`
  - Rs-IDs from the dbSNP database, novel if not found in any database used, or null if there is no dbSNP record, but it is found in other databases
* [STRING]    `HGVSc`
  - Coding sequence of the variant in HGVS recommended format
* [STRING]    `HGVSp`
  - Protein sequence of the variant in HGVS recommended format. p.= signifies no change in the protein
* [STRING]    `HGVSp_Short`
  - Same as the HGVSp column, but using 1-letter amino-acid codes
* [STRING]    `Transcript_ID`
  - Ensembl ID of the transcript affected by the variant
* [STRING]    `Exon_Number`
  - Exon number (out of total number)
* [INT64]    `t_depth`
  - Read depth across this locus in tumor BAM
* [INT64]    `t_ref_count`
  - Read depth supporting the reference allele in tumor BAM
* [INT64]    `t_alt_count`
  - Read depth supporting the variant allele in tumor BAM
* [INT64]    `n_depth`
  - Read depth across this locus in normal BAM
* [INT64]    `n_ref_count`
  - Read depth supporting the reference allele in normal BAM (cleared in somatic MAF)
* [INT64]    `n_alt_count`
  - Read depth supporting the variant allele in normal BAM (cleared in somatic MAF)
* [STRING]    `all_effects`
  - A semicolon delimited list of all possible variant effects, sorted by priority ([Symbol,Consequence,HGVSp_Short,Transcript_ID,RefSeq,HGVSc,Impact,Canonical,Sift,PolyPhen,Strand])
* [STRING]    `Gene`
  - The gene symbol. In this table, gene symbol is simulated data e.g. ENSG00000251562
* [STRING]    `Feature`
  - Stable Ensembl ID of feature (transcript, regulatory, motif)
* [STRING]    `Feature_type`
  - Type of feature. Currently one of Transcript, RegulatoryFeature, MotifFeature (or blank)
* [STRING]    `Consequence`
  - Consequence type of this variant; sequence ontology terms
* [STRING]    `cDNA_position`
  - Relative position of base pair in the cDNA sequence as a fraction. A - symbol is displayed as the numerator if the variant does not appear in cDNA
* [STRING]    `CDS_position`
  - Relative position of base pair in coding sequence. A - symbol is displayed as the numerator if the variant does not appear in coding sequence
* [STRING]    `Protein_position`
  - Relative position of affected amino acid in protein. A - symbol is displayed as the numerator if the variant does not appear in coding sequence
* [STRING]    `Amino_acids`
  - Amino acid substitution caused by the mutation, only given if the variation affects the protein-coding sequence
* [STRING]    `Codons`
  - Alternative codons with the variant base in upper case
* [STRING]    `Existing_variation`
  - Known identifier of existing variation
* [INT64]    `DISTANCE`
  - Shortest distance from the variant to transcript
* [INT64]    `STRAND`
  - DNA strand (1 or -1) on which the transcript/feature lies
* [STRING]    `SYMBOL`
  - Eg TP53, LRP1B, etc (same as Hugo_Symbol field except blank instead of Unknown
* [STRING]    `SYMBOL_SOURCE`
  - The source of the gene symbol, usually HGNC, rarely blank, other sources include Uniprot_gn, EntrezGene, etc
* [INT64]    `HGNC_ID`
  - Gene identifier from the HUGO Gene Nomenclature Committee if applicable
* [STRING]    `BIOTYPE`
  - Biotype of transcript
* [STRING]    `CANONICAL`
  - A flag (YES) indicating that the VEP-based canonical transcript, the longest translation, was used for this gene, if not, the value is null
* [STRING]    `CCDS`
  - CCDS identifier for this transcript, where applicable
* [STRING]    `ENSP`
  - Ensembl protein identifier of the affected transcript
* [STRING]    `SWISSPROT`
  - UniProtKB/Swiss-Prot accession
* [STRING]    `TREMBL`
  - UniProtKB/TrEMBL identifier of protein product
* [STRING]    `UNIPARC`
  - UniParc identifier of protein product
* [STRING]    `SIFT`
  - SIFT prediction and/or score, with both given as prediction (score)
* [STRING]    `PolyPhen`
  - PolyPhen prediction and/or score
* [STRING]    `EXON`
  - Exon number (out of total number)
* [STRING]    `INTRON`
  - Intron number (out of total number)
* [STRING]    `DOMAINS`
  - Source and identifier of any overlapping protein domains
* [STRING]    `GMAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes
* [STRING]    `AFR_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined African population
* [STRING]    `AMR_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined American population
* [STRING]    `ASN_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined Asian population
* [STRING]    `EAS_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined East Asian population
* [STRING]    `EUR_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined European population
* [STRING]    `SAS_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined South Asian population
* [STRING]    `AA_MAF`
  - Non-reference allele and frequency of existing variant in NHLBI-ESP African American population
* [STRING]    `EA_MAF`
  - Non-reference allele and frequency of existing variant in NHLBI-ESP European American population
* [STRING]    `CLIN_SIG`
  - Clinical significance of variant from dbSNP
* [STRING]    `SOMATIC`
  - Somatic status of each ID reported under Existing_variation (0, 1, or null)
* [STRING]    `PUBMED`
  - Pubmed ID(s) of publications that cite existing variant
* [STRING]    `IMPACT`
  - Impact modifier for the consequence type
* [STRING]    `VARIANT_CLASS`
  - Sequence Ontology variant class
* [INT64]    `HGVS_OFFSET`
  - Indicates by how many bases the HGVS notations for this variant have been shifted
* [STRING]    `PHENO`
  - Indicates if existing variant is associated with a phenotype, disease or trait (0, 1, or null)
* [STRING]    `FILTER`
  - Copied from input VCF. This includes filters implemented directly by the variant caller and other external software used in the DNA-Seq pipeline
* [STRING]    `COSMIC`
  - Overlapping COSMIC variants
* [STRING]    `CALLERS`
  - |-delimited list of mutation caller(s) that agreed on this particular call, always in alphabetical order: muse, mutect, somaticsniper, varscan
* [STRING]    `CONTEXT`
  - Reference allele per VCF specs, and its five flanking base pairs
* [STRING]    `DBVS`
  - |-delimited list eg byCluster|by1000G
* [INT64]    `NCALLERS`
  - Number of callers: a value between 2 and 8 (most common is 5)

