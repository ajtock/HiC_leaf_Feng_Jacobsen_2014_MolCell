#!/bin/bash

# hicPlotTADs from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotTADs.html

# Usage:
# ./hicPlotTADs_after_hicCompareMatrices_CEN.sh met1_3_HiC_HindIII_SRR1504825 Col_0_HiC_HindIII_SRR1504819 T2T_Col '20000' norm_range KR log2ratio

SAMPLE1=$1
SAMPLE2=$2
GENOME=$3
RESOLUTION=$4
NORM=$5
CORRECTION=$6
OPERATION=$7

[ -d plots/ ] || mkdir -p plots/

source activate HiCExplorer

hicPlotTADs --tracks ${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}_hic_tracks.ini \
            --outFileName plots/${OPERATION}_${SAMPLE1}_${SAMPLE2}_${GENOME}_${RESOLUTION}_${NORM}_${CORRECTION}_hicPlotTADs.pdf \
            --BED CEN.bed \
            --width 40 \
            --dpi 300

conda deactivate
