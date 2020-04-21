#!/bin/bash
java -jar /data/hissummer-mockserver.war  --server.port=$1 --spring.data.mongodb.host=$2 --spring.data.mongodb.port=$3 
