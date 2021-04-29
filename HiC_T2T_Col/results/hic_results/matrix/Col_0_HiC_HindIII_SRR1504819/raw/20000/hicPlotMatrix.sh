#!/bin/bash

# hicPlotMatrix from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotMatrix.html

# Usage:
# ./hicPlotMatrix.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000'

SAMPLE=$1
GENOME=$2
RESOLUTION=$3

source activate HiCExplorer

hicPlotMatrix --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_ICE.h5 \
              --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_ICE.pdf \
              --perChromosome \
              --chromosomeOrder Chr1 Chr2 Chr3 Chr4 Chr5 \
              --scoreName "ICE counts" \
              --dpi 300 \
              --increaseFigureWidth 1 \
              --increaseFigureHeight 0.1 \
              --title ${SAMPLE}_${GENOME}_${RESOLUTION}_norm_range_ICE

conda deactivate
