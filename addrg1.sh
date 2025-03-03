#!/bin/bash
#
#SBATCH --job-name=addrg1
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=addrg1.out # File to which STDOUT will be written
#SBATCH --error=addrg1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=8:00:00

module load samtools

samtools addreplacerg -r 'ID:SRR25036437' Mapped/SRR25036437bwa.bam
samtools addreplacerg -r 'ID:SRR25036437' Mapped/SRR25036437bb.bam
samtools addreplacerg -r 'ID:SRR25036438' Mapped/SRR25036438bwa.bam
samtools addreplacerg -r 'ID:SRR25036438' Mapped/SRR25036438bb.bam
samtools addreplacerg -r 'ID:SRR25036439' Mapped/SRR25036439bwa.bam
samtools addreplacerg -r 'ID:SRR25036439' Mapped/SRR25036439bb.bam
samtools addreplacerg -r 'ID:SRR25036440' Mapped/SRR25036440bwa.bam
samtools addreplacerg -r 'ID:SRR25036440' Mapped/SRR25036440bb.bam
samtools addreplacerg -r 'ID:SRR25036441' Mapped/SRR25036441bwa.bam
samtools addreplacerg -r 'ID:SRR25036441' Mapped/SRR25036441bb.bam
samtools addreplacerg -r 'ID:SRR25036442' Mapped/SRR25036442bwa.bam
samtools addreplacerg -r 'ID:SRR25036442' Mapped/SRR25036442bb.bam
samtools addreplacerg -r 'ID:SRR25036443' Mapped/SRR25036443bwa.bam
samtools addreplacerg -r 'ID:SRR25036443' Mapped/SRR25036443bb.bam
samtools addreplacerg -r 'ID:SRR25036444' Mapped/SRR25036444bwa.bam
samtools addreplacerg -r 'ID:SRR25036444' Mapped/SRR25036444bb.bam
samtools addreplacerg -r 'ID:SRR25036445' Mapped/SRR25036445bwa.bam
samtools addreplacerg -r 'ID:SRR25036445' Mapped/SRR25036445bb.bam
samtools addreplacerg -r 'ID:SRR25036446' Mapped/SRR25036446bwa.bam
samtools addreplacerg -r 'ID:SRR25036446' Mapped/SRR25036446bb.bam
