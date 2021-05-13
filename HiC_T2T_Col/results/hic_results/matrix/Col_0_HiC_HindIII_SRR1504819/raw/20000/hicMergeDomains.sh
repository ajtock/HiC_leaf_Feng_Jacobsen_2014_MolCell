#!/bin/bash

# hicMergeDomains from HiCExplorer version 3.6

# From https://hicexplorer.readthedocs.io/en/latest/content/tools/hicMergeDomains.html

# Usage:
# ./hicMergeDomains.sh log2ratio_met1_3_HiC_HindIII_SRR1504825_Col_0_HiC_HindIII_SRR1504819 T2T_Col norm_range KR 0.05

SAMPLE1=$1
GENOME=$2
NORM=$3
CORRECTION=$4
THRESHOLD=$5

[ -d plots/ ] || mkdir -p  plots/

source activate HiCExplorer

hicMergeDomains --domainFiles ${SAMPLE1}_${GENOME}_1000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_domains.bed ${SAMPLE1}_${GENOME}_5000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_domains.bed ${SAMPLE1}_${GENOME}_10000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_domains.bed ${SAMPLE1}_${GENOME}_20000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_domains.bed ${SAMPLE1}_${GENOME}_50000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_domains.bed ${SAMPLE1}_${GENOME}_100000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_domains.bed \
                --outputMergedList ${SAMPLE1}_${GENOME}_1000_5000_10000_20000_50000_100000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_merged_domains.bed \
                --outputRelationList ${SAMPLE1}_${GENOME}_1000_5000_10000_20000_50000_100000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_relationship_list.txt \
                --outputTreePlotPrefix plots/${SAMPLE1}_${GENOME}_1000_5000_10000_20000_50000_100000_${NORM}_${CORRECTION}_threshold${THRESHOLD}_relationship_tree

conda deactivate
