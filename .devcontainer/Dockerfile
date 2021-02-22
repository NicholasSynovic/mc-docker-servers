FROM ubuntu:latest

ENV timezone=America/Chicago

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo ${timezone} > /etc/timezone

RUN apt update
RUN apt upgrade -y

RUN apt install git -y
RUN apt install unzip -y
RUN apt install wget -y
RUN apt install openjdk-11-jre -y
