#!/bin/bash

echo "Building Docker Container"
docker build -t minecraft_server .

echo "Running Docker Container"
docker run -p25565:25565 --name minecraft minecraft_server
