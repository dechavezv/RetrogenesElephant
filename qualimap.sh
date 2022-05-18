#! /bin/bash

#SBATCH --job-name=qualimap
#SBATCH --cpus-per-task=12
#SBATCH --time=8:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=dc2656@nau.edu
#SBATCH --output=/scratch/dc2656/Lisa.Marc.Daniel/log/Qualimap.out
#SBATCH --error=/scratch/dc2656/Lisa.Marc.Daniel/log/Qualimap.err
#SBATCH --mem=20000

Java=/projects/tollis_lab/programs/jre1.8.0_281/bin/java
export BAM_DIR=/scratch/dc2656/Lisa.Marc.Daniel/data/Loxodonta/Loxodonta.Hap1.By.Chr/Bams

QUALIMAP_fn () {

        echo "***** Beginning alignment of $1 *****"f
        mkdir $(printf $1 | perl -pe 's/.bam//g')
        /projects/tollis_lab/programs/qualimap_v0.7.1/qualimap bamqc \
        -nw 12 \
        -nt 12 \
        -nr 100 \
        -bam ${BAM_DIR}/${1} \
        --java-mem-size=20G \
	-outdir ${BAM_DIR}/$(printf $1 | perl -pe 's/.bam//g')

        echo "***** $1 processing complete *****"
}

## QUALIMAP_fn bushDog
## QUALIMAP_fn ManedWolf
## QUALIMAP_fn CHE_611_BJJ_USPD16084149_HHHLFCCXY_L3_FILTERED.gz_
QUALIMAP_fn $1


