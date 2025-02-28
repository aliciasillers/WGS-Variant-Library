#!/bin/bash
#
#SBATCH --job-name=mutect2
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=mutect2.out # File to which STDOUT will be written
#SBATCH --error=mutect2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-80

module load gatk

file1=$(ls Mapped/*.bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls Mapped/*.bam | awk -F'[.]' '{print $1}' | sed -n ${SLURM_ARRAY_TASK_ID}p)

gatk Mutect2  -R ../Genome/farr1.fa -I $file1 -o MutectOut/$prefix.vcf.gz
