#!/bin/bash

# Build index for reference genome
# using bowtie2 version 2.3.5.1

# Usage:
# ./bowtie2_index_HiC_Pro.sh T2T_Col.fa T2T_Col

genome=$1
idxBaseName=$2

source activate HiC_Pro

bowtie2-build --threads 48 $genome $idxBaseName

conda deactivate
