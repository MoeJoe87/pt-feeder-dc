# pt-feeder-dc

PT Feeder Docker

Note: This is an addon for Profit Trailer

Compatible with Profit Trailer version : v2.4.25 and above
`https://wiki.profittrailer.com/doku.php`

## Install Docker

- Windows `https://docs.docker.com/toolbox/toolbox_install_windows/`
- Mac OS `https://docs.docker.com/docker-for-mac/install/`
- Linux Ubuntu `https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce`

## Quick Guide

### Run latest PT Feeder version

- Download and edit application.properties with your license key and exchange apis, other wise the bot will not start. See for `https://wiki.profittrailer.com/doku.php?id=start` reference.
- To Run Container and replace `<your path>` with the full path where the application.properties file and data folder are.

### docker

```bash
docker create \
  --name=radarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 7878:7878 \
  -v /path/to/data:/config \
  -v /path/to/movies:/movies \
  -v /path/to/downloadclient-downloads:/downloads \
  --restart unless-stopped \
  linuxserver/radarr
```

### docker-compose

Compatible with docker-compose v3 schemas

```bash
---
version: "2.1"
services:
  radarr:
    image: moli87/pt-feeder-dc
    container_name: pt-feeder
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - /path/to/data:/config
      - /path/to/movies:/movies
      - /path/to/downloadclient-downloads:/downloads
    restart: always
```
