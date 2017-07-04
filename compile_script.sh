#!/bin/bash

HADOOP_VERSION=${1:-2.7.2}

if [ ! -f "hadoop-$HADOOP_VERSION-src.tar.gz" ]
then
	wget http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION-src.tar.gz
	tar xvfz hadoop-$HADOOP_VERSION-src.tar.gz
else
	rm -rf hadoop-$HADOOP_VERSION-src
	tar xvfz hadoop-$HADOOP_VERSION-src.tar.gz
fi
cd hadoop-$HADOOP_VERSION-src

echo -e "comiling hadoop-$HADOOP_VERSION..."
mvn package -Pdist,native -DskipTests -Dtar

if [[ $? -eq 0 ]]; then
        echo -e "\n\ncomile hadoop $HADOOP_VERSION success!\n\n"
	echo -e "moving target binary to shared volume..."
	mv ./hadoop-dist/target/hadoop-$HADOOP_VERSION.tar.gz /hadoop/output
else
        echo -e "\n\ncomile hadoop $HADOOP_VERSION fail!\n\n"
fi
