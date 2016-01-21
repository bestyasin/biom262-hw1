#!/bin/csh
#PBS -q hotel
#PBS -l nodes=1:ppn=1  
#PBS -l walltime=00:10:00
#PBS -N tf_binding.sh
#PBS -m abe
#PBS -V
#PBS -A ucsd-train17
#PBS -o output
#PBS -e error
#changing to appropriate directory
cd ~/biom262-hw1

#exercise 1 
cat tf.bed | grep --word-regexp 'NFKB' > tf.nfkb.bed

#exercise 2
awk '{if($3=="transcript"){print $0}}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf

#exercise 3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 > gencode.v19.annotation.chr22.transcript.promoter.gtf

#exercise 4
module load biotools
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf

#exercise 5
# the strand does matter because withot specifying -s it will always give you the sequences from the positive strand. Since we are looking at transcripts the sequences will be different if its negative or positive strand, and we want to see that so we must put -s.
module load biotools
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta -s

#exercise 6

#person 1 (Alannah)
echo "Hello I am a message in standard out (stdout)"
#person 2 (Yasin)
echo "Hello I am a message in standard error (stderr)" >&2







