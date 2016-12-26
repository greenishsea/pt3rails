#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

export WEB_APP_ROOT_DIR=${SCRIPT_DIR}/../..
export WEB_DOCKERFILE_DIR=${SCRIPT_DIR}/../..

# TODO: db setting has yet to check to actually work. need more some work. 

# # dbA. mysql
# export MYSQL_DOCKERFILE_DIR=${SCRIPT_DIR}/../mysql
# export MYSQL_DATABASE=mydb
# export MYSQL_USER=dbuser
# export MYSQL_PASSWORD=dbuser_pass
# export MYSQL_ROOT_PASSWORD=root
# YML_FILE=$SCRIPT_DIR/docker-compose-mysql.yml

# dbB. postgresql
export POSTGRES_DOCKERFILE_DIR=${SCRIPT_DIR}/../postgres
export POSTGRES_DATABASE=mydb
export POSTGRES_USER=dbuser
export POSTGRES_PASSWORD=dbuser_pass
# export POSTGRES_DATA_DIR=/data
YML_FILE=$SCRIPT_DIR/docker-compose-postgresql.yml


export START_RAILS_COMMAND="bundle install --path=vendor/bundle && rm tmp/pids/server.pid;"

if [ "$DEBUG_MODE" = "1" ] ; then
  # debug mode
  START_RAILS_COMMAND="${START_RAILS_COMMAND} bundle exec rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- bin/rails s -b 0.0.0.0"
else
  # normal mode
  START_RAILS_COMMAND="${START_RAILS_COMMAND} bin/rails s -b 0.0.0.0"
fi

docker-compose -f $YML_FILE $* 
