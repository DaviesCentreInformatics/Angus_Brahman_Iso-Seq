# Long read isoform sequencing reveals hidden transcriptional complexity between cattle subspecies

Here you will find scripts used for the paper "Long read isoform sequencing reveals hidden transcriptional complexity between cattle subspecies".

## Overview of methods
![Fig_S1 Flowchart](https://user-images.githubusercontent.com/25737808/196599241-727efe93-9409-446d-bfe9-4c96000fc001.png)


## The scripts to analyse Iso-Seq data are listed in folder Pacbio_R.

* 1_IsoSeq_Gene.Rmd: 
*Call genes from the Isoseq data and filter for expressed genes.*

* 2_IsoSeq_DEG.Rmd: 
*Calculate DEGs using Limma linear module.*

* 3_IsoSeq_transcript.Rmd: 
*Call transcripts from the Isoseq data and filter for expressed transcripts.*

* 4_IsoSeq_transcript_tappAS.Rmd: 
*Make the tappAS inputs for DETs identification.*

* 5_IsoSeq_DET.Rmd: 
*Calculate DETs using Limma linear module.*

* 6_IsoSeq_DTU.Rmd: 
*Calculate differentical transcript usage using DRIMSeq library with Isoseq data.*

* 7_IsoSeq_transcript_TPM.Rmd: 
*Covert the counts of trancripts to TPM values.*

* 8_IsoSeq_transcript_structures.Rmd: 
*Check the transcript structures of a few genes of interested.*

* 9_IsoSeq_transcript_structures_PB.35887.Rmd: 
*Check the transcript structures for gene PB.35887.*

## The scripts to analyse RNAseq data are listed in folder RNAseq_R.

* 1_RNAseq_DEG_Alltissues.Rmd:
*Calculate the DEG for previous all tissue data and check the concordance with current data.*

* 2_RNAseq_feature_count_gene.Rmd:
*Call genes using featurecount.*

* 3_RNAseq_feature_count_transcript.Rmd:
*Call transcripts using featurecount.*

* 4_Correlation_matrix.Rmd:
*Make the correlation matrix for gene and transcripts levels.*

* 5_RNAseq_HTSEQ_DEG.Rmd:
*Call genes and calculate the DEGs using HTSEQ.*

* 6_RNAseq_kallisto_DEG.Rmd:
*Calculate DEGs using the genes from kallisto.*

* 7_RNAseq_kallisto_DET.Rmd:
*Calculate DETs using the transcripts from kallisto.*

* 8_RNAseq_feature_count_DEG.Rmd:
*Calculate DEGs using the gene from featurecount.*

* 9_RNAseq_feature_count_DET.Rmd:
*Calculate DETs using the transcripts from featurecount.*

* 10_RNAseq_DTU.Rmd:
*Calculate differentical transcript usage using DRIMSeq library with RNAseq data.*


## The scripts to compare and combine Isoseq and RNAseq data are listed in folder Isoseq_vs_RNAseq.

* The script IsoSeq_rarefraction.R was used to check the sequencing depths for both datasets.


* 11_Combined_Isoseq_vs_RNAseq.Rmd:
*Compare the genes and transcripts identified from Isoseq and RNaseq data.*

* 12_Combined_upset_plot.Rmd:
*Make the upset plots for DEGs in different groups.*

* 13_Combined_Transcriptome_characterization.Rmd:
*Characterize different groups of transcriptome for RNAseq data.*

* 14_Combined_Check_multi_mapping.Rmd:
*Check the multi mapping rates for genes that identified as DEGs.*

* 15_Combined_Check_overlap_genes.Rmd:
*Check the percentage of overlapping genes for genes that identified as DEGs.*
