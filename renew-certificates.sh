#!/bin/bash

certbot renew --webroot --webroot-path /etc/letsencrypt/www

docker-compose stop nginx

docker-compose start nginx
