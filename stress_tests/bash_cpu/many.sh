#!/bin/bash

pids=""

number=$1
script=$2

START_TIME=`date +%s`

for i in `seq 1 $number`; do
   ./$script &
   pids="$pids $!"
done

wait $pids

END_TIME=`date +%s`
ELAPSED=`expr $END_TIME - $START_TIME`
echo $ELAPSED
