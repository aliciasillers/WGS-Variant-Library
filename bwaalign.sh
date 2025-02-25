#!/bin/bash
#
#SBATCH --job-name=bwaalign
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=bwaalign.out # File to which STDOUT will be written
#SBATCH --error=bwaalign.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-10

module load bwa

reads1=$(ls *1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
reads2=$(ls *2.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[_]' '{print $1}')

bwa mem -t 4 ../Genome/farr1 $reads1 $reads2 > Mapped/$prefix.bwa.sam
