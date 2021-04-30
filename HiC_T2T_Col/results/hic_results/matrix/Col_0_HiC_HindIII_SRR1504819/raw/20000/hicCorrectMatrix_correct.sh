#!/bin/bash

# hicCorrectMatrix correct from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicCorrectMatrix.html#correct

# Usage:
# ./hicCorrectMatrix_correct.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' KR

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
CORRECTION=$4

source activate HiCExplorer

hicCorrectMatrix correct --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range.h5 \
                         --correctionMethod ${CORRECTION} \
                         --filterThreshold -2.0680317931672136 3 \
                         --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.h5

conda deactivate
