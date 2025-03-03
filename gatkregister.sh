#!/bin/bash
#
#SBATCH --job-name=gatkregister
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=10G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=gatkregister.out # File to which STDOUT will be written
#SBATCH --error=gatkregister.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4:00:00

module load conda
conda activate wgs

gatk3-register ../package-archive_gatk_GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar
