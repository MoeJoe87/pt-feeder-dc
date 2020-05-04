FROM ubuntu:16.04

RUN apt-get update && apt-get install -y unzip wget && apt-get clean
RUN apt-get install -y unzip curl openjdk-8-jdk
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && bash nodesource_setup.sh
RUN apt-get install -y nodejs && apt-get clean
RUN npm install pm2@latest -g
RUN apt-get install software-properties-common -y
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-add-repository https://packages.microsoft.com/ubuntu/16.04/prod
RUN apt-get update && apt-get install -y dotnet-sdk-2.2 && apt-get clean

ARG PTFEEDER_VERSION=1.8.5.1623
ENV PTFEEDER_VERSION ${PTFEEDER_VERSION}

RUN mkdir -p /app/
WORKDIR /app

RUN wget https://github.com/mehtadone/PTFeeder/releases/download/pt-feeder-v$PTFEEDER_VERSION/pt-feeder-v$PTFEEDER_VERSION.zip
RUN unzip pt-feeder-v$PTFEEDER_VERSION.zip

WORKDIR /app/pt-feeder
RUN chmod +x pt-feeder.dll

VOLUME /app/pt-feeder

CMD pm2 start pm2-PT-Feeder.json && pm2 log 0
