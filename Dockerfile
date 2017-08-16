FROM python:3.6-slim
MAINTAINER n0trace,<n0trace@protonmail.com>
RUN apt-get update && \
    apt-get install -y gcc &&\
	rm -rf /var/cache/apt/*
RUN pip install --no-cache-dir scrapy==1.4.0
VOLUME /app
WORKDIR /app
CMD ["scrapy"]
