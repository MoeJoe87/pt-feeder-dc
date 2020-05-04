FROM ubuntu:16.04

RUN apt-get update && apt-get install -y unzip wget && apt-get clean
RUN npm install pm2@latest -g

# Install .NET CLI dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu60 \
        libssl1.1 \
        libstdc++6 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*
    
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
ENV PTFEEDER_VERSION ${PT_VERSION}

RUN mkdir -p /app/
WORKDIR /app

RUN curl https://github.com/mehtadone/PTFeeder/releases/download/pt-feeder-v$PT_VERSION/pt-feeder-v$PT_VERSION.zip
RUN unzip pt-feeder-v$PT_VERSION.zip

WORKDIR /app/pt-feeder
RUN chmod +x pt-feeder.dll

VOLUME /app/pt-feeder

CMD pm2 start pm2-PT-Feeder.json && pm2 log 0
