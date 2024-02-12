awk 'BEGIN {OFS="\t"}; {if($3=="CDS"){print $1,$4,$5}}' gencode.v40.annotation.gtf > gencode.v40.annotation.CDS.bed

bedtools intersect -c -a gencode.v40.annotation.CDS.bed -b ../mutations_11bp_nulls_rmsk.bed > mutations_11bp_nulls_rmsk_CDS_counts.bed
bedtools intersect -c -a gencode.v40.annotation.noncds.bed -b ../mutations_11bp_nulls_rmsk.bed > mutations_11bp_nulls_rmsk_noncoding_counts.bed
bedtools intersect -c -a gencode.v40.annotation.CDS.bed -b ../mutations_12bp_nulls_rmsk.bed > mutations_12bp_nulls_rmsk_CDS_counts.bed
bedtools intersect -c -a gencode.v40.annotation.noncds.bed -b ../mutations_12bp_nulls_rmsk.bed > mutations_12bp_nulls_rmsk_noncoding_counts.bed
bedtools intersect -c -a gencode.v40.annotation.CDS.bed -b ../mutations_13bp_nulls_rmsk.bed > mutations_13bp_nulls_rmsk_CDS_counts.bed
bedtools intersect -c -a gencode.v40.annotation.noncds.bed -b ../mutations_13bp_nulls_rmsk.bed > mutations_13bp_nulls_rmsk_noncoding_counts.bed