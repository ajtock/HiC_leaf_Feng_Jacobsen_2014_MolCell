#!/bin/bash

# hicNormalize from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicNormalize.html

# Usage:
# ./hicNormalize.sh met1_3_HiC_HindIII_SRR1504825 T2T_Col '100000'

SAMPLE=$1
GENOME=$2
RESOLUTION=$3

source activate HiCExplorer

hicNormalize --matrices ${SAMPLE}_${GENOME}_${RESOLUTION}.h5 \
             --normalize norm_range \
             --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range.h5

conda deactivate
