#!/bin/bash
#
#SBATCH --job-name=intersect2
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=intersect2.out # File to which STDOUT will be written
#SBATCH --error=intersect2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=12:00:00

module load bedtools2

file1=$(ls *bb.bcf | sed -n ${SLURM_ARRAY_TASK_ID}p)
file2=$(ls *bwa.bcf | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *bb.bcf | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[b]' '{print $1}')

bedtools intersect -a BCFOut/$file1 -b BCFOut/$file2 > $prefix.bcf
