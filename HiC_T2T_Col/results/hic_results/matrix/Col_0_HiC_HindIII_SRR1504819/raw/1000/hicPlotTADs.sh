#!/bin/bash

# hicPlotTADs from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicPlotTADs.html

# Usage:
# ./hicPlotTADs.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' KR

SAMPLE1=$1
GENOME=$2
RESOLUTION=$3
CORRECTION=$4

source activate HiCExplorer

hicPlotTADs --tracks ${SAMPLE1}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_hic_tracks.ini \
            --outFileName ${SAMPLE1}_${GENOME}_${RESOLUTION}_norm_range_${CORRECTION}_hicPlotTADs.pdf \
            --BED CEN.bed \
            --width 40 \
            --dpi 300

conda deactivate
