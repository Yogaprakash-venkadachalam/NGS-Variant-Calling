#!/bin/bash

# Index reference
bwa index ecoli_ref.fa
samtools faidx ecoli_ref.fa

# Align reads
bwa mem -t 6 ecoli_ref.fa real_R1.fastq real_R2.fastq > aligned.sam

# Convert and sort
samtools view -Sb aligned.sam > aligned.bam
samtools sort aligned.bam -o aligned.sorted.bam
samtools index aligned.sorted.bam

# Variant calling
bcftools mpileup -f ecoli_ref.fa aligned.sorted.bam | \
bcftools call -mv --ploidy 1 -Ov -o variants.vcf

# Filtering
bcftools filter -i 'DP>10 && QUAL>20' variants.vcf > filtered_variants.vcf
