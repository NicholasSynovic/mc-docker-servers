#!/bin/bash
# NOTE: Requires a ngrok auth token as an arguement
echo "Building Docker Container"
docker build -t minecraft_server \
  --build-arg fabric_download=https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar \
  --build-arg mc_version=1.16.5 \
  --build-arg ngrok_authtoken=$1 \
  --build-arg ngrok_download=https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip .
echo "Running Docker Container"
docker run -p25565:25565 --name minecraft minecraft_server
