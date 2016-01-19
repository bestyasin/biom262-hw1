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

git blame tf_binding.sh
