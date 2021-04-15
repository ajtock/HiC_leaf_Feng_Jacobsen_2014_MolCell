#!/bin/bash

# HiC-Pro version 3.0.0

# From http://nservant.github.io/HiC-Pro/UTILS.html#utils :
# "Digest the reference genome by the provided restriction enzymes(s) and generate a BED file with the list of restriction fragments after digestion.
# "This file can then be used by HiC-Pro (GENOME_FRAGMENT) for the data processing.
# "Note that the cutting site of the restriction enzyme has to be specified using the ‘^’ character.
# "The restriction enzymes HindIII, DpnII and BglII are encoded within the script and are therefore recognized if specified to the program.
# "Finally, multiple restriction enzymes can also be provided."


# Usage:
# ./digest_genome.sh 'A^AGCTT' HindIII T2T_Col

SITE=$1
ENZYME=$2
GENOME=$3

UTILSPATH="/home/ajt200/envs_miniconda3/HiC_Pro/HiC-Pro-3.0.0/bin/utils"

source activate HiC_Pro

${UTILSPATH}/digest_genome.py --restriction_sites ${SITE} \
                              --out ${GENOME}_${ENZYME}.bed \
                              ${GENOME}.fa

conda deactivate
