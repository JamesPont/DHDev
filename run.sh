#!/usr/bin/env bash

cd /var/www
composer global require hirak/prestissimo
composer install

npm install

chmod 777 -R /var/www/storage
chmod 777 -R /var/www/bootstrap/cache

php artisan key:generate
php artisan migrate:fresh --seed
php artisan view:cache
php artisan route:cache

php-fpm
