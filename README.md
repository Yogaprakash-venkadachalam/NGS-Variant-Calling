# NGS Variant Calling Pipeline

This project demonstrates a basic NGS variant calling workflow using real E. coli sequencing data.

## Steps
1. Reference indexing (BWA, Samtools)
2. Read alignment (BWA-MEM)
3. BAM processing (Samtools)
4. Variant calling (bcftools)
5. Variant filtering

## Tools Used
- BWA
- Samtools
- bcftools

## Data
Real paired-end FASTQ data (~5GB each) aligned to E. coli reference genome.

## Output
- aligned.sorted.bam
- variants.vcf
- filtered_variants.vcf

## Notes
Large sequencing files are excluded using `.gitignore`.
