#!/bin/bash
#
#SBATCH --job-name=bbmapalign
#SBATCH --ntasks=40 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=80G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=bbmapalign.out # File to which STDOUT will be written
#SBATCH --error=bbmapalign.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2-00:00:00
#SBATCH --array=1-42

module load conda
conda activate wgs
module load bbmap
module load samtools

in1=$(ls *R1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
in2=$(ls *R2.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *R1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[._/]' '{print $1}')

bbmap.sh in1=$in1 in2=$in2 out=Mapped/$prefix.bb1.bam ref=../Genome/farr1.fa nodisk
