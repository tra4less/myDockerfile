FROM python:3.6-alpine
MAINTAINER n0trace,<n0trace@protonmail.com>
WORKDIR /spiderkeeper
RUN pip install --no-cache-dir spiderkeeper
EXPOSE 5000 6800
CMD ["spiderkeeper"]
