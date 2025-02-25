#!/bin/bash
#
#SBATCH --job-name=bbmapalign
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=bbmapalign.out # File to which STDOUT will be written
#SBATCH --error=bbmapalign.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-10

module load conda
conda activate wgs
module load bbmap

reads1=$(ls *1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
reads2=$(ls *2.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[_]' '{print $1}')

bbmap.sh in1=$reads1 in2=$reads2 out=Mapped/$prefix.bb.sam ref=../Genome/farr1.fa nodisk

