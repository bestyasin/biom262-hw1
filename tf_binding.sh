#PBS -q hotel
#PBS -l nodes=10:ppn=2  
#PBS -l walltime=00:50:00
#PBS -N tf_binding.sh
#PBS -o <output file>
#PBS -e	<error file>
#PBS -V
#PBS -M	<ahmirand@ucsd.edu>
#PBS -m abe
#PBS -A <account>

#changing to appropriate directory
cd ~/biom262-hw1

#exercise 1 
cat tf.bed | grep --word-regexp 'NFKB' > tf.nfkb.bed

#exercise 2
awk '{if($3=="transcript"){print $0}}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.ch$

#exercise 3
module load biotools
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 > gencode$

git blame tf.binding
