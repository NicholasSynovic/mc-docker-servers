# Dockerized Minecraft Servers

> Dockerfiles that spin up Minecraft Servers

![Docker](https://img.shields.io/badge/-Docker-blue) ![Minecraft](https://img.shields.io/badge/Minecraft-Fabric-green)

## Table of Contents

- [Dockerized Minecraft Servers](#dockerized-minecraft-servers)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Requirements](#requirements)
  - [How to Run - Simple](#how-to-run---simple)
  - [How to Run - Manual](#how-to-run---manual)

## About

This repository contains Dockerfiles meant to automate the process of creating Minecraft servers.

## Requirements

1. A machine running a Linux compatible kernel **OR** Windows Subsystem for Linux.
2. Docker

## How to Run - Simple

These are the instructions to quickly start up a Minecraft server. These instructions rely on a pre-created `install.bash` file that uses default values to create the Minecraft server.

If you want more control as to how your Minecraft server is created, go to the [How to Run - Manual](#how-to-run---manual) instructions.

1. Download the project as a `.zip` file.
2. Extact the `.zip` folder to your local machine.
3. `cd` into the extracted project and into the desired Minecraft server.
4. Run `./install.bash` to install the Minecraft server of your choice.

## How to Run - Manual

1. Download the project as a `.zip` file.
2. Extact the `.zip` folder to your local machine.
3. `cd` into the extracted project and into the desired Minecraft server.
4. Run `docker build -t {server} . --build-args {arguement}={value}` to build the server image.
   1. {server} is a variable that represents a Docker compatible tag name.
   2. See [Docker Image Build Arguements](#docker-image-build-arguements) for more information as to what arguements {arguement} can be as well as accepted values for {value}.
5. Run `docker run -p{local-port}:{remote-port} --name {name} {server}`
   1. {name} is a variable that represents a Docker compatible container name.
   2. {server} is a variable that represents a Docker compatible tag name.
   3. {local-port} is the local port at which the Minecraft servers `tcp/udp` connection will be exposed to. This is the port that will need to be connected to on LAN setups.
   4. {remote-port} is the port in the Docker container that the Minecraft server is sending and recieving `tcp/udp` connections. Default is **25565**.
