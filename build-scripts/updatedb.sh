#!/bin/bash

# LOADS .env
set -o allexport
[[ -f .env-dev ]] && source .env-dev
set +o allexport

#copy myql dump file to docker mysql database
docker cp ./mysqldata/dump.sql ${PROJECT_NAME}-mysql:/dump.sql

#run the dump file on the docker mysql database
docker exec -i ${PROJECT_NAME}-mysql /bin/sh -c 'mysql -u'${WORDPRESS_DB_USER}' -p'${MYSQL_PASSWORD}' '${DATABASE_NAME}' < ./dump.sql'

#update database with local url
docker exec -i ${PROJECT_NAME}-mysql mysql -u${WORDPRESS_DB_USER} -p${MYSQL_PASSWORD} -e 'use '${DATABASE_NAME}'; update '${WORDPRESS_TABLE_PREFIX}options' SET option_value = "'${LOCAL_SERVER_URL}'" where option_value = "'${REMOTE_SERVER_URL}'"' 
