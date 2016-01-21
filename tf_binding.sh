#PBS -q hotel
#PBS -l nodes=1:ppn=1  
#PBS -l walltime=00:10:00
#PBS -N tf_binding.sh
#PBS -m abe

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
bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b t$

#exercise 5
# the strand does not matter, whether you take it into account by adding -s or $
module load biotools
bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.tra$

#exercise 6

git blame tf_binding.sh

echo "Hello I am a message in standard error (stderr) >&2 (the >&2 outputs to "$







