#!/bin/bash
#
#SBATCH --job-name=reindex
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=reindex.out # File to which STDOUT will be written
#SBATCH --error=reindex.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=8:00:00
#SBATCH --array=1-40

module load samtools

file1=$(ls Mapped/*[ba].bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
name=$(ls Mapped/*[ba].bam | awk -F'[.]' '{print $1}' | sed -n ${SLURM_ARRAY_TASK_ID}p)

samtools index $file1 -o $name.bam.bai
