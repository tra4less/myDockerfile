#! /bin/sh

set -e

if [ "${QINIU_ACCESS_KEY}" == "**None**" ]; then
  echo "Warning: You did not set the QINIU_ACCESS_KEY environment variable."
fi

if [ "${QQINIU_SECRET_ACCESS}" == "**None**" ]; then
  echo "Warning: You did not set the QQINIU_SECRET_ACCESS environment variable."
fi

if [ "${QINIU_BUCKET}" == "**None**" ]; then
  echo "You need to set the QINIU_BUCKET environment variable."
  exit 1
fi

if [ "${MYSQL_HOST}" == "**None**" ]; then
  echo "You need to set the MYSQL_HOST environment variable."
  exit 1
fi

if [ "${MYSQL_USER}" == "**None**" ]; then
  echo "You need to set the MYSQL_USER environment variable."
  exit 1
fi

if [ "${MYSQL_PASSWORD}" == "**None**" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable or link to a container named MYSQL."
  exit 1
fi



# login qiniu
qshell account $QINIU_ACCESS_KEY $QINIU_SECRET_ACCESS $QINIU_USER

MYSQL_HOST_OPTS="-h $MYSQL_HOST -P $MYSQL_PORT -u$MYSQL_USER -p$MYSQL_PASSWORD"
DUMP_START_TIME=$(date +"%Y-%m-%dT%H%M%SZ")

copy_qiniu () {
  SRC_DIR=$1
  SRC_FILE=$2
  DEST_FILE=$3

  echo "Uploading ${DEST_FILE} on QINIU..."

  qshell qupload2  --src-dir=$SRC_DIR  --file-list=$SRC_FILE --bucket=$QINIU_BUCKET

  if [ $? != 0 ]; then
    >&2 echo "Error uploading ${DEST_FILE} on QINIU"
  fi

  rm "${SRC_DIR}/${SRC_FILE}"
}
# Multi file: yes
if [ ! -z "$(echo $MULTI_FILES | grep -i -E "(yes|true|1)")" ]; then
  if [ "${MYSQLDUMP_DATABASE}" == "--all-databases" ]; then
    DATABASES=`mysql $MYSQL_HOST_OPTS -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys|innodb)"`
  else
    DATABASES=$MYSQLDUMP_DATABASE
  fi

  for DB in $DATABASES; do
    echo "Creating individual dump of ${DB} from ${MYSQL_HOST}..."

    DUMP_DIR="/tmp"
    DUMP_FILE="${DB}.sql.gz"

    mysqldump $MYSQL_HOST_OPTS $MYSQLDUMP_OPTIONS --databases $DB | gzip > $DUMP_FILE

    if [ $? == 0 ]; then
      if [ "${QINIU_FILENAME}" == "**None**" ]; then
        QINIU_FILE="${DUMP_START_TIME}.${DB}.sql.gz"
      else
        QINIU_FILE="${QINIU_FILENAME}.${DB}.sql.gz"
      fi

      copy_qiniu $DUMP_DIR $DUMP_FILE $QINIU_FILE
    else
      >&2 echo "Error creating dump of ${DB}"
    fi
  done
# Multi file: no
else
  echo "Creating dump for ${MYSQLDUMP_DATABASE} from ${MYSQL_HOST}..."

  DUMP_DIR="/tmp"
  DUMP_FILE="dump.sql.gz"
  mysqldump $MYSQL_HOST_OPTS $MYSQLDUMP_OPTIONS $MYSQLDUMP_DATABASE | gzip > $DUMP_FILE

  if [ $? == 0 ]; then
    if [ "${QINIU_FILENAME}" == "**None**" ]; then
      QINIU_FILE="${DUMP_START_TIME}.dump.sql.gz"
    else
      QINIU_FILE="${QINIU_FILENAME}.sql.gz"
    fi

    copy_qiniu $DUMP_DIR $DUMP_FILE $QINIU_FILE
  else
    >&2 echo "Error creating dump of all databases"
  fi
fi

echo "SQL backup finished"
