#!/bin/bash

HADOOP_VERSION=${1:-2.7.2}

docker run -v $(pwd)/:/hadoop/ -v $(pwd)/m2:/root/.m2/ hadoop-compiler $HADOOP_VERSION
