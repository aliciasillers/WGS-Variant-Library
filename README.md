# WGS Variant Library

Using the intersect-then-combine approach detailed in Callari et al, 2017 to call variants among 80+ strawberry varieties. 

The indel realignment portion requires gatk3, which is no longer suppored by the broad institute. Get the gatk3 jar file here: https://console.cloud.google.com/storage/browser/gatk-software/package-archive/gatk;tab=objects?pli=1&prefix=&forceOnObjectsSortingFiltering=false. Otherwise, skip indel realignment by skipping steps 5 and 7-9 and adjusting input file names for step 10. 

Variant calling with bcftools incorporates ploidy information and will assume human ploidy unless a ploidy file is provided. This file has five columns with no headers. The first has chromosome name, the second has the start coordinate (presumably 1), the third has the end coordinate, the fourth has sex (this is arbitrary in most cases and can be made up), and the fifth has ploidy for that chromosome. The program fasize can be used to get chromosome end coordinates, but a script to do so is not included in this repository.

1. Download publicly available WGS data: getdata.sh, fastq.sh

2. Index genome: bwaindex.sh

3. Align with BWA and BBMAP: bwaalign.sh & bbmapalign.sh

4. Sort bbmap reads: sort.sh

5. Add read group info to bbmap reads for compatibility with GATK: addrg1.sh

6. Index reads: index.sh

7. Create genome dictionary for use with GATK: gatkref.sh

8. Register gatk3 jar file: gatkregister.sh

9. Realignment with GATK: gatktarget.sh, gatkrealign.sh

10. Variant calling with Mutect2 and BCFtools: mutect2.sh & bcfcall.sh

11. Intersect variants between alignments: intersect1.sh, intersect2.sh

12. Compile variants from both callers
