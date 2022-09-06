#!/bin/bash
cd /home/rboguszewicz/kafka/bin
echo "run test"
START_TIME=`date +%s`
./kafka-producer-perf-test.sh --topic ${TOPIC_NAME} --throughput 30000 --num-records 9000000 --record-size 1024 --producer-props acks=all bootstrap.servers=${BOOTSTRAP_SERVERS}
END_TIME=`date +%s`
ELAPSED=`expr $END_TIME - $START_TIME`
echo "This took: $ELAPSED seconds"
