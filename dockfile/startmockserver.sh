#!/bin/bash
java -jar /data/mockserver-0.0.2-alpha.war  --server.port=$1 --spring.data.mongodb.host=$2 --spring.data.mongodb.port=$3 &>/dev/null &
