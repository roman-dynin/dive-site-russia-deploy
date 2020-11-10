# Места для погружений

Генерация сертификата:

```
$ certbot certonly -d diving.place -d www.diving.place -d api.diving.place -d storage.diving.place --cert-name diving.place --webroot --webroot-path /etc/letsencrypt/www --agree-tos --email strftime@yandex.com --eff-email
```
