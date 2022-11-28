#!/bin/bash

set -e

export MYSQL_DATABASE
export MYSQL_USER
export MYSQL_PASSWORD
export MYSQL_HOST
export STUDENT_NAME
export STUDENT_NO
export BACKEND_HOST
export BACKEND_PORT

#wait for mysql database service running > then sleep while gunicorn starts
./wait-for-it.sh -h ${MYSQL_HOST} -p ${MYSQL_PORT} -t 90 -- sleep 20 && echo "sleeping"

#waits for gunicorn service to add backend database then inserts
./wait-for-it.sh -h ${BACKEND_HOST} -p ${BACKEND_PORT} -t 60 -- mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE} -e "INSERT IGNORE INTO item (name, bcit_id) VALUES ('${STUDENT_NAME}', '${STUDENT_NO}');" 

exit 0
