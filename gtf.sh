# gtf.sh - Homework 2 and 3, Part IV: one chromosome of the Ensembl GTF with bash
# Run: bash gtf.sh > gtf_results.txt

# A) header with my chromosome file
echo "# A) GTF - data/chr3.gtf"

# B) lines that contain the text "gene" anywhere, then lines whose 3rd column
# is exactly "gene". Every line has gene_id in column 9, so the first is all lines.
echo "# B) LINES CONTAINING gene / GENE LINES"
grep -c "gene" data/chr3.gtf
awk -F"\t" '$3=="gene"' data/chr3.gtf | wc -l
