#!/bin/bash

# hicPlotMatrix from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotMatrix.html

# Usage:
# ./hicPlotMatrix.sh met1_3_HiC_HindIII_SRR1504825 T2T_Col '100000' KR

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
CORRECTION=$4

source activate HiCExplorer

hicPlotMatrix --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.h5 \
              --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.pdf \
              --perChromosome \
              --chromosomeOrder Chr1 Chr2 Chr3 Chr4 Chr5 \
              --scoreName "${CORRECTION} counts" \
              --dpi 300 \
              --increaseFigureWidth 1 \
              --increaseFigureHeight 0.1 \
              --title ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}

conda deactivate
