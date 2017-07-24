FROM python:3.6-slim
MAINTAINER n0trace <n0trace@protonmail.com>

RUN pip install shadowsocks
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN rm -rf ~/.cache/pip
# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver"]
