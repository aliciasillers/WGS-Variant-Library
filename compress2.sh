#!/bin/bash
#
#SBATCH --job-name=compress2
#SBATCH --ntasks=4 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=compress2.out # File to which STDOUT will be written
#SBATCH --error=compress2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2:00:00
#SBATCH --array=1-80

module load htslib

file1=$(ls MutectOut/*[0-9].vcf | sed -n ${SLURM_ARRAY_TASK_ID}p)
file2=$(ls BCFOut/*[0-9].vcf | sed -n ${SLURM_ARRAY_TASK_ID}p)

bgzip $file1
bgzip $file2
