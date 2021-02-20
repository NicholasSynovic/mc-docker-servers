#!/bin/bash
./ngrok http $PORT
java -Xms$XMS -Xmx$XMX -jar fabric-server-launch.jar nogui
