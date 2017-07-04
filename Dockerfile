FROM ubuntu:16.04

MAINTAINER chenjun "jun.chen@youruncloud.com"

RUN apt-get update &&     \
    apt-get install -y    \
        build-essential   \
        openjdk-8-jdk     \
        maven             \
        wget              \
        cmake             \
        make              \
        automake          \
        autoconf          \
        libprotobuf-dev   \
        protobuf-compiler \
        pkg-config        \
        libssl-dev

RUN wget https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz && \
    tar xvzf protobuf-2.5.0.tar.gz && \
    cd protobuf-2.5.0 &&              \
    ./configure &&                    \
    make &&                           \
    make install &&                   \
    ldconfig

RUN cd / &&                  \
    rm -rf protobuf-2.5.0 && \
    rm protobuf-2.5.0.tar.gz

#ADD compile_script.sh /hadoop/
#RUN chmod a+x /hadoop/compile_script.sh

WORKDIR /hadoop

ENTRYPOINT ["./compile_script.sh"]
