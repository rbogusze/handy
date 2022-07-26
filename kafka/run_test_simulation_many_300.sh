#!/bin/bash
cd ${KAFKA_BIN}
echo "run test"
START_TIME=`date +%s`

STEP=1

CURRENT=0
END=200
while [ ${CURRENT} -ne ${END} ]
do
  CURRENT=`expr ${CURRENT} + ${STEP}`
  echo "run test ${CURRENT}"
  ./kafka-producer-perf-test.sh --topic ${TOPIC_NAME}${CURRENT}  --throughput 300000 --num-records 9000000 --record-size 1024 --producer-props acks=all bootstrap.servers=${BOOTSTRAP_SERVERS}
  sleep 1

  # create endless loop
  if [ ${CURRENT} -eq $END ]; then
    echo "Once again from start"
    CURRENT=0
  fi
done

END_TIME=`date +%s`
ELAPSED=`expr $END_TIME - $START_TIME`
echo "This took: $ELAPSED seconds"
