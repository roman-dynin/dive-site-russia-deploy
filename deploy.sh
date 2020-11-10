#!/bin/bash

export $(cat .env | xargs)

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "Пересборка $1 ⚠️"

cd "../$1"

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "git pull ..."

git pull

cd ../dive-site-russia-deploy

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "Сборка ..."

docker-compose up -d --build --no-deps ${1}

if [ "$1" = "dive-site-russia-api" ]; then
    telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "Миграции ..."

    docker-compose exec -T dive-site-russia-api php artisan migrate
fi

telegram -t ${TELEGRAM_BOT_TOKEN} -c ${TELEGRAM_CHAT_ID} "Готово! 👌"
