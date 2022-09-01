#!/bin/bash
cd /home/rboguszewicz/kafka/bin
echo "create topic"
./kafka-topics.sh --zookeeper 127.0.0.1:2181/kafka_0234 --topic temperature --create --partitions 3 --replication-factor 3
echo "sleep 2"
sleep 2
echo "decrease retention"
./kafka-configs.sh --zookeeper 127.0.0.1:2181/kafka_0234 --alter --entity-type topics --entity-name temperature --add-config 'retention.ms=6000000000'
echo "sleep 2"
sleep 2
echo "run test"
START_TIME=`date +%s`
#./kafka-producer-perf-test.sh --topic temperature --throughput 30000 --num-records 9000000 --record-size 1024 --producer-props acks=all bootstrap.servers=10.189.158.237:9092,10.189.137.172:9092,10.189.142.234:9092
./kafka-producer-perf-test.sh --topic temperature --throughput 30000 --num-records 9000000 --record-size 1024 --producer-props acks=all bootstrap.servers=${BOOTSTRAP_SERVERS}
END_TIME=`date +%s`
ELAPSED=`expr $END_TIME - $START_TIME`
echo "This took: $ELAPSED seconds"
