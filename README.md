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

```bash
docker run -v <your path>/application.properties:/app/ProfitTrailer/application.properties -v <your path>/data:/app/ProfitTrailer/data -p 8081:8081 --name pt jakkie/profit-trailer-docker
```

- After Profit Trailer is running browse to the url example `http://your-ip:8081`

```bash
http://localhost:8081
```
