FROM ubuntu:latest
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y
