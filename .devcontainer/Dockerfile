FROM ubuntu:latest

ENV TZ=America/Chicago
ENV EULA=true
ENV MINECRAFT_VERSION=1.16.5
ENV XMS = 1024m
ENV XMX = 2048m

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo eula=$EULA > eula.txt

RUN apt update
RUN apt upgrade -y

RUN apt install git -y
RUN apt install unzip -y
RUN apt install wget -y
RUN apt install openjdk-8-jre -y
