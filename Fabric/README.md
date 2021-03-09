# Fabric Server Configurable Arguements

## Table of Contents

- [Fabric Server Configurable Arguements](#fabric-server-configurable-arguements)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [Docker Container Arguements](#docker-container-arguements)
  - [Fabric Server Arguements](#fabric-server-arguements)
  - [Minecraft Server Arguements](#minecraft-server-arguements)
  - [Java Arguements](#java-arguements)

## About

This document is meant to provide end-users with a list of arguements that can be passed into the Dockerfile via the `install.bash` file.

To add arguements, simply add the `--build-arg` flag followed by `ARGUEMENT_NAME=VALUE` to set the value of any of these arguements listed here.

## Docker Container Arguements

These arguements directly affect how the Docker container is created. These do not affect the Minecraft, Fabric, or Java servers' functionality.

- `port`
  - Description: The port to be exposed for players to connect to. This will be set in the `server.properties` file automatically for the `queryPort` and `serverPort` values if those are not explicitly defined.
  - Default: 25565
- `timezone`
  - Description: The timezone of the server set by `TZData`.
  - Default: America/Chicago

## Fabric Server Arguements

- `fabric_download`
  - Description: The download link to a version of the Fabric Server installer.
  - Default: [https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar](https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar)
- `mc_version`
  - Description: Any officially supported version of Minecraft that Fabric supports *including snapshots*.
  - Default: 1.16.5

## Minecraft Server Arguements

Any `key=value` that is in a `server.properties` file can be inserted as a build arguement for the container. The name of the key does not need to be changed either. And the default values for the keys are the `server.properties` default values.

## Java Arguements

- `xms`
  - Description: The minimum amount of ram to allocate to the server.
  - Default: 1024m
- `xmx`
  - Description: The maximum amount of ram to allocate to the server
  - Default: 2048m
