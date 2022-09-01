#!/bin/bash
export JMX_PORT=9999
export KAFKA_HEAP_OPTS="-Xmx3000M -Xms2560M"
export KAFKA_OPTS="-javaagent:/home/rboguszewicz/prometheus/jmx_prometheus_javaagent-0.16.1.jar=80:/home/rboguszewicz/prometheus/kafka_broker.yml"
nohup ~/kafka/bin/kafka-server-start.sh ~/kafka-etc/server.properties > ~/kafka/logs/kafka_start.log 2>&1 &
