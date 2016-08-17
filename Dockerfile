FROM alpine:latest
MAINTAINER dianaesteves
RUN apk update && apk add --update curl python && \
    mkdir /opt && cd /opt && \
    curl -O --location  https://github.com/brianfrankcooper/YCSB/releases/download/0.10.0/ycsb-0.10.0.tar.gz && \
    tar xfz *.tar.gz && \
    rm -rf *.tar.gz
    
ENV YCSB=/opt/ycsb-0.10.0
WORKDIR ${YCSB} 

ENTRYPOINT ["./bin/ycsb"] 
CMD ["--help"]


