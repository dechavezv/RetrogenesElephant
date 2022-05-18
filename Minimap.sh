#! /bin/bash

#SBATCH --job-name=MinimapLoxRefvsRef
#SBATCH --cpus-per-task=1
#SBATCH --time=4:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=dc2656@nau.edu
#SBATCH --output=/scratch/dc2656/Lisa.Marc.Daniel/log/MinimapLoxRefvsRef.out
#SBATCH --error=/scratch/dc2656/Lisa.Marc.Daniel/log/MinimapLoxRefvsRef.err
#SBATCH --mem=40000
# USAGE: qsub ./run_FastqToSam.sh [dir] [read_1] [read_2] [outfile] [RG] [sample] [library] [flowcell] [seq ce$

#load module
module load samtools

minimap=/scratch/dc2656/Lisa.Marc.Daniel/programs/minimap2/minimap2
BAM_DIR=/scratch/dc2656/Lisa.Marc.Daniel/data/Loxodonta
OUT=Loxodonta.Hap1.By.Chr/Bams

cd ${BAM_DIR}

#Target=LoxodontaTP53.Gene.fa
#Target=Loxodonta.Hap1.chr24.fasta.gz
#Target=Loxodonta.Hap1.CHROMOSOMES.fasta.gz
#Target=LocatedTp53inChr24.fa
#Target=Loxodonta.Hap1.By.Chr/Mapped/Loxodonta.Hap1.chr22.fa
#Target=Scaff_76_retrogene6.fa
#Target=Loxodonta.Hap1.By.Chr/Loxodonta.Hap1.chr27.fa
Target=Loxodonta.Hap1.By.Chr/Bams/retrogene1_Loxodonta.fa

#query=LoxodontaTP53.Gene.fa
#query=BLoxodonta.7cell.HiFi.fasta
#query=Scaffolds_Mapping_T53_Loxodonta.fasta.gz
#query=Loxodonta.Hap1.CHROMOSOMES.fasta.gz
#query=Scaff_825_retrogene9.fa
#query=Scaff_458_retrogene13.fa
#query=Scaff_175_retrogen1.fa
#query=Subset_Scaf175.fa
#query=Scaff_76_retrogene6.fa
query=Loxodonta.Hap1.By.Chr/Bams/HiFi.Mapping.Retrogene1.chr19_8780286_8781409.fa

#-s 20000
#####${minimap} -ax map-hifi -t ${SLURM_CPUS_PER_TASK} \
#####${Target} ${query} | samtools view  -@12 -b -1 - | samtools sort -@12 -o AllHifi_LoxodontaChr.Jan4.2021.bam

######${minimap} -a -t ${SLURM_CPUS_PER_TASK} \
######${Target} ${query} | samtools view  -@4 -b -1 - | samtools sort -@12 -o RefvsRef_Loxodonta.Jan25.2022.bam

${minimap} -a ${Target} ${query} | samtools view  -@4 -b -1 - | samtools sort -@12 -o ${OUT}/Retro1.HiFi.bam

#${minimap} -a ${Target} ${query}
