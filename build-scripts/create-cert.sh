#!/bin/bash

# LOADS .env
set -o allexport
[[ -f .env-dev ]] && source .env-dev
set +o allexport

docker exec ${PROJECT_NAME} /bin/bash -c 'apt-get update && \
     apt-get install -y  --no-install-recommends ssl-cert && \
     rm -r /var/lib/apt/lists/* && \
     a2enmod ssl && \
     a2ensite default-ssl
     service apache2 reload'

