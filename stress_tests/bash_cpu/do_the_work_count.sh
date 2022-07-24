#!/bin/bash

CURRENT=1
END=10000
while [ ${CURRENT} -ne ${END} ]
do
  CURRENT=`expr ${CURRENT} + 1`
  #echo ${CURRENT}
done
