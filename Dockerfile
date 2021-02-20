FROM ubuntu:latest

ENV TZ=America/Chicago
ENV EULA=true
ENV MINECRAFT_VERSION=1.16.5
ENV XMS=1024m
ENV XMX=2048m
ENV NGROK_AUTHTOKEN=
ENV NGROK_LINK=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
ENV PORT=25565

COPY mods/ /opt/app
COPY fabric-server-launcher.properties /opt/app
COPY server.properties /opt/app
COPY start.bash /opt/app

WORKDIR /opt/app

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo eula=$EULA > eula.txt

RUN apt update
RUN apt upgrade -y

RUN apt install unzip -y
RUN apt install wget -y
RUN apt install openjdk-8-jre -y

RUN RUN wget --quiet --show-progress -O ngrok.zip $NGROK_LINK

RUN wget --quiet --show-progress --show-progress -O fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar

RUN unzip ngrok.zip

RUN ./ngrok authtoken $NGROK_AUTHTOKEN

RUN java -jar fabric-installer.jar server -mcversion $MINECRAFT_VERSION -downloadMinecraft -noprofile

CMD [ "./start.bash" ]
