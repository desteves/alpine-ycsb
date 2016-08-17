FROM alpine:latest


RUN apk update && apk add --update curl && \
    mkdir /opt && cd /opt && \
    curl -O --location  https://github.com/brianfrankcooper/YCSB/releases/download/0.10.0/ycsb-0.10.0.tar.gz && \
    tar xfz *.tar.gz 
    
# ENV YCSB=/opt/YCSB
# WORKDIR ${YCSB} 
# ADD url_git_ycsb_files ${YCSB}  


# EXPOSE 27017

# CMD [".bin/ycsb","--help"] 
CMD ["/bin/sh"] 
