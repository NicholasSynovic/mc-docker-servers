# TCP tunneling software to use
ARG tunnel=lan

# Sets up the base build stage which actually configures the server
FROM openjdk:11-buster AS tunnel-lan

# Change Working Directories
WORKDIR /opt/app

# Expose Minecraft Port
ARG port=25565
ENV PORT=${port}
EXPOSE ${PORT}/tcp
EXPOSE ${PORT}/udp

# Update the timezone
ARG timezone=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo ${timezone} > /etc/timezone

# Update and Upgrade Software
RUN apt update
RUN apt upgrade -y

# Copy files
COPY create_MCSP_file.bash .
COPY mods/ .

# Download the Vanilla Server
ARG vanilla_download=https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
RUN wget ${vanilla_download} --quiet --show-progress -O server.jar

# Execute Vanilla Server
RUN java -jar server.jar

# Configure Minecraft Server

# Accept EULA
RUN echo eula=true > eula.txt

# server.properties file options
ARG allowFlight=false
ARG allowNether=true
ARG broadcastConsoleToOPs=true
ARG broadcastRCONToOPs=true
ARG difficulty=normal
ARG enableCommandBlock=false
ARG enableJMXMonitoring=false
ARG enableQuery=false
ARG enableRCON=false
ARG enableStatus=true
ARG enforceWhitelist=false
ARG entityBroadcastRangePercentage=100
ARG forceGamemode=false
ARG functionPermissionLevel=2
ARG gamemode=survival
ARG generatorSettings=""
ARG generateStructures=true
ARG hardcore=false
ARG levelName=World
ARG levelSeed=""
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
ARG queryPort=${PORT}
ARG rateLimit=0
ARG rconPassword=""
ARG rconPort=25575
ARG resourcePack=""
ARG resourcePackSHA1=""
ARG serverIP=""
ARG serverPort=${PORT}
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

# Configure server.properties
RUN ./create_MCSP_file.bash ${allowFlight} ${allowNether} ${broadcastConsoleToOPs} ${broadcastRCONToOPs} ${difficulty} ${enableCommandBlock} ${enableJMXMonitoring} ${enableQuery} ${enableRCON} ${enableStatus} ${enforceWhitelist} ${entityBroadcastRangePercentage} ${forceGamemode} ${functionPermissionLevel} ${gamemode} ${generatorSettings} ${generateStructures} ${hardcore} ${levelName} ${levelSeed} ${levelType} ${maxBuildHeight} ${maxPlayers} ${maxTickTime} ${maxWorldSize} ${motd} ${networkCompressionThreshold} ${onlineMode} ${OPPermissionLevel} ${playerIdleTimeout} ${preventProxyConnections} ${pvp} ${queryPort} ${rateLimit} ${rconPassword} ${rconPort} ${resourcePack} ${resourcePackSHA1} ${serverIP} ${serverPort} ${snooperEnabled} ${spawnAnimals} ${spawnMonsters} ${spawnNPCs} ${spawnProtection} ${syncChunkWrites} ${textFilteringConfig} ${useNativeTransPORT} ${viewDistance} ${whiteList}

# Create the launcher script
RUN echo '#!/bin/bash' >> start-server.bash

# ngrok tunnel software implementation
FROM tunnel-lan as tunnel-ngrok
ARG ngrok_download=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
ARG ngrok_authtoken
RUN wget ${ngrok_download} --quiet --show-progress -O ngrok.zip
RUN unzip ngrok.zip
RUN echo "./ngrok tcp ${PORT} &" >> start-server.bash
RUN ./ngrok authtoken ${ngrok_authtoken}

# Final build stage of the Dockerfile
FROM tunnel-${tunnel} AS final
# Append data to the launcher script
ARG xms=1G
ARG xmx=1G
RUN echo "java -Xms${xms} -Xmx${xmx} -jar server.jar nogui" >> start-server.bash
RUN chmod +x start-server.bash

# Run the launcher when the container starts
CMD [ "./start-server.bash" ]
