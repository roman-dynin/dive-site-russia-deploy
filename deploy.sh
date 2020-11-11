#!/bin/bash

export $(cat .env | xargs)

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "$1: Получена новая версия!"

cd "../$1"

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "$1: git pull ..."

git pull

cd ../dive-site-russia-deploy

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "$1: Сборка Docker образа ..."

docker-compose up -d --build --no-deps ${1}

if [ "$1" = "dive-site-russia-api" ]; then
    telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "$1: Запуск миграций ..."

    docker-compose exec -T dive-site-russia-api php artisan migrate
fi

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "$1: Готово!"

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "$1: docker system prune -f ..."

docker system prune -f
