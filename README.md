# WGS Variant Library

Using the intersect-then-combine approach detailed in Callari et al, 2017 to call variants among 80+ strawberry varieties. 

1. Downloading publicly available WGS data: getdata.sh & fastq.sh

2. Align with BWA and BBMAP: bwaalign.sh & bbmapalign.sh

3. Sort and index aligned reads: convert.sh

3. Realignment with GATK: gatktarget.sh & gatkrealign.sh

4. Variant calling with Strelka and Mutect2
