#!/bin/bash

# hicPlotMatrix from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotMatrix.html

# Usage:
# ./hicPlotMatrix_after_hicCompareMatrices.sh met1_3_HiC_HindIII_SRR1504825 Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' KR log2ratio

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4
CORRECTION=$5
OPERATION=$6

source activate HiCExplorer

hicPlotMatrix --matrix ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.h5 \
              --outFileName ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.pdf \
              --perChromosome \
              --chromosomeOrder Chr1 Chr2 Chr3 Chr4 Chr5 \
              --scoreName "${CORRECTION} counts" \
              --rotationX 45 \
              --dpi 300 \
              --increaseFigureWidth 1 \
              --increaseFigureHeight 0.1 \
              --title "${OPERATION} ${SAMPLE1} ${SAMPLE2}"

conda deactivate
