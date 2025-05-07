#!/bin/bash
#
#SBATCH --job-name=compress
#SBATCH --ntasks=4 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=compress.out # File to which STDOUT will be written
#SBATCH --error=compress.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=3:00:00
#SBATCH --array=1-6

file1=$(ls *.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)

gzip $file1
