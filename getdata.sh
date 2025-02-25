#!/bin/bash
#
#SBATCH --job-name=getdata
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=getdata.out # File to which STDOUT will be written
#SBATCH --error=getdata.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4:00:00
#SBATCH --array=1-10

sra=$(cat sralist1.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

module load sratoolkit

prefetch $sra
