#!/bin/bash

# hicCompareMatrices from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicCompareMatrices.html

# Usage:
# ./hicCompareMatrices.sh met1_3_HiC_HindIII_SRR1504825 Col_0_HiC_HindIII_SRR1504819 T2T_Col '20000' norm_range KR log2ratio 

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4
NORM=$5
CORRECTION=$6
OPERATION=$7

source activate HiCExplorer

hicCompareMatrices --matrices ${SAMPLE1}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5 ${SAMPLE2}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5 \
                   --outFileName ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5 \
                   --operation ${OPERATION}

conda deactivate
