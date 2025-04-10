#!/bin/bash
#
#SBATCH --job-name=index2
#SBATCH --ntasks=8 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=index2.out # File to which STDOUT will be written
#SBATCH --error=index2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4:00:00
#SBATCH --array=1-80

module load bcftools

file1=$(ls MutectOut/*[0-9].vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
file2=$(ls BCFOut/*[0-9].vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)

bcftools index $file1
bcftools index $file2
