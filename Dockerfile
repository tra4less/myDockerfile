FROM alpine
MAINTAINER n0trace <n0trace@protonmail.com>

RUN apk update && apk upgrade 
RUN apk add yarn
RUN rm -rf /var/cache/apk/*
ENTRYPOINT yarn
