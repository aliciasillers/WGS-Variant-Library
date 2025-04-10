#!/bin/bash
#
#SBATCH --job-name=filtermutect
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=filtermutect.out # File to which STDOUT will be written
#SBATCH --error=filtermutect.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4:00:00
#SBATCH --array=1-160

module load gatk

file1=$(ls MutectOut/*.vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls MutectOut/*.vcf.gz | awk -F'[./]' '{print $2}' | sed -n ${SLURM_ARRAY_TASK_ID}p)

gatk FilterMutectCalls -R ../Genome/farr1.fa -V $file1 -O MutectOut/$prefix.filt.vcf

