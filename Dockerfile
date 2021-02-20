FROM ubuntu:latest

ARG fabric_download
ARG ngrok_authtoken
ARG ngrok_download

ARG mc_version=1.16.5
ARG port=25565
ARG timezone=America/Chicago
ARG xms=1024m
ARG xmx=2048m

ENV PORT=${port}
ENV XMS=${xms}
ENV XMX=${xmx}

COPY mods/ /opt/app
COPY fabric-server-launcher.properties /opt/app
COPY server.properties /opt/app
COPY start-server.bash /opt/app

WORKDIR /opt/app

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo ${timezone} > /etc/timezone
RUN echo eula=true > eula.txt

RUN apt update
RUN apt upgrade -y

RUN apt install unzip -y
RUN apt install wget -y
RUN apt install openjdk-8-jre -y

RUN wget --quiet --show-progress -O ngrok.zip ${ngrok_download}

RUN wget --quiet --show-progress --show-progress -O fabric-installer.jar ${fabric_download}

RUN unzip ngrok.zip

RUN ./ngrok authtoken ${ngrok_authtoken}

RUN java -jar fabric-installer.jar server -mcversion ${mc_version} -downloadMinecraft -noprofile

EXPOSE ${PORT}/tcp
EXPOSE ${PORT}/udp

CMD [ "./start-server.bash" ]
