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
  --name=pt-feeder \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Zurich \
  -v /path/to/profittrailer/application.properties:/app/ProfitTrailer/application.properties \
  -v /path/to/feeder-config:/app/pt-feeder/config \
  -v /path/to/feeder-database:/app/pt-feeder/database \
  -v /path/to/feeder-logs:/app/pt-feeder/logs \
  --restart unless-stopped \
  moli87/pt-feeder-dc:latest
```

### docker-compose

Compatible with docker-compose v3 schemas

```bash
---
version: '3'

services:
  ptfeeder:
    image: moli87/pt-feeder-dc:latest
    container_name: pt-feeder
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Zurich
    volumes:
      - ./application.properties:/app/ProfitTrailer/application.properties
      - ./config:/app/pt-feeder/config
      - ./database:/app/pt-feeder/database
      - ./logs:/app/pt-feeder/logs
    restart: unless-stopped
```
