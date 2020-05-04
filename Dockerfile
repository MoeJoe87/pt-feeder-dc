FROM ubuntu:16.04

RUN apt-get update && apt-get install -y unzip wget && apt-get clean
RUN apt-get install -y unzip curl openjdk-8-jdk
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && bash nodesource_setup.sh
RUN apt-get install -y nodejs && apt-get clean
RUN npm install pm2@latest -g
    
    # Install .NET Core SDK
RUN dotnet_sdk_version=3.1.201 \
    && curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-x64.tar.gz \
    && dotnet_sha512='934bf29734776331691a4724f2174c4e9d2d1dde160f18397fd01abf0f96f2ec1bdd2874db9f0e25dce6993d527ea9c19031a0e67383fd813dcfcb9552ea0c70' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -ozxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    # Trigger first run experience by running arbitrary cmd
    && dotnet help

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
