FROM alpine:latest

MAINTAINER dianaesteves

RUN apk update && apk add --update curl python openjdk7-jre && \
    mkdir /opt && cd /opt && \
    curl -O --location  https://github.com/brianfrankcooper/YCSB/releases/download/0.10.0/ycsb-0.10.0.tar.gz && \
    tar xfz *.tar.gz && \
    rm -rf *.tar.gz
    
ENV YCSB=/opt/ycsb-0.10.0  \
    PATH=${PATH}:/usr/bin

WORKDIR ${YCSB} 

ENTRYPOINT ["./bin/ycsb"] 
CMD ["--help"]


