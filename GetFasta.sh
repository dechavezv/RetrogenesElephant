#! /bin/bash

#SBATCH --job-name=getFasta
#SBATCH --cpus-per-task=1
#SBATCH --time=6:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=dc2656@nau.edu
#SBATCH --output=/scratch/dc2656/Lisa.Marc.Daniel/log/getFasta.out
#SBATCH --error=/scratch/dc2656/Lisa.Marc.Daniel/log/getFasta.err
#SBATCH --mem=10000

echo '#########'
echo 'Bedtools_Fasta'
echo '#########'

export Dir=/scratch/dc2656/Lisa.Marc.Daniel/data/Loxodonta/Loxodonta.Hap1.By.Chr/Fasta
export Fasta=/scratch/dc2656/Loxodonta.Hap1.CHROMOSOMES.fa
export Bed=/scratch/dc2656/Lisa.Marc.Daniel/data/Loxodonta/Retrogenes.bed
export bedtools=/projects/tollis_lab/programs/bedtools2/bin/bedtools

${bedtools} getfasta -name -fi ${Fasta} -bed ${Bed} -fo ${Dir}/Retrogenes_Loxodonta.fa
