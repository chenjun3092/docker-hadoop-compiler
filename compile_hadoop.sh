#!/bin/bash

#docker run -v $(pwd)/:/hadoop/ hadoop-compiler 2.6.5
#docker run -v $(pwd)/:/hadoop/ hadoop-compiler 2.7.2
#docker run -v $(pwd)/:/hadoop/ -v $(pwd)/m2:/root/.m2/ hadoop-compiler 2.6.5
docker run -v $(pwd)/:/hadoop/ -v $(pwd)/m2:/root/.m2/ hadoop-compiler 2.7.2
