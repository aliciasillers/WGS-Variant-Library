# WGS Variant Library

Using the intersect-then-combine approach detailed in Callari et al, 2017 to call variants among 80+ strawberry varieties. The indel realignment portion requires gatk3, which is no longer suppored by the broad institute. Get the gatk3 jar file here: https://console.cloud.google.com/storage/browser/gatk-software/package-archive/gatk;tab=objects?pli=1&prefix=&forceOnObjectsSortingFiltering=false. Otherwise, skip indel realignment by skipping steps 5-8 and adjusting input file names for step 9. 

1. Download publicly available WGS data: getdata.sh, fastq.sh

2. Index genome: bwaindex.sh

3. Align with BWA and BBMAP: bwaalign.sh & bbmapalign.sh

4. Sort and index aligned reads: convert.sh

5. Add read group info to reads for use with GATK: addrg1.sh

6. Create genome dictionary for use with GATK: gatkref.sh

7. Register gatk3 jar file: gatkregister.sh

8. Realignment with GATK: gatktarget.sh, gatkrealign.sh

9. Variant calling with Strelka and Mutect2: strelkaconfig.sh, strelkarun.sh & mutect2.sh

10. Intersect variants between alignments: intersect1.sh, intersect2.sh

11. Compile variants from both callers
