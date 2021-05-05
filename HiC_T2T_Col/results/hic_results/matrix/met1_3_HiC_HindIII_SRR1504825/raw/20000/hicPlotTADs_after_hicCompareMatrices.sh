#!/bin/bash

# hicPlotTADs from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotTADs.html

# Usage:
# ./hicPlotTADs_after_hicCompareMatrices.sh met1_3_HiC_HindIII_SRR1504825 Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' KR log2ratio

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4
CORRECTION=$5
OPERATION=$6

source activate HiCExplorer

hicPlotTADs --tracks ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_hic_tracks.ini \
            --outFileName ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_hicPlotTADs.pdf \
            --BED CEN.bed \
            --width 40 \
            --dpi 300

conda deactivate
