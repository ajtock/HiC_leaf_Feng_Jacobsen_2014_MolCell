#!/bin/bash

# hicCorrectMatrix correct from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicCorrectMatrix.html#correct

# Usage:
# ./hicCorrectMatrix_correct_Col_0_HiC_HindIII_SRR1504819.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '5000' norm_range KR

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
NORM=$4
CORRECTION=$5

source activate HiCExplorer

hicCorrectMatrix correct --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}.h5 \
                         --correctionMethod ${CORRECTION} \
                         --filterThreshold -1.3035606234678807 5 \
                         --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5

conda deactivate
