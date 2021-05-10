#!/bin/bash

# hicConvertFormat from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicConvertFormat.html
# "Conversion of Hi-C matrices of different file formats.
# We support the conversion of hic to cool format via hic2cool, and homer, HicPro, h5 and cool format to h5, cool, homer or ginteractions format.
# Moreover, hicConvertFormat accepts multiple input files from one format with different resolutions and creates a mcool file.
# Each original file is stored under the path e.g. ::/resolutions/10000.
# A batch computation is possible, the number of input files and output files needs to match, all input files need to be of the same format type and all output files too.
# For input and output of cooler files special options are available, for all other formats they will be ignored.
# HiCPro file format needs an additional bed file as input."

# Usage:
# ./hicConvertFormat.sh Col_0_HiC_HindIII_SRR1504819 T2T_Col '100000' '100000'

SAMPLE=$1
GENOME=$2
BINSIZE=$3
RESOLUTION=$4

source activate HiCExplorer

hicConvertFormat --matrices ${SAMPLE}_${BINSIZE}.matrix \
                 --outFileName ${SAMPLE}_${GENOME}_${RESOLUTION}.h5 \
                 --inputFormat hicpro \
                 --outputFormat h5 \
                 --bedFileHicpro ${SAMPLE}_${BINSIZE}_abs.bed \
                 --resolutions ${RESOLUTION}

conda deactivate
