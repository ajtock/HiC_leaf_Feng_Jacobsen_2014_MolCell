#!/bin/bash

# hicCorrectMatrix diagnostic_plot from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicCorrectMatrix.html#diagnostic_plot

# Usage:
# ./hicCorrectMatrix_diagnostic_plot.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '5000' norm_range

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
NORM=$4

source activate HiCExplorer

hicCorrectMatrix diagnostic_plot --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}.h5 \
                                 --plotName ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}_diagnostic.png

conda deactivate
