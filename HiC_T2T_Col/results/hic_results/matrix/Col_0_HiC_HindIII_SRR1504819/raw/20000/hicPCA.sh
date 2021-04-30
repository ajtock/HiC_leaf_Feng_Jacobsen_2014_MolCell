#!/bin/bash

# hicPCA from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPCA.html

# Usage:
# ./hicPCA.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' KR

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
CORRECTION=$4

source activate HiCExplorer

hicPCA --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.h5 \
       --outputFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_PCA1.bw ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_PCA2.bw \
       --numberOfEigenvectors 2 \
       --format bigwig \
       --chromosomes Chr1 Chr2 Chr3 Chr4 Chr5 \
       --method dist_norm \
       --ligation_factor \
       --extraTrack /home/ajt200/analysis/nanopore/T2T_Col/annotation/genes/T2T_Col_representative_mRNA_Chr1_Chr2_Chr3_Chr4_Chr5.bed

conda deactivate
