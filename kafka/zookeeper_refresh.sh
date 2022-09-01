#!/bin/bash
nohup ~/kafka/bin/zookeeper-server-stop.sh ~/kafka/config/zookeeper.properties
sleep 5
rm -Rf /home/rboguszewicz/zookeeper-data/*
sleep 1
nohup ~/kafka/bin/zookeeper-server-start.sh ~/kafka/config/zookeeper.properties &
