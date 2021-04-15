#!/bin/bash

# HiC-Pro version 3.0.0

# Run HiC-Pro on gzip-compressed FASTQ files located within subdirectories of raw_data/

# Note that the following scripts in the index/ directory must be run before running HiC-Pro.sh
# samtools_faidx_chr_sizes.sh
# digest_genome.sh
# bowtie2_index_HiC_Pro.sh

EXECDIR=/home/ajt200/envs_miniconda3/HiC_Pro/HiC-Pro-3.0.0/bin

source activate HiC_Pro

${EXECDIR}/HiC-Pro --input rawdata/ \
                   --output results/ \
                   --conf config-hicpro.txt

conda deactivate
