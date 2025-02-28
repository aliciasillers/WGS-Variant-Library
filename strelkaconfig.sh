#!/bin/bash
#
#SBATCH --job-name=strelkaconfig
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=strelkaconfig.out # File to which STDOUT will be written
#SBATCH --error=strelkaconfig.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-80

module load conda
conda activate wgs

file1=$(ls Mapped/*.bam | sed -n ${SLURM_ARRAY_TASK_ID}p)

../.conda/envs/wgs/bin/configureStrelkaGermlineWorkflow.py --bam $file1 --referenceFasta ../Genome/farr1.fa --runDir StrelkaOut/
