#!/bin/bash

# Usage:
# ./samtools_faidx_chr_sizes.sh T2T_Col

i=$1

source activate HiC_Pro

samtools faidx ${i}.fa
cut -f1,2 ${i}.fa.fai > ${i}.fa.sizes

conda deactivate
