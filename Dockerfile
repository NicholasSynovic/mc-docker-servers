FROM ubuntu:latest

ENV TZ=America/Chicago
ENV EULA=true
ENV MINECRAFT_VERSION=1.16.5
ENV XMS = 1024m
ENV XMX = 2048m

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt upgrade -y

RUN apt install wget -y
RUN apt install openjdk-8-jre -y

RUN wget --quiet --show-progress --output-document fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar

RUN java -jar fabric-installer.jar server -mcversion $MINECRAFT_VERSION -downloadMinecraft -noprofile

RUN java -Xms$XMS -Xmx$XMX -jar fabric-server-launch.jar nogui

RUN rm eula.txt

RUN echo eula=$EULA > eula.txt

RUN java -Xms$XMS -Xmx$XMX -jar fabric-server-launch.jar nogui
