#!/bin/bash
export MYSQL_HOST
export MYSQL_PORT
export MYSQL_USER
export MYSQL_PASSWORD
export MYSQL_DATABASE

set -e

echo "[database]
MYSQL_HOST = ${MYSQL_HOST}
MYSQL_PORT = ${MYSQL_PORT}
MYSQL_DB = ${MYSQL_DATABASE}
MYSQL_USER = ${MYSQL_USER}
MYSQL_PASSWORD = ${MYSQL_PASSWORD}" > backend.conf

./wait-for-it.sh -h ${MYSQL_HOST} -p ${MYSQL_PORT} -t 90 -- echo "database container running"

exec "$@"
