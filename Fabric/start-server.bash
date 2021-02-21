#!/bin/bash
./ngrok tcp $PORT &
java -Xms${XMS} -Xmx${XMX} -jar fabric-server-launch.jar nogui
