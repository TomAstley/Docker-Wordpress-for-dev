#!/bin/bash

# LOADS .env
set -o allexport
[[ -f .env-dev ]] && source .env-dev
set +o allexport
rsync -avz ${REMOTE_SERVER_USER}@${REMOTE_SERVER_IP}:${REMOTE_SERVER_PLUGIN_PATH} ./plugins