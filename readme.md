# Docker Wordpres Starter

Super simple Docker Wordpress for local development.

# Requirements
* Docker
* docker-compose  3.3+
* node v8.9.1+
* Yarn v1.7.0+

# Usage

```npm install```

```npm run setup```


Running setup will prompt you with:

**Is this a new build? (Y/N)**

New builds are completely fresh Wordpress builds ready for you to start a local development.

If you have an existing Wordpress site, select 'N' and the scripts will pull the database, uploads, and plugin directories from your remote server designated in the .env-dev file. Make sure your WORDPRESS_TABLE_PREFIX and THEME_NAME match your remote build. You will have to add your theme files yourself, and it will automatically set up a Sage theme for you.

```npm run update```
Updates plugins, uploads and database if you have exisiting Wordpress installation online.


# How it works
Setup will do the following:
* Build Wordpress Docker container
* Build MySql Docker container
* Downloads the Sage template and install via composer
* Install template dependencies via Yarn
* Compiles assets via Yarn
* Install an SSL Cert
* Get the latest database from the remote (if not a new build)
* Update database paths
* Get uploads from the live site. (if not a new build)


# Notes
* All environment settings are located in .env-dev
* This was developed with the [Sage Wordpress theme](https://roots.io/sage/) but you can add whatever you like.
* It would be a good idea to setup a host file entry instead of using https://localhost all the time. Esprecially if you want to run multiple Wordpress containers.
* If you are using this with a existing Wordpress installation it much easier and safer to utilize SSH keys.


# Sage commands
* yarn start — Compile assets when file changes are made, start Browsersync session
* yarn build — Compile and optimize the files in your assets directory
* yarn build:production — Compile assets for production

# Links
* [Docker](https://www.docker.com/)
* [Sage](https://roots.io/sage/)
