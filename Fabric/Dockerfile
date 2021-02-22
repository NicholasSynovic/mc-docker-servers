# NOTE: Use DOCKER_BUILDKIT=1 environment variable to improve performance and skip erroneous steps

# Global arguements
ARG tunnel=lan
ARG port=25565

FROM ubuntu:latest AS tunnel-lan
# baseImage arguements
ARG fabric_download=https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar
ARG mc_version=1.16.5
ARG port=25565
ARG timezone=America/Chicago
# Update the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo ${timezone} > /etc/timezone
# Update software
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install openjdk-8-jre -y
# Copy mods into the proper directoy
COPY mods/ /opt/app
# CD into the working directory for the server
WORKDIR /opt/app
# Download Fabric
RUN wget ${fabric_download} --quiet --show-progress -O fabric-installer.jar
# Install Fabric
RUN java -jar fabric-installer.jar server -snapshot -mcversion ${mc_version} -downloadMinecraft -noprofile
# Sign the EULA
RUN echo eula=true > eula.txt
# Global environment variables
ENV PORT=${port}
# Expose tcp/udp ports
EXPOSE ${PORT}/tcp
EXPOSE ${PORT}/udp

FROM tunnel-lan as tunnel-ngrok
# baseImage arguements
ARG ngrok_authtoken
ARG ngrok_download=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
# Install dependencies
RUN apt install unzip -y
# Download ngrok
RUN wget ${ngrok_download} --quiet --show-progress -O ngrok.zip
# Extract ngrok
RUN unzip ngrok.zip
# Run ngrok authentication
RUN ./ngrok authtoken ${ngrok_authtoken}
# Global environment variables
ENV PORT=${port}
# Create start-server.bash
RUN echo './ngrok tcp $PORT &' >> start-server.bash

FROM tunnel-${tunnel} as final
# baseImage Arguements
ARG xms=1024m
ARG xmx=2048m
# Delete server.properties file
RUN rm server.properties
# Create .properties files
RUN touch server.properties
RUN touch fabric-server-launcher.properties
# Append jar execution to start-server.bash
RUN echo 'java -Xms${XMS} -Xmx${XMX} -jar fabric-server-launch.jar nogui' >> start-server.bash
# Make the start file executable
RUN chmod +x start-server.bash
# Create the CMD for the container
CMD ["./start-server.bash" ]
