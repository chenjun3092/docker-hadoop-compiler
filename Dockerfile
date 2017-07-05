FROM ubuntu:16.04

MAINTAINER chenjun "jun.chen@youruncloud.com"

COPY repo-src/sources.list.local /etc/apt/sources.list

RUN apt-get update  \
    && apt-get install -yq \
    build-essential \
    openjdk-8-jdk   \
    maven   \
    wget    \
    cmake   \
    make    \
    automake    \
    autoconf    \
    libprotobuf-dev \
    protobuf-compiler   \
    pkg-config  \
    libssl-dev  \
    && rm -rf /var/lib/apt/lists/*

#RUN wget https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz  \
RUN wget http://192.168.137.88/package/hadoop/protobuf-2.5.0.tar.gz  \
    && tar xvzf protobuf-2.5.0.tar.gz   \
    && cd protobuf-2.5.0    \
    && ./configure  \
    && make \
    && make install \
    && ldconfig \
    && cd / \ 
    && rm -rf protobuf-2.5.0   \
    && rm protobuf-2.5.0.tar.gz

#ADD compile_script.sh /hadoop/
#RUN chmod a+x /hadoop/compile_script.sh

WORKDIR /hadoop

ENTRYPOINT ["./compile_script.sh"]
