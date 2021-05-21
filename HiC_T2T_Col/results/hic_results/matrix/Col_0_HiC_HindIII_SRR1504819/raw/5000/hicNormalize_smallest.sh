#!/bin/bash

# hicNormalize from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicNormalize.html

# Usage:
# ./hicNormalize_smallest.sh Col_0_HiC_HindIII_SRR1504819 met1_3_HiC_HindIII_SRR1504825 T2T_Col '20000'

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4

source activate HiCExplorer

hicNormalize --matrices ${SAMPLE1}_${GENOME}_${RESOLUTION}.h5 ${SAMPLE2}_${GENOME}_${RESOLUTION}.h5 \
             --normalize smallest \
             --setToZeroThreshold 1.0 \
             --outFileName ${SAMPLE1}_${GENOME}_${RESOLUTION}_smallest.h5 ${SAMPLE2}_${GENOME}_${RESOLUTION}_smallest.h5

conda deactivate
