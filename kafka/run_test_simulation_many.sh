#!/bin/bash
cd /home/rboguszewicz/kafka/bin
echo "run test"
START_TIME=`date +%s`

STEP=1

CURRENT=0
END=200
while [ ${CURRENT} -ne ${END} ]
do
  CURRENT=`expr ${CURRENT} + ${STEP}`
  echo "run test ${CURRENT}"
  ./kafka-producer-perf-test.sh --topic ${TOPIC_NAME}${CURRENT}  --throughput 30000 --num-records 900000 --record-size 1024 --producer-props acks=all bootstrap.servers=${BOOTSTRAP_SERVERS}
  sleep 1
done

END_TIME=`date +%s`
ELAPSED=`expr $END_TIME - $START_TIME`
echo "This took: $ELAPSED seconds"
