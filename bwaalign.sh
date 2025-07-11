#!/bin/bash
#
#SBATCH --job-name=bwaalign
#SBATCH --ntasks=20 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=bwaalign.out # File to which STDOUT will be written
#SBATCH --error=bwaalign.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-168

module load bwa
module load samtools

reads1=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*R1.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
reads2=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*R2.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls /quobyte/feldmanngrp/BACKED-UP/RawData/HudsonAlpha/20250421/Illumina_Resequencing/*R1.fastq.bz2 | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[._/]' '{print $13$14$18$21$22}')

bwa mem -t 8 -R "@RG\tID:${prefix}\tSM:${prefix}" ../Genome/farr1 <(bunzip2 -c $reads1) <(bunzip2 -c $reads2) | samtools sort -@8 -o Mapped/$prefix.bwa.bam -
