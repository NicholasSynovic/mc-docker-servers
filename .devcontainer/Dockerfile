FROM ubuntu:latest
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt upgrade -y
RUN apt install git -y
RUN apt install wget -y
RUN apt install openjdk-8-jre -y
