#1 /usr/bin/env bash

datasets=~/molb/data-sets/data-sets/data-sets
#Which state has the highest population

states="$datasets/states.tab.gz"

answer_1=$(gzcat $states \
| grep -v '^#' \
| cut -f1,6 \
| sort -k2n \
| tail -n1 \
| cut -f1 \
| sed 's/"//g')
# tr this that
# sed 's/this/that/'

echo "answer-1: $answer_1" > answers.yml

#how many records in sample.fa
 
states="$datasets/sample.fa"

answer_2=$(grep -c '^>' $states)
 
echo "answer-2: $answer_2">>answers.yml

#unique cpg in cpg.bed.gz
 
states="$datasets/cpg.bed.gz"

answer_3=$(gzcat $states | cut -f4 | sort | uniq | wc -l)
 
echo "answer-3: $answer_3" >> answers.yml

#sequence records in sp1.fq file
 
states="$datasets/sp1.fq"
 
answer_4=$(grep -c "@cluster" $states)
 
echo "answer-4: $answer_4" >> answers.yml

#number of words in lines with bloody in hamlet.txt  file
 
states="$datasets/hamlet.txt"
 
answer_5=$(grep -i "bloody" $states | wc -w)
 
echo "answer-5: $answer_5" >> answers.yml

states="$datasets/sample.fa"
  
answer_6=$(grep "ACT" $states| wc -m)
 
echo "answer-6: $answer_6" >> answers.yml

states="$datasets/genes.hg19.bed.gz"

answer_7=$(gzcat $states | awk '{print $4,$3-$2}' | sort -k2nr \
| head -n1 | cut -f1 -d ' ')
 
echo "answer-7: $answer_7" >> answers.yml

states="$datasets/genes.hg19.bed.gz"

answer_8=$(gzcat $states | cut -f1 | sort -k1 | uniq | wc -l)
 
echo "answer-8: $answer_8" >> answers.yml

states="$datasets/peaks.chr22.bed.gz"
 
answer_9=$(gzcat $states | grep 'CTCF$' | wc -l)
 
echo "answer-9: $answer_9" >> answers.yml

states="$datasets/lamina.bed"

answer_10=$(cat $states | awk '{print $1, $3-$2}' | sort -k2nr \
| head -n1 | cut -f1 -d' ')
 
echo "answer-10: $answer_10" >> answers.yml
 

