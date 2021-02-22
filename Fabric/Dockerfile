# NOTE: Use DOCKER_BUILDKIT=1 environment variable to improve performance and skip erroneous steps

# Used for conditional build stages
ARG tunnel=lan

# Sets up the base container from which everything inherits from
FROM ubuntu:latest AS tunnel-lan
ARG fabric_download=https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar
ARG mc_version=1.16.5
ARG port=25565
# Update the timezone
ARG timezone=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo ${timezone} > /etc/timezone
ENV PORT=${port}
EXPOSE ${PORT}/tcp
EXPOSE ${PORT}/udp
WORKDIR /opt/app
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y
# Download and run Fabric
RUN wget ${fabric_download} --quiet --show-progress -O fabric-installer.jar
RUN apt install openjdk-11-jre -y
RUN java -jar fabric-installer.jar server -snapshot -mcversion ${mc_version} -downloadMinecraft -noprofile

# Configures ngrok port-forwarding
FROM tunnel-lan as tunnel-ngrok
ARG ngrok_authtoken
ARG ngrok_download=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN echo './ngrok tcp $PORT &' >> start-server.bash
RUN wget ${ngrok_download} --quiet --show-progress -O ngrok.zip
RUN apt install unzip -y
RUN unzip ngrok.zip
RUN ./ngrok authtoken ${ngrok_authtoken}

FROM tunnel-${tunnel} as final
ARG allowFlight=false
ARG allowNether=true
ARG broadcastConsoleToOPs=true
ARG broadcastRCONToOPs=true
ARG difficulty=normal
ARG enableJMXMonitoring=false
ARG enableCommandBlock=false
ARG enableQuery=false
ARG enableRCON=false
ARG enableStatus=true
ARG enforceWhitelist=false
ARG entityBroadcastRangePercentage=100
ARG forceGamemode=false
ARG functionPermissionLevel=2
ARG gamemode=survival
ARG generatorSettings
ARG generateStructures=true
ARG hardcore=false
ARG levelName=World
ARG levelSeed
ARG levelType=default
ARG maxBuildHeight=256
ARG maxPlayers=20
ARG maxTickTime=60000
ARG maxWorldSize=29999984
ARG motd="A Minecraft Server"
ARG networkCompressionThreshold=256
ARG onlineMode=true
ARG OPPermissionLevel=4
ARG playerIdleTimeout=0
ARG preventProxyConnections=false
ARG pvp=true
ARG queryPort=25565
ARG rateLimit=0
ARG rconPassword
ARG rconPort=25575
ARG resourcePack
ARG resourcePackSHA1
ARG serverIP
ARG serverPort=25565
ARG snooperEnabled=true
ARG spawnAnimals=true
ARG spawnMonsters=true
ARG spawnNPCs=true
ARG spawnProtection=16
ARG syncChunkWrites=true
ARG textFilteringConfig
ARG useNativeTransport=true
ARG viewDistance=12
ARG whiteList=false
ARG xms=1024m
ARG xmx=2048m
RUN ./serverProperties.bash
RUN echo eula=true > eula.txt
COPY mods/ /opt/app
RUN echo 'java -Xms${XMS} -Xmx${XMX} -jar fabric-server-launch.jar nogui' >> start-server.bash
RUN chmod +x start-server.bash
CMD ["./start-server.bash" ]
