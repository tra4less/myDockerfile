FROM golang as build
ENV CGO_ENABLED=0
RUN go get github.com/qiniu/qshell
WORKDIR /go/src/github.com/qiniu/qshell
RUN go build -o qshell

RUN go get github.com/odise/go-cron
WORKDIR /go/src/github.com/odise/go-cron
RUN go build -o go-cron


FROM alpine
LABEL maintainer="n0trace <n0trace@protonmail.com>"
COPY --from=builder /go/src/github.com/qiniu/qshell/qshell /usr/bin/qshell
COPY --from=builder /go/src/github.com/odise/go-cron/go-cron /usr/bin/go-cron

ENV MYSQLDUMP_OPTIONS --quote-names --quick --add-drop-table --add-locks --allow-keywords --disable-keys --extended-insert --single-transaction --create-options --comments --net_buffer_length=16384
ENV MYSQLDUMP_DATABASE --all-databases
ENV MYSQL_HOST **None**
ENV MYSQL_PORT 3306
ENV MYSQL_USER **None**
ENV MYSQL_PASSWORD **None**

ENV QINIU_ACCESS_KEY **None**
ENV QINIU_SECRET_KEY **None**
ENV QINIU_USER backup
ENV QINIU_BUCKET **None**
ENV QINIU_PREFIX 'backup'
ENV QINIU_FILENAME **None**
ENV MULTI_FILES no
ENV SCHEDULE **None**

ADD run.sh run.sh
ADD backup.sh backup.sh

CMD ["sh", "run.sh"]