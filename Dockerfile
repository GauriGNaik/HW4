FROM ubuntu:14.04
MAINTAINER Gauri Naik

RUN apt-get -y update
RUN apt-get -y install socat
RUN apt-get -y install curl
RUN echo "Hello World" > abc.txt
