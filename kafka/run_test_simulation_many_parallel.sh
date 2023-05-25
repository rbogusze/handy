#!/bin/bash

cd ${KAFKA_BIN}

# number of parallel executions, by default 2 if not set with V_EXECUTE variable
[ -z "$V_EXECUTE" ] && V_EXECUTE=2

# range, topic number
CURRENT=0
END=200
while [ 1 ]
do

  V_EXECUTE_COUNT=0
  while [ ${V_EXECUTE_COUNT} -lt ${V_EXECUTE} ]
  do
    echo "running $V_EXECUTE_COUNT"
    # introduce some random stuff
    CURRENT=$[ ( $RANDOM % $END )  + 1 ]

    echo "run test ${CURRENT}"

    # with throuput limit
    #./kafka-producer-perf-test.sh --topic ${TOPIC_NAME}${CURRENT}  --throughput 30000 --num-records 9900000 --record-size 1024 --producer-props acks=all bootstrap.servers=${BOOTSTRAP_SERVERS}

    # no limit
    ./kafka-producer-perf-test.sh --topic ${TOPIC_NAME}${CURRENT}  --throughput -1 --num-records 1900000 --record-size 1024 --producer-props acks=all bootstrap.servers=${BOOTSTRAP_SERVERS} | awk -v var="$CURRENT" '{print var": " $0 }' &
    sleep 1
    V_EXECUTE_COUNT=`expr $V_EXECUTE_COUNT + 1`
  done
  wait $(jobs -p)
  echo "[info] Finished executing $V_EXECUTE processes. Repeating."


done
