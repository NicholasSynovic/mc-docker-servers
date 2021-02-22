#!/bin/bash
# NOTE: Requires a ngrok auth token as an arguement

echo "Building Docker Container"
DOCKER_BUILDKIT=1 docker build -t minecraft_server \
  --build-arg tunnel=ngrok \
  --build-arg ngrok_authtoken=$1

echo "Running Docker Container"
docker run -p25565:25565 --name minecraft minecraft_server
