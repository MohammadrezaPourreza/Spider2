# `isb-cgc.TCGA_hg38_data_v0.Somatic_Mutation_DR10.md`

## Column details

* [STRING]    `project_short_name`
  - Project name abbreviation; the program name appended with a project name abbreviation; eg. TCGA-OV, etc.
* [STRING]    `case_barcode`
  - Original TCGA case barcode, eg TCGA-DX-A8BN
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
* [INT64]    `Entrez_Gene_Id`
  - Entrez gene ID (an integer). 0 is used for regions that do not correspond to a gene region or Ensembl ID
* [STRING]    `Center`
  - One or more genome sequencing center reporting the variant
* [STRING]    `NCBI_Build`
  - The reference genome used for the alignment (GRCh38)
* [STRING]    `Chromosome`
  - Chromosome, possible values: chr1-22, and chrX
* [INT64]    `Start_Position`
  - Lowest numeric position of the reported variant on the genomic reference sequence. Mutation start coordinate
* [INT64]    `End_Position`
  - Highest numeric genomic position of the reported variant on the genomic reference sequence. Mutation end coordinate
* [STRING]    `Strand`
  - Either + or - to denote whether read mapped to the sense (+) or anti-sense (-) strand
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
  - The rs-IDs from the   dbSNP database, novel if not found in any database used, or null if there is no dbSNP record, but it is found in other databases
* [STRING]    `dbSNP_Val_Status`
  - The dbSNP validation status is reported as a semicolon-separated list of statuses. The union of all rs-IDs is taken when there are multiple
* [STRING]    `Tumor_Validation_Allele1`
  - Secondary data from orthogonal technology. Tumor genotyping (validation) for allele 1. A - symbol for a deletion represents a variant. A - symbol for an insertion represents wild-type allele. Novel inserted sequence for insertion does not include flanking reference bases
* [STRING]    `Tumor_Validation_Allele2`
  - Secondary data from orthogonal technology. Tumor genotyping (validation) for allele 2
* [STRING]    `Mutation_Status`
  - An assessment of the mutation as somatic, germline, LOH, post transcriptional modification, unknown, or none. The values allowed in this field are constrained by the value in the Validation_Status field
* [STRING]    `Validation_Method`
  - The assay platforms used for the validation call
* [STRING]    `Sequencer`
  - Instrument used to produce primary sequence data
* [STRING]    `Tumor_Sample_UUID`
  - Unique GDC identifier for tumor aliquot (10189 unique)
* [STRING]    `Matched_Norm_Sample_UUID`
  - Unique GDC identifier for normal aliquot (10189 unique)
* [STRING]    `HGVSc`
  - The coding sequence of the variant in HGVS recommended format
* [STRING]    `HGVSp`
  - The protein sequence of the variant in HGVS recommended format. p.= signifies no change in the protein
* [STRING]    `HGVSp_Short`
  - Same as the HGVSp column, but using 1-letter amino-acid codes
* [STRING]    `Transcript_ID`
  - Ensembl ID of the transcript affected by the variant
* [STRING]    `Exon_Number`
  - The exon number (out of total number)
* [STRING]    `t_depth`
  - Read depth across this locus in tumor BAM
* [STRING]    `t_ref_count`
  - Read depth supporting the reference allele in tumor BAM
* [STRING]    `t_alt_count`
  - Read depth supporting the variant allele in tumor BAM
* [STRING]    `n_depth`
  - Read depth across this locus in normal BAM
* [STRING]    `all_effects`
  - A semicolon delimited list of all possible variant effects, sorted by priority ([Symbol,Consequence,HGVSp_Short,Transcript_ID,RefSeq,HGVSc,Impact,Canonical,Sift,PolyPhen,Strand])
* [STRING]    `Allele`
  - The variant allele used to calculate the consequence
* [STRING]    `Gene`
  - The gene symbol. In this table, gene symbol is simulated data e.g. ENSG00000251562
* [STRING]    `Feature`
  - Stable Ensembl ID of feature (transcript, regulatory, motif)
* [STRING]    `Feature_type`
  - Type of feature. Currently one of Transcript, RegulatoryFeature, MotifFeature (or blank)
* [STRING]    `One_Consequence`
  - The single consequence of the canonical transcript in  sequence ontology terms, eg missense_variant
* [STRING]    `Consequence`
  - Consequence type of this variant;   sequence ontology terms
* [STRING]    `cDNA_position`
  - Relative position of base pair in the cDNA sequence as a fraction. A - symbol is displayed as the numerator if the variant does not appear in cDNA
* [STRING]    `CDS_position`
  - Relative position of base pair in coding sequence. A - symbol is displayed as the numerator if the variant does not appear in coding sequence
* [STRING]    `Protein_position`
  - Relative position of affected amino acid in protein. A - symbol is displayed as the numerator if the variant does not appear in coding sequence
* [STRING]    `Amino_acids`
  - Amino acid substitution caused by the mutation. Only given if the variation affects the protein-coding sequence
* [STRING]    `Codons`
  - The alternative codons with the variant base in upper case
* [STRING]    `Existing_variation`
  - Known identifier of existing variation
* [STRING]    `ALLELE_NUM`
  - Allele number from input; 0 is reference, 1 is first alternate etc.
* [INT64]    `DISTANCE`
  - Shortest distance from the variant to transcript
* [INT64]    `TRANSCRIPT_STRAND`
  - The DNA strand (1 or -1) on which the transcript/feature lies
* [STRING]    `SYMBOL`
  - Eg TP53, LRP1B, etc (same as Hugo_Symbol field except blank instead of Unknown
* [STRING]    `SYMBOL_SOURCE`
  - The source of the gene symbol, usually HGNC, rarely blank, other sources include Uniprot_gn, EntrezGene, etc
* [STRING]    `HGNC_ID`
  - Gene identifier from the HUGO Gene Nomenclature Committee if applicable
* [STRING]    `BIOTYPE`
  - Biotype of transcript
* [STRING]    `CANONICAL`
  - A flag (YES) indicating that the VEP-based canonical transcript, the longest translation, was used for this gene. If not, the value is null
* [STRING]    `CCDS`
  - The CCDS identifier for this transcript, where applicable
* [STRING]    `ENSP`
  - The Ensembl protein identifier of the affected transcript
* [STRING]    `SWISSPROT`
  - UniProtKB/Swiss-Prot accession
* [STRING]    `TREMBL`
  - UniProtKB/TrEMBL identifier of protein product
* [STRING]    `UNIPARC`
  - UniParc identifier of protein product
* [STRING]    `RefSeq`
  - RefSeq identifier for this transcript
* [STRING]    `SIFT`
  - The  SIFT prediction and/or score, with both given as prediction (score)
* [STRING]    `PolyPhen`
  - The PolyPhen prediction and/or score
* [STRING]    `EXON`
  - The exon number (out of total number)
* [STRING]    `INTRON`
  - The intron number (out of total number)
* [STRING]    `DOMAINS`
  - The source and identifier of any overlapping protein domains
* [FLOAT64]    `GMAF`
  - Non-reference allele and frequency of existing variant in   1000 Genomes
* [FLOAT64]    `AFR_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined African population
* [FLOAT64]    `AMR_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined American population
* [FLOAT64]    `EAS_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined East Asian population
* [FLOAT64]    `EUR_MAF`
  - Non-reference allele and frequency of existing variant in 1000 Genomes combined European population
* [FLOAT64]    `SAS_MAF`
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
  - The impact modifier for the consequence type
* [STRING]    `PICK`
  - Indicates if this block of consequence data was picked by VEP's   pick feature (1 or null)
* [STRING]    `VARIANT_CLASS`
  - Sequence Ontology variant class
* [INT64]    `TSL`
  - Transcript support level, which is based on independent RNA analyses
* [INT64]    `HGVS_OFFSET`
  - Indicates by how many bases the HGVS notations for this variant have been shifted
* [STRING]    `PHENO`
  - Indicates if existing variant is associated with a phenotype, disease or trait (0, 1, or null)
* [STRING]    `MINIMISED`
  - Alleles in this variant have been converted to minimal representation before consequence calculation (1 or null)
* [STRING]    `ExAC_AF`
  - Global Allele Frequency from  ExAC
* [STRING]    `ExAC_AF_Adj`
  - Adjusted Global Allele Frequency from ExAC
* [STRING]    `ExAC_AF_AFR`
  - African/African American Allele Frequency from ExAC
* [STRING]    `ExAC_AF_AMR`
  - American Allele Frequency from ExAC
* [STRING]    `ExAC_AF_EAS`
  - East Asian Allele Frequency from ExAC
* [STRING]    `ExAC_AF_FIN`
  - Finnish Allele Frequency from ExAC
* [STRING]    `ExAC_AF_NFE`
  - Non-Finnish European Allele Frequency from ExAC
* [STRING]    `ExAC_AF_OTH`
  - Other Allele Frequency from ExAC
* [STRING]    `ExAC_AF_SAS`
  - South Asian Allele Frequency from ExAC
* [STRING]    `FILTER`
  - Copied from input VCF. This includes filters implemented directly by the variant caller and other external software used in the DNA-Seq pipeline. See below for additional details.
* [STRING]    `CONTEXT`
  - The reference allele per VCF specs, and its five flanking base pairs
* [STRING]    `src_vcf_id`
  - |-delimited list of GDC VCF file identifiers
* [STRING]    `tumor_bam_uuid`
  - Unique GDC identifier for the underlying tumor bam file
* [STRING]    `normal_bam_uuid`
  - Unique GDC identifier for the underlying normal bam file
* [STRING]    `case_id`
  - Unique GDC identifier for the case
* [STRING]    `GDC_FILTER`
  - GDC filters applied universally across all MAFs
* [STRING]    `COSMIC`
  - Overlapping COSMIC variants
* [STRING]    `MC3_Overlap`
  - Indicates whether this region overlaps with an MC3 variant for the same sample pair
* [STRING]    `GDC_Validation_Status`
  - GDC implementation of validation checks. See notes section (#5) below for details
* [STRING]    `callerName`
  - |-delimited list of mutation caller(s) that agreed on this particular call, always in alphabetical order: muse, mutect, somaticsniper, varscan
* [STRING]    `fileUUID`
  - |-delimited list of unique GDC identifier for underlying MAF file
* [STRING]    `fileName`
  - |-delimited list of name of underlying MAF file

