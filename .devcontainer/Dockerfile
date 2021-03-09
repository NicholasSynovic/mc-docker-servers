FROM openjdk:11-jre-buster

ENV timezone=America/Chicago

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo ${timezone} > /etc/timezone

RUN apt update
RUN apt upgrade -y

RUN apt install git -y
