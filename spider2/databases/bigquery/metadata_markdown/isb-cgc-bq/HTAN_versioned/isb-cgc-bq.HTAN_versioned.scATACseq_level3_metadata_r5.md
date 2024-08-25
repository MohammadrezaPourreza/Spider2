# `isb-cgc-bq.HTAN_versioned.scATACseq_level3_metadata_r5.md`

## Column details

* [STRING]    `LowMapQ`
  - Number of read-pairs with <30 mapq on at least one end
* [STRING]    `TSS_Fragments`
  - Number of fragments overlapping with TSS regions
* [STRING]    `TSS_Enrichment`
  - Transcription start site (TSS) enrichment score
* [STRING]    `Passed_Filters`
  - Number of non-duplicate, usable read-pairs i.e. fragments
* [STRING]    `TSS_Percentile`
  - Percentile rank of TSS score
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `Peak_Region_Fragments`
  - Number of fragments overlapping peaks
* [STRING]    `Component`
  - Category of metadata (e.g. Diagnosis, Biospecimen, scRNA-seq Level 1, etc.); provide the same one for all items/rows.
* [STRING]    `Promoter_Region_Fragments`
  - Number of fragments overlapping promoter regions
* [STRING]    `Unmapped_Read_Pairs`
  - Number of read-pairs with at least one end not mapped
* [STRING]    `MACS2_Name`
  - Name of the peak in MACS2
* [STRING]    `Total_Read_Pairs`
  - Total read-pairs
* [STRING]    `Seurat_Clusters`
  - Clusters of cells by a shared nearest neighbor (SNN) modularity optimization based clustering algorithm
* [STRING]    `Nucleosome_Signal`
  - Nucleosome signal score (strength of the nucleosome signal per cell, computed as the ratio of fragments between 147 bp and 294 bp (mononucleosome) to fragments < 147 bp (nucleosome-free))
* [STRING]    `Nucleosome_Percentile`
  - Percentile rank of nucleosome score
* [STRING]    `Mitochondrial_Read_Pairs`
  - Number of read-pairs mapping to mitochondria and non-nuclear contigs
* [STRING]    `nFeature_RNA`
  - Number of genes detected in cell
* [STRING]    `HTAN_Parent_Data_File_ID`
  - HTAN Data File Identifier indicating the file(s) from which these files were derived
* [STRING]    `MACS2_Start`
  - Genomic starting position in MACS2
* [STRING]    `MACS2_Neg_Log10_qvalue_Summit`
  - Negative log10 q-value for the peak summit in MACS2
* [STRING]    `Blacklist_Region_Fragments`
  - Number of fragments overlapping blacklisted regions
* [STRING]    `MACS2_Neg_Log10_pvalue_Summit`
  - Negative log10 p-value for the peak summit in MACS2
* [STRING]    `Duplicate_Read_Pairs`
  - Number of duplicate read-pairs
* [STRING]    `On_Target_Fragments`
  - Number of fragments overlapping any of TSS, enhancer, promoter and DNase hypersensitivity sites (counted with multiplicity)
* [STRING]    `MACS2_Relative_Summit_Position`
  - Position of the peak summit related to the start position in MACS2
* [STRING]    `DNase_Sensitive_Region_Fragments`
  - Number of fragments overlapping with DNase sensitive regions
* [STRING]    `Filename`
  - Name of a file
* [STRING]    `entityId`
  - Synapse ID of entity
* [STRING]    `MACS2_Score`
  - Peak score (proportional to q-value) in MACS2
* [STRING]    `scATAC_seq_Object_ID`
  - Orig.Ident or scATAC-seq Object ID
* [STRING]    `MACS2_Seqnames`
  - Chromosome id
* [STRING]    `MACS2_End`
  - Genomic ending position in MACS2
* [STRING]    `Enhancer_Region_Fragments`
  - Number of fragments overlapping enhancer regions
* [STRING]    `MACS2_Width`
  - Width of the peak in bases in MACS2
* [STRING]    `nFeature_Peaks`
  - Number of peaks with at least one read
* [STRING]    `nCount_RNA`
  - Total number of fragments in genes
* [STRING]    `Chimeric_Read_Pairs`
  - Number of chimerically mapped read-pairs
* [STRING]    `Pct_Reads_in_Peaks`
  - Percentage of reads in peaks
* [STRING]    `Blacklist_Ratio`
  - Ratio of reads in blacklist regions
* [STRING]    `Id`
  - Unique identifier of entity e.g. a96059eb-81af-4b24-ae50-9242c0d8f819
* [STRING]    `MACS2_Fold_Change`
  - Fold enrichment for this peak summit against random Poisson distribution with local lambda in MACS2
* [STRING]    `nCount_Peaks`
  - Total number of fragments in peaks
* [STRING]    `Peak_Region_Cutsites`
  - Number of ends of fragments in peak regions
* [STRING]    `File_Format`
  - Format of a file (e.g. txt, csv, fastq, bam, etc.)
* [STRING]    `MACS2_Strand`
  - DNA stand aligned with in MACS2
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `Manifest_Id`
  - Synapse ID of manifest containing file annotation
* [INT64]    `Manifest_Version`
  - Latest version of metadata manifest
* [INT64]    `File_Size`
  - Size of file (bucket object) in bytes
* [STRING]    `md5`
  - md5 hash of file
* [STRING]    `Data_Release`
  - Inclusion in HTAN Data Release e.g. Release 1.0
* [STRING]    `CDS_Release`
  - CDS transfer package in which file was included e.g. v22.6.1.seq

