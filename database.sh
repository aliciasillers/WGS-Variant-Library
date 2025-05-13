#!/bin/bash
#
#SBATCH --job-name=database
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=database.out # File to which STDOUT will be written
#SBATCH --error=database.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=8:00:00

module load conda
conda activate var
module load jdk

java -jar ../.conda/envs/var/share/snpeff-5.1-0/snpEff.jar build -gtf22 -v farr1
