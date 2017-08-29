FROM alpine
MAINTAINER n0trace <n0trace@protonmail.com>

RUN apk update 
RUN apk add yarn --no-cache
CMD yarn
