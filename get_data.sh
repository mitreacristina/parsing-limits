#!/usr/bin/env bash
# get_data.sh CHROMOSOME
# Downloads the Ensembl release 113 human GTF into data/ (once) and saves only
# the lines of one chromosome to data/chr<CHROMOSOME>.gtf.
# The uncompressed file is over 1 GB, so it is decompressed to standard output
# (gzip -dc) and filtered in the same pipe, never written to disk.
# awk compares the whole first column with the chromosome name; grep "^3" would
# also keep chromosome names that only START with 3.

chrom=$1
url=https://ftp.ensembl.org/pub/release-113/gtf/homo_sapiens/Homo_sapiens.GRCh38.113.gtf.gz

mkdir -p data
if [ ! -s data/Homo_sapiens.GRCh38.113.gtf.gz ]; then
    curl -L -o data/Homo_sapiens.GRCh38.113.gtf.gz "$url"
fi
gzip -dc data/Homo_sapiens.GRCh38.113.gtf.gz | awk -F"\t" -v c="$chrom" '$1==c' > "data/chr$chrom.gtf"
wc -l "data/chr$chrom.gtf"
