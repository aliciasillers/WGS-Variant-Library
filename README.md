# WGS Variant Library

Using the intersect-then-combine approach detailed in Callari et al, 2017 to call variants among 80+ strawberry varieties. 

1. Download publicly available WGS data: getdata.sh, fastq.sh

2. Index genome: bwaindex.sh

3. Align with BWA and BBMAP: bwaalign.sh & bbmapalign.sh

4. Sort and index aligned reads: convert.sh

5. Realignment with GATK: gatktarget.sh, gatkrealign.sh

6. Variant calling with Strelka and Mutect2: strelkaconfig.sh, strelkarun.sh & mutect2.sh

7. Intersect variants between alignments: intersect1.sh, intersect2.sh

8. Compile variants from both callers
