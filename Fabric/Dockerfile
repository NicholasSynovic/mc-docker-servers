# Sets up the base container from which everything inherits from
FROM openjdk:11-jre-buster

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

# Download Fabric Server
ARG fabric_download=https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar
RUN wget ${fabric_download} --quiet --show-progress -O fabric-installer.jar

# Execute Fabric Server
ARG mc_version=1.16.5
RUN java -jar fabric-installer.jar server -snapshot -mcversion ${mc_version} -downloadMinecraft -noprofile

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
ARG queryPort=25565
ARG rateLimit=0
ARG rconPassword=""
ARG rconPort=25575
ARG resourcePack=""
ARG resourcePackSHA1=""
ARG serverIP=""
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

# Configure server.properties
RUN ./create_MCSP_file.bash ${allowFlight} ${allowNether} ${broadcastConsoleToOPs} ${broadcastRCONToOPs} ${difficulty} ${enableCommandBlock} ${enableJMXMonitoring} ${enableQuery} ${enableRCON} ${enableStatus} ${enforceWhitelist} ${entityBroadcastRangePercentage} ${forceGamemode} ${functionPermissionLevel} ${gamemode} ${generatorSettings} ${generateStructures} ${hardcore} ${levelName} ${levelSeed} ${levelType} ${maxBuildHeight} ${maxPlayers} ${maxTickTime} ${maxWorldSize} ${motd} ${networkCompressionThreshold} ${onlineMode} ${OPPermissionLevel} ${playerIdleTimeout} ${preventProxyConnections} ${pvp} ${queryPort} ${rateLimit} ${rconPassword} ${rconPort} ${resourcePack} ${resourcePackSHA1} ${serverIP} ${serverPort} ${snooperEnabled} ${spawnAnimals} ${spawnMonsters} ${spawnNPCs} ${spawnProtection} ${syncChunkWrites} ${textFilteringConfig} ${useNativeTransport} ${viewDistance} ${whiteList}

# Create the launcher script
RUN echo 'java -Xms${XMS} -Xmx${XMX} -jar fabric-server-launch.jar nogui' >> start-server.bash
RUN chmod +x start-server.bash

# Run the launcher when the container starts
CMD ["./start-server.bash" ]
