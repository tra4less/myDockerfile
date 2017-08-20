FROM python:alpine3.6
MAINTAINER n0trace <n0trace@protonmail.com>
RUN pip install shadowsocks --no-cache-dir
ENTRYPOINT ["/usr/local/bin/ssserver"]
