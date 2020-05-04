FROM ubuntu:16.04

RUN apt-get update && apt-get install -y unzip wget && apt-get clean
RUN apt-get install dotnet-sdk-3.1
RUN npm install pm2@latest -g

ARG PTFEEDER_VERSION=1.8.5.1623
ENV PTFEEDER_VERSION ${PT_VERSION}

RUN mkdir -p /app/
WORKDIR /app

RUN curl https://github.com/mehtadone/PTFeeder/releases/download/pt-feeder-v$PT_VERSION/pt-feeder-v$PT_VERSION.zip
RUN unzip pt-feeder-v$PT_VERSION.zip

WORKDIR /app/pt-feeder
RUN chmod +x pt-feeder.dll

VOLUME /app/pt-feeder

CMD pm2 start pm2-PT-Feeder.json && pm2 log 0

