#!/bin/bash
#
#SBATCH --job-name=annotate
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=annotate.out # File to which STDOUT will be written
#SBATCH --error=annotate.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-42

module load conda
conda activate var
module load jdk

file1=$(ls VariantsFiltered/*.vcf | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls VariantsFiltered/*.vcf | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[./]' '{print $2}')

java -Xmx10g -jar ../.conda/envs/var/share/snpeff-5.1-0/snpEff.jar farr1 $file1 > Annotated/$prefix.ann.vcf

