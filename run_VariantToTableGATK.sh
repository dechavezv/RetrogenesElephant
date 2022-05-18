#! /bin/bash

#SBATCH --job-name=VarianToTable
#SBATCH --cpus-per-task=1
#SBATCH --time=8:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=dc2656@nau.edu
#SBATCH --output=/scratch/dc2656/Lisa.Marc.Daniel/log/VarianToTable.out
#SBATCH --error=/scratch/dc2656/Lisa.Marc.Daniel/log/VarianToTable.err
#SBATCH --mem=8000

export PICARD=/projects/tollis_lab/programs/picard-2.6.0/picard.jar
export Java=/projects/tollis_lab/programs/jre1.8.0_281/bin/java
export GATK=/projects/tollis_lab/programs/GenomeAnalysisTK-3.7-0-gcfedb67/GenomeAnalysisTK.jar

cd /scratch/dc2656/Lisa.Marc.Daniel/data/Loxodonta/Loxodonta.Hap1.By.Chr/Bams/VCF

i=Chr19:8780286-8781409

REFERENCE=/scratch/dc2656/Loxodonta.Hap1.CHROMOSOMES.fa

${Java} -jar -Xmx8g $GATK \
-T VariantsToTable \
-R ${REFERENCE} \
--allowMissingData --showFiltered \
-F CHROM -F POS -F DP \
-V AllHifi_LoxodontaChr.Jan4.2021_chr${i}.AddedGroup_Filtered.vcf.gz \
-o AllHifi_LoxodontaChr.Jan4.2021_chr${i}.AddedGroup_Filtered_statsTable.txt
