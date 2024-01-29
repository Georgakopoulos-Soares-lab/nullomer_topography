import csv
import pandas as pd

# BED file of coding regions
# `awk 'BEGIN {OFS="\t"}; {if($3=="CDS"){print $1,$4,$5}}' gencode.v40.annotation.gtf > gencode.v40.annotation.CDS.bed`

### Write out commands for bedtools intersect to split the mutations into coding and non-coding
with open('submit_CDS_bedtools.sh', 'w') as outfile:
	for k in range(11, 14):
		filename=f"../mutations_{k}bp_nulls_rmsk.bed"
		against = "gencode.v40.annotation.CDS.bed"
		coding_out = f"mutations_{k}bp_nulls_rmsk_CDS.bed"
		cmd = f"bedtools intersect -wa -a {filename} -b {against} > {coding_out}"
		outfile.write(cmd + "\n")
		noncoding_out = f"mutations_{k}bp_nulls_rmsk_noncoding.bed"
		cmd = f"bedtools intersect -v -wa -a {filename} -b {against} > {noncoding_out}"
		outfile.write(cmd + "\n")