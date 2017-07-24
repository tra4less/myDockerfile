FROM python:3.6-slim
MAINTAINER n0trace <n0trace@protonmail.com>
RUN pip install shadowsocks
RUN rm -rf ~/.cache/pip
ENTRYPOINT ["/usr/local/bin/ssserver"]
