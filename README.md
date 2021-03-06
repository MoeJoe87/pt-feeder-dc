# pt-feeder-dc

PT Feeder Docker

[![Docker Pulls](https://img.shields.io/docker/pulls/moli87/pt-feeder-dc.svg?label=pulls&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/moli87/pt-feeder-dc/)
[![Docker Stars](https://img.shields.io/docker/stars/moli87/pt-feeder-dc.svg?label=stars&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/moli87/pt-feeder-dc/)
[![](https://images.microbadger.com/badges/image/moli87/pt-feeder-dc.svg)](https://microbadger.com/images/moli87/pt-feeder-dc/ "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/moli87/pt-feeder-dc.svg)](https://microbadger.com/images/moli87/pt-feeder-dc/ "Get your own version badge on microbadger.com")
[![Docker Build Status](https://img.shields.io/docker/cloud/build/moli87/pt-feeder-dc.svg?label=build&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/moli87/pt-feeder-dc/)

Note: This is an addon for Profit Trailer

Compatible with Profit Trailer version : v2.4.25 and above
`https://wiki.ptfeeder.co/`

## Install Docker

- Windows `https://docs.docker.com/toolbox/toolbox_install_windows/`
- Mac OS `https://docs.docker.com/docker-for-mac/install/`
- Linux Ubuntu `https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce`

## Quick Guide

### Run latest PT Feeder version

- Download and edit settings from PT Feeder. See for `https://wiki.ptfeeder.co/` reference.
- To create Container just replace `/path/to/""` with the full path where the files and other folders are.

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
  moli87/pt-feeder-dc
```

### docker-compose

Compatible with docker-compose v3 schemas

```bash
---
version: '3'

services:
  ptfeeder:
    image: moli87/pt-feeder-dc
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
If you like it, support appreciated!

BTC: 17cqx7P6aRn9egZfSkzbyNqKjd3Xm6W9T4

BCH: qq020gjmrd83rfaut4fzrncc8ejlv32q4yuhnzgc5c

BNB: bnb1m6fn76pplwf3pwem62ghcpryruu0kmnmrmsq22

ETH: 0x4B2895914147787d0C15868F86c460aF6Fb45D91

LTC: LbvRzuBrF4eVrEC2zkHveQAxEyfaNBAa3j

XMR: 45sS3GEkui1LosH14zvnvwChqEy8sK4pJXWAax1VvSD9BSN9qUsAuzsVwoTrvMjFndS9LpYpGBpCwY9JxifzxAW16wWsAAY
