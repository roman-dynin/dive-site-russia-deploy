#!/bin/bash

cd "../$1"

git pull

cd ../dive-site-russia-deploy

docker-compose up -d --build --no-deps ${1}
