#!/bin/bash
#
#SBATCH --job-name=filterbcf
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=filterbcf.out # File to which STDOUT will be written
#SBATCH --error=filterbcf.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4:00:00
#SBATCH --array=1-84

module load bcftools

file1=$(ls BCFOut/*[ba].vcf | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls BCFOut/*[ba].vcf | awk -F'[./]' '{print $2}' | sed -n ${SLURM_ARRAY_TASK_ID}p)

bcftools filter -i 'MQ>=35 & MQ0F<=0.05' $file1 > BCFOut/$prefix.filt.vcf
