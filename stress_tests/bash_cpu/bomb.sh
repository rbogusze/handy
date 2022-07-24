#!/bin/bash

number=$1
script=$2

if [ "$script" == "do_the_work_sha.sh" ]; then
  echo "creating sample.txt.gz for do_the_work_sha.sh script"
  dd if=/dev/zero bs=1024 count=2024288 | gzip > sample.txt.gz
fi

for i in `seq 1 $number`; do
  SCORE=`./many.sh $i $script`
  echo "| $i | $SCORE |"
done
