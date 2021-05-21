#!/bin/bash

# hicFindTADs from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicFindTADs.html

# Usage:
# csmit -m 20G -c 47 "bash ./hicFindTADs.sh log2ratio_met1_3_HiC_HindIII_SRR1504825_Col_0_HiC_HindIII_SRR1504819 T2T_Col '1000' norm_range KR 0.05"

SAMPLE1=$1
GENOME=$2
RESOLUTION=$3
NORM=$4
CORRECTION=$5
THRESHOLD=$6

source activate HiCExplorer

hicFindTADs --matrix ${SAMPLE1}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5 \
            --outPrefix ${SAMPLE1}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}_threshold${THRESHOLD} \
            --correctForMultipleTesting fdr \
            --thresholdComparisons ${THRESHOLD} \
            --delta 0.01 \
            --minDepth $(expr $RESOLUTION \* 3) \
            --maxDepth $(expr $RESOLUTION \* 10) \
            --step ${RESOLUTION} \
            --chromosomes Chr1 Chr2 Chr3 Chr4 Chr5 \
            --numberOfProcessors 48

conda deactivate
