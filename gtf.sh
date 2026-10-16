# gtf.sh - Homework 2 and 3, Part IV: one chromosome of the Ensembl GTF with bash
# Run: bash gtf.sh > gtf_results.txt

# A) header with my chromosome file
echo "# A) GTF - data/chr3.gtf"

# B) lines that contain the text "gene" anywhere, then lines whose 3rd column
# is exactly "gene". Every line has gene_id in column 9, so the first is all lines.
echo "# B) LINES CONTAINING gene / GENE LINES"
grep -c "gene" data/chr3.gtf
awk -F"\t" '$3=="gene"' data/chr3.gtf | wc -l

# C) treat column 9 as if it were columns separated by ";": take the 3rd field,
# keep the key (text before the first double quote), count each key.
echo "# C) THIRD KEY IN COLUMN 9"
cut -f9 data/chr3.gtf | cut -d";" -f3 | cut -d'"' -f1 | sort | uniq -c

# D) gene names with a sed capture group, on gene lines only.
# 1) lines sed did not change (they still contain gene_id): genes without gene_name
# 2) with -n and the p flag, only lines where the substitution worked are printed
echo "# D) GENE NAMES: LINES NOT CONVERTED BY sed / NAMES WITH sed -n p"
awk -F"\t" '$3=="gene"' data/chr3.gtf | sed 's/.*gene_name "\([^"]*\)".*/\1/' | grep -c "gene_id"
awk -F"\t" '$3=="gene"' data/chr3.gtf | sed -n 's/.*gene_name "\([^"]*\)".*/\1/p' | wc -l
