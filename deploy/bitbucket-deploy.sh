#!/bin/bash
if [ -z "$1" ]
then
    ENVIRONMENT=test
else
    ENVIRONMENT=$1
fi

if [ "$ENVIRONMENT" == "production" ]
then
    ENVIRONMENT_VARIABLES=('SECRET_KEY_BASE' 'FRONTEND_HOST' 'SENDGRID_API_KEY')
    echo "SECRET_KEY_BASE=$SECRET_KEY_BASE" > .env
    echo "FRONTEND_HOST=$FRONTEND_HOST" >> .env
    echo "SENDGRID_API_KEY=$SENDGRID_API_KEY" >> .env
    echo "RACK_ENV=production" >> .env
    echo "BACKEND_PORT_MAIN=$BACKEND_PORT_MAIN" >> .env
    echo "BACKEND_PORT_1234=$BACKEND_PORT_1234" >> .env
    echo "BACKEND_PORT_26162=$BACKEND_PORT_26162" >> .env
    echo "DATABASE_HOST=$PRODUCTION_DATABASE_HOST" >> .env
    echo "DATABASE_USER=$PRODUCTION_DATABASE_USER" >> .env
    echo "DATABASE_NAME=$PRODUCTION_DATABASE_NAME" >> .env
    echo "DATABASE_PASSWORD=$PRODUCTION_DATABASE_PASSWORD" >> .env
    echo "DOCKER_TAG=master" >> .env
    USER=$PRODUCTION_USER
    SERVER=$PRODUCTION_SERVER
    BASE_PATH=$PRODUCTION_BASE_PATH
else
    echo "SECRET_KEY_BASE=$TEST_SECRET_KEY_BASE" > .env
    echo "FRONTEND_HOST=$TEST_FRONTEND_HOST" >> .env
    echo "SENDGRID_API_KEY=$TEST_SENDGRID_API_KEY" >> .env
    echo "RACK_ENV=production" >> .env
    echo "BACKEND_PORT_MAIN=$TEST_BACKEND_PORT_MAIN" >> .env
    echo "BACKEND_PORT_1234=$TEST_BACKEND_PORT_1234" >> .env
    echo "BACKEND_PORT_26162=$TEST_BACKEND_PORT_26162" >> .env
    echo "DATABASE_HOST=$TEST_DATABASE_HOST" >> .env
    echo "DATABASE_USER=$TEST_DATABASE_USER" >> .env
    echo "DATABASE_NAME=$TEST_DATABASE_NAME" >> .env
    echo "DATABASE_PASSWORD=$TEST_DATABASE_PASSWORD" >> .env
    echo "DOCKER_TAG=develop" >> .env
    USER=$TEST_USER
    SERVER=$TEST_SERVER
    BASE_PATH=$TEST_BASE_PATH
fi

AWS_ACCOUNT="986756292145"

ssh $USER@$SERVER "mkdir -p $BASE_PATH/data"
scp .env deploy/docker-compose.yml $USER@$SERVER:$BASE_PATH/
ssh $USER@$SERVER "cd $BASE_PATH && \
$(aws ecr get-login --no-include-email --registry-ids $AWS_ACCOUNT) && \
sudo sysctl -w vm.max_map_count=262144 && \
docker-compose pull && \
docker-compose up -d && \
docker-compose restart web && \
history -c"
