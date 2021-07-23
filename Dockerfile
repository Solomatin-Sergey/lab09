FROM ubuntu:18.04

RUN apt update -y && apt install -yy gcc g++ cmake

COPY . application/
WORKDIR application/

RUN cmake . && make

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

ENTRYPOINT ./hello_world
