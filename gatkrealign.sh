#!/bin/bash
#
#SBATCH --job-name=gatkrealign
#SBATCH --ntasks=16 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=gatkrealign.out # File to which STDOUT will be written
#SBATCH --error=gatkrealign.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-12:00:00
#SBATCH --array=1-40

module load conda
conda activate wgs

file=$(ls Mapped/*[ba].bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls Mapped/*[ba].bam | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[.]' '{print $1}')

java -jar GenomeAnalysisTK.jar -T IndelRealigner -R ../Genome/farr1.fa targetIntervals $prefix.gatk.intervals -I $file -o $prefix.realigned.bam
