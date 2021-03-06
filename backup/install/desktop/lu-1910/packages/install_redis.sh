#!/bin/bash

echo "Installing Redis"

REDIS_VER="5.0"
REDIS_REPO_DIR="${HOME}/redis"


#----------------------------------------
# Redis => Git Repository
#----------------------------------------
# TODO:
#
# TODO: Customize for Proxy Server Install etc.
#
# NOTES:
#
# Proxy Server Git Config:
#
#   git config --global http.proxy 'socks5://127.0.0.1:8888'
#
#   OR
#
#   [http]
#      proxy = socks5://127.0.0.1:8888
#
#-----------------------------------------

Pacs=""

# Clone Repository
git clone -b ${REDIS_VER} https://github.com/antirez/redis.git ${REDIS_REPO_DIR}

DIR_PREV=${PWD}
cd ${REDIS_REPO_DIR}

# TODO: Ensure Correct Directory etc.

# Build Redis and Install
make && make test && make install && sudo \
    REDIS_PORT=6379 \
    REDIS_CONFIG_FILE=/etc/redis/6379.conf \
    REDIS_LOG_FILE=/home/brian/data/redis/redis_6379.log \
    REDIS_DATA_DIR=/home/brian/data/redis/6379 \
    REDIS_EXECUTABLE=`command -v redis-server` ./utils/install_server.sh

# TODO: Provide a noticable alert if anything failed.

# Start Server
sudo systemctl enable redis_6379.service
sudo systemctl start redis_6379.service

# Probably Not Necessary
cd "${DIR_PREV}"
