#!/bin/bash
#
#SBATCH --job-name=bbmapalign
#SBATCH --ntasks=70 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=bbmapalign.out # File to which STDOUT will be written
#SBATCH --error=bbmapalign.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2-00:00:00
#SBATCH --array=1-42

module load conda
conda activate wgs
module load bbmap

L1R1=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*L1_R1.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
L1R2=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*L1_R2.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
L2R1=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*L2_R1.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
L2R2=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*L2_R2.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*L1_R1.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[._/]' '{print $12$13$14$15$16}')

In1=$(cat <(bunzip2 -c $L1R1) <(bunzip2 -c $L2R1))
In2=$(cat <(bunzip2 -c $L1R2) <(bunzip2 -c $L2R2))

bbmap.sh in1=$In1 in2=$In2 out=Mapped/$prefix.bb1.bam ref=../Genome/farr1.fa nodisk
