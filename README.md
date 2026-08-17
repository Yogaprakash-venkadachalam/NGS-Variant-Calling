![GitHub repo size](https://img.shields.io/github/repo-size/Yogaprakash-venkadachalam/NGS-Variant-Calling)
![GitHub last commit](https://img.shields.io/github/last-commit/Yogaprakash-venkadachalam/NGS-Variant-Calling)
![GitHub language](https://img.shields.io/github/languages/top/Yogaprakash-venkadachalam/NGS-Variant-Calling)

# 🧬 NGS Variant Calling Pipeline

This project demonstrates a complete **Next-Generation Sequencing (NGS) variant calling workflow** using real *E. coli* sequencing data.

---

## 📌 Overview

The pipeline processes raw paired-end FASTQ reads and produces high-confidence variant calls (VCF format) using standard bioinformatics tools.

---

## 🔄 Pipeline Workflow

FASTQ → BWA → SAM/BAM → Samtools → bcftools → VCF → Filtering

---

## ⚙️ Workflow Steps

1. **Reference Indexing**
   - Tool: BWA, Samtools  
   - Prepares the reference genome for alignment  

2. **Read Alignment**
   - Tool: BWA-MEM  
   - Aligns paired-end reads to the reference genome  

3. **BAM Processing**
   - Tool: Samtools  
   - Converts SAM to BAM, sorts, and indexes  

4. **Variant Calling**
   - Tool: bcftools  
   - Detects SNPs and INDELs  

5. **Variant Filtering**
   - Tool: bcftools  
   - Filters variants based on quality metrics  

---

## 🛠️ Tools Used

- BWA  
- Samtools  
- bcftools  

---

## 📂 Project Structure

NGS-Variant-Calling/
├── data/
├── real_data/
├── results/
├── scripts/
│ └── pipeline.sh
├── README.md
└── .gitignore

---

## ▶️ How to Run

```bash
chmod +x scripts/pipeline.sh
./scripts/pipeline.sh


---

## ▶️ Example Commands

# Index reference genome
bwa index ecoli_ref.fa

# Align reads
bwa mem -t 6 ecoli_ref.fa real_R1.fastq real_R2.fastq > aligned.sam

# Convert and sort BAM
samtools view -Sb aligned.sam | samtools sort -o aligned.sorted.bam

# Index BAM
samtools index aligned.sorted.bam

# Variant calling
bcftools mpileup -f ecoli_ref.fa aligned.sorted.bam | \
bcftools call -mv --ploidy 1 -Ov -o variants.vcf

# Filter variants
bcftools filter -i 'DP>10 && QUAL>20' variants.vcf > filtered_variants.vcf


---

## 📊 Input Data

- Paired-end FASTQ files (~5 GB each)  
- Reference genome (~4.5 MB)  

---

## 📈 Output

- aligned.sorted.bam → aligned reads  
- variants.vcf → raw variants  
- filtered_variants.vcf → high-confidence variants  

---

## 📄 Example Output

NC_000913.3 4296380 . AC ACGC 228.387 PASS DP=246 ...


---

## 🧪 Filtering Logic

- DP > 10 → ensures sufficient read depth  
- QUAL > 20 → ensures high confidence variants  
- Ploidy = 1 → bacterial genome is haploid  

---

## ⚠️ Notes

- Large sequencing files are excluded using .gitignore  
- Recommended system: ≥16GB RAM  
- Required tools: bwa, samtools, bcftools  

---

## 👤 Author

Yogaprakash Venkadachalam  
yogaprakash8098@gmail.com
