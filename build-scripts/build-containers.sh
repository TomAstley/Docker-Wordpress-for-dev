#!/bin/bash
set -a
source .env-dev
cat docker-compose.yml | envsubst | docker-compose -f - up -d
docker-compose -f docker-compose.yml up -d

#load themes
cd themes
if [ -z "$(ls -A $THEME_NAME)" ]; then
#empty fodler
echo 'Creating a new theme.'
composer create-project roots/sage $THEME_NAME
composer install
else
echo 'Theme is already installed.'

fi

cd $THEME_NAME
yarn
yarn build:production