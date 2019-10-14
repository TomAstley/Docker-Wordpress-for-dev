#!/bin/bash

# LOADS .env
set -o allexport
[[ -f .env-dev ]] && source .env-dev
set +o allexport

#copy myql dump file to docker mysql database
docker cp ./mysqldata/dump.sql ${PROJECT_NAME}-mysql:/dump.sql
docker cp ./scripts/updatedb.sql ${PROJECT_NAME}-mysql:/updatedb.sql

#run the dump file on the docker mysql database
docker exec -i ${PROJECT_NAME}-mysql /bin/sh -c 'mysql -uroot -proot '${DATABASE_NAME}' < ./dump.sql'
docker exec -i ${PROJECT_NAME}-mysql /bin/sh -c 'mysql -uroot -proot '${DATABASE_NAME}' < ./updatedb.sql'