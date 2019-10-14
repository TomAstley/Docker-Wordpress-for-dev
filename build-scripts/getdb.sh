#!/bin/bash

if [ ! -d "./mysqldata" ]
then
mkdir mysqldata
fi

# LOADS .env
set -o allexport
[[ -f .env-dev ]] && source .env-dev
set +o allexport

#get database from remote
ssh ${REMOTE_MYSQL_USER}@${REMOTE_SERVER_IP}  mysqldump -u ${REMOTE_SERVER_USER} ${REMOTE_SERVER_DB_NAME} | gzip  > ./mysqldata/dump.sql.gz

#unzip it
gzip -df ./mysqldata/dump.sql.gz

