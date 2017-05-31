FROM debian:latest
MAINTAINER n0trace,<n0trace@protonmail.com>

RUN apt-get update \
    && apt-get install -y wget
    
WORKDIR /var/frp
RUN wget https://github.com/fatedier/frp/releases/download/v0.10.0/frp_0.10.0_linux_amd64.tar.gz \
    && tar -zxf frp_0.10.0_linux_amd64.tar.gz \
    && mv frp_0.10.0_linux_amd64/* . \
    && apt-get remove -y wget \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY conf/frps.ini /var/frp/conf/frps.ini

VOLUME /var/frp/conf

EXPOSE 80 443 7000 7500

WORKDIR /var/frp

CMD ./frps -c ./conf/frps.ini