#!/bin/bash

number=$1

for i in `seq 1 $number`; do
  SCORE=`./many.sh $i`
  echo "| $i | $SCORE |"
done
