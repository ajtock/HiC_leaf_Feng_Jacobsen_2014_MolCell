#!/bin/bash

# hicCorrectMatrix correct from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicCorrectMatrix.html#correct

# Usage:
# ./hicCorrectMatrix_correct_drm1_drm2_cmt2_cmt3_HiC_HindIII_SRR12362059.sh drm1_drm2_cmt2_cmt3_HiC_HindIII_SRR12362059 T2T_Col '20000' norm_range KR

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
NORM=$4
CORRECTION=$5

source activate HiCExplorer

hicCorrectMatrix correct --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}.h5 \
                         --correctionMethod ${CORRECTION} \
                         --filterThreshold -1.883503139566386 5 \
                         --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5

conda deactivate
