#!/bin/bash
#
#SBATCH --job-name=combine
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=combine.out # File to which STDOUT will be written
#SBATCH --error=combine.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=12:00:00
#SBATCH --array=1-80

module load bcftools

file1=$(ls MutectOut/*[0-9].vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
file2=$(ls BCFOut/*[0-9].vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls MutectOut/*[0-9].vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[./]' '{print $2}')

bcftools concat $file1 $file2 -a -d all > VariantsFiltered/$prefix.vcf


