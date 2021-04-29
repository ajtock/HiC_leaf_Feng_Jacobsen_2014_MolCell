#!/bin/bash

# hicCorrectMatrix diagnostic_plot from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicCorrectMatrix.html#diagnostic_plot

# Usage:
# ./hicCorrectMatrix_diagnostic_plot.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000'

SAMPLE=$1
GENOME=$2
RESOLUTION=$3

source activate HiCExplorer

hicCorrectMatrix diagnostic_plot --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range.h5 \
                                 --plotName ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_diagnostic.png

conda deactivate
