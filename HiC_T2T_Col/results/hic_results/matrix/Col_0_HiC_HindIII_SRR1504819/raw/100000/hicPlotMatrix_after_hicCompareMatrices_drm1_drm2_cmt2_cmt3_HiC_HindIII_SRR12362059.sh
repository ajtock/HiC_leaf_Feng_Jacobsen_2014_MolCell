#!/bin/bash

# hicPlotMatrix from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotMatrix.html

# Usage:
# ./hicPlotMatrix_after_hicCompareMatrices_drm1_drm2_cmt2_cmt3_HiC_HindIII_SRR12362059.sh drm1_drm2_cmt2_cmt3_HiC_HindIII_SRR12362059 Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' norm_range KR log2ratio

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4
NORM=$5
CORRECTION=$6
OPERATION=$7

[ -d plots/ ] || mkdir -p plots/

source activate HiCExplorer

hicPlotMatrix --matrix ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.h5 \
              --outFileName plots/${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}.pdf \
              --perChromosome \
              --chromosomeOrder Chr1 Chr2 Chr3 Chr4 Chr5 \
              --colorMap "plasma" \
              --scoreName "Log2(ddcc/WT) Hi-C ${CORRECTION} counts" \
              --vMin -3.0 \
              --vMax 3.0 \
              --rotationX 45 \
              --dpi 300 \
              --increaseFigureWidth 1 \
              --increaseFigureHeight 0.1 \
              --title "Log2(ddcc/WT)"

conda deactivate
