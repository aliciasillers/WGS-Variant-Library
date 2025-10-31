#!/bin/bash
#
#SBATCH --job-name=addrg
#SBATCH --ntasks=4 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=addrg.out # File to which STDOUT will be written
#SBATCH --error=addrg.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=8:00:00
#SBATCH --array=1-42

module load samtools

file=$(ls Mapped/*_bb1.bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
name=$(ls Mapped/*_bb1.bam | awk -F'[_]' '{print $1}' | sed -n ${SLURM_ARRAY_TASK_ID}p)

samtools addreplacerg -r "ID:${name}" -r "SM:${name}" $file -o $name.bb.bam
