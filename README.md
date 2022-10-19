# Angus_Brahman_Isoseq

Here listed the scripts used for paper "Comparison of Isoseq and RNAseq reveals hidden transcriptional complexity in cattle".

## The analysis structure
![Fig_S1 Flowchart](https://user-images.githubusercontent.com/25737808/196599241-727efe93-9409-446d-bfe9-4c96000fc001.png)


## The scripts to analysis Isoseq data are listed in folder Pacbio_R.

* 1_IsoSeq_Gene.Rmd: Call genes from the Isoseq data and filter for expressed genes.
* 2_IsoSeq_DEG.Rmd: Calculate DEGs using Limma linear module.
* 3_IsoSeq_transcript.Rmd: Call transcripts from the Isoseq data and filter for expressed transcripts.
* 4_IsoSeq_transcript_tappAS.Rmd: Make the tappAS inputs for DETs identification.
* 5_IsoSeq_DET.Rmd: Calculate DETs using Limma linear module.
* 6_IsoSeq_DTU.Rmd: Calculate differentical transcript usage using DRIMSeq library.
* 7_IsoSeq_transcript_TPM.Rmd: Covert the counts of trancripts to TPM values.
* 8_IsoSeq_transcript_structures.Rmd: Check the transcript structures of a few genes of interested.
* 8_IsoSeq_transcript_structures_PB.35887.Rmd: Check the transcript structures for gene PB.35887 .

## The scripts to analysis RNAseq data are listed in folder RNAseq_R.


## The scripts to compare and combine Isoseq and RNAseq data are listed in folder Isose_vs_RNAseq.

* The sctipt IsoSeq_rarefraction.R was used to check the sequencing depths for both datasets.
