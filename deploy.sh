#!/bin/bash

cd ../dive-site-russia-api

git pull

cd ../dive-site-russia-deploy

docker-compose up -d --build --no-deps api

echo "Deploy" >> deploy.log
