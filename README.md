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
    - [Docker Image Build Arguements](#docker-image-build-arguements)
      - [NOTE](#note)
    - [Bukkit](#bukkit)
      - [Fabric](#fabric)
      - [Forge](#forge)
      - [Paper](#paper)
      - [Spigot](#spigot)
      - [Vanilla](#vanilla)

## About

This repository contains Dockerfiles meant to automate the process of creating Minecraft servers.

The benefit of using these Dockerfiles over creating the servers yourself is that by leveraging tools such as `ngrok`, a server can be ran locally whilst still allowing for remote connections over `tcp` without having to configure port forwarding.

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

### Docker Image Build Arguements

Below is a list of Docker Image Build Arguements sorted by Minecraft server name.

#### NOTE

Just because two Docker Images utilize the same arguement name, does not mean that they accept the same range of values! Please read the each server's section in its entirety before using these arguements

### Bukkit

- TBD

#### Fabric

- fabric_download
  - The URL to a version of the Fabric modding toolchain.
- ngrok_authtoken
  - The authentication token for an ngrok user
- ngrok_download
  - The URL to a version of ngrok.
- mc_version
  - A version of Minecraft that is compatible with Fabric.
  - **Default:** 1.16.5
  - **Range:** Any officially supported version of Minecraft that Fabric supports *excluding snapshots*.
- port
  - The port that the container will use to host the Minecraft server.
  - **Default:** 25565
  - **Range:** Any open port not restricted by Docker or your machine.
- timezone
  - The timezone of the server. Needed for TZData.
  - **Default:** America/Chicago
  - **Range:** Any timezone that is supported by TZData
- xms
  - The minimum amount of memory to give to the server
  - **Default:** 1024m
  - **Range:** Any amount of memory that is supported by Docker and your machine greater than 0m. Suppported size formats can be found [here](https://minecraft.gamepedia.com/Server/Requirements#Server_requirements).
- xmx
  - The maximum amount of memory to give to the server
  - **Default:** 2048m
  - **Range:** Any amount of memory that is supported by Docker and your machine greater than the value for *xms*. Suppported size formats can be found [here](https://minecraft.gamepedia.com/Server/Requirements#Server_requirements).

#### Forge

- TBD

#### Paper

- TBD

#### Spigot

- TBD

#### Vanilla

- TBD
