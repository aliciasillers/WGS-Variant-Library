#!/bin/bash
#
#SBATCH --job-name=intersect1
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=intersect1.out # File to which STDOUT will be written
#SBATCH --error=intersect1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=12:00:00
#SBATCH --array=1-80

module load bedtools2

file1=$(ls MutectOut/*bb.vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
file2=$(ls MutectOut/*bwa.vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls MutectOut/*bb.vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[b]' '{print $1}')

bedtools intersect -a $file1 -b $file2 > $prefix.vcf
