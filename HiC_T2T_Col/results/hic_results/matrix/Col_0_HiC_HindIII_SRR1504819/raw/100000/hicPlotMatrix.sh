#!/bin/bash

# hicPlotMatrix from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotMatrix.html

# Usage:
# ./hicPlotMatrix.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' norm_range KR

SAMPLE=$1
GENOME=$2
RESOLUTION=$3
NORM=$4
CORRECTION=$5

[ -d plots/ ] || mkdir -p plots/

source activate HiCExplorer

hicPlotMatrix --matrix ${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5 \
              --outFileName plots/${SAMPLE}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.pdf \
              --perChromosome \
              --chromosomeOrder Chr1 Chr2 Chr3 Chr4 Chr5 \
              --colorMap "Spectral_r" \
              --scoreName "${SAMPLE} Hi-C ${CORRECTION} counts" \
              --vMin 0.0 \
              --vMax 0.9 \
              --rotationX 45 \
              --dpi 300 \
              --increaseFigureWidth 1 \
              --increaseFigureHeight 0.1 \
              --title "${SAMPLE}"

conda deactivate
