FROM golang as build
ENV CGO_ENABLED=0
RUN git clone https://github.com/fatedier/frp /go/src/github.com/fatedier/frp

WORKDIR /go/src/github.com/fatedier/frp
RUN make

FROM alpine
LABEL maintainer="n0trace@protonmail.com"

COPY conf/frps.ini /etc/frp/frps.ini
COPY --from=build /go/src/github.com/fatedier/frp/bin/frps /bin/frps

VOLUME /etc/frp
EXPOSE 80 443 7000 7500
CMD [ "/bin/frps","-c","/etc/frp/frps.ini" ]