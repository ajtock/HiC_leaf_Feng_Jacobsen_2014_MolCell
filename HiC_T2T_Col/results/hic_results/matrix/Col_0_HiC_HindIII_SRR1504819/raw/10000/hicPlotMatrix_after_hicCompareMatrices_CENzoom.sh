#!/bin/bash

# hicPlotMatrix from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotMatrix.html

# Usage:
# ./hicPlotMatrix_after_hicCompareMatrices_CENzoom.sh met1_3_HiC_HindIII_SRR1504825 Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' KR log2ratio 'Chr5:10783990-15551874'

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4
CORRECTION=$5
OPERATION=$6
REGION=$7

source activate HiCExplorer

hicPlotMatrix --matrix ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}.h5 \
              --outFileName ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_${REGION}.pdf \
              --region ${REGION} \
              --bigwig /home/ajt200/analysis/repeats/CEN180_in_T2T_Col/CENAthila_in_T2T_Col_Chr1_Chr2_Chr3_Chr4_Chr5.bw \
              --vMinBigwig 0 \
              --vMaxBigwig 1 \
              --scoreName "Log2(met1-3/Col-0) Hi-C ${CORRECTION} counts" \
              --rotationX 45 \
              --dpi 300 \
              --increaseFigureWidth 5 \
              --increaseFigureHeight 4 \
              --title "${OPERATION} ${SAMPLE1} ${SAMPLE2}"

conda deactivate
