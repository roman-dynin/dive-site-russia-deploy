#!/bin/bash

cd "../$1"

git pull

cd ../dive-site-russia-deploy

docker-compose up -d --build --no-deps ${1}

if [ "$1" = "dive-site-russia-api" ]; then
    docker-compose exec -T dive-site-russia-api php artisan migrate
fi
