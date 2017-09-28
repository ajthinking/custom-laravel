#!/bin/bash

laravel new $1
cd $1

composer require guzzlehttp/guzzle
composer require --dev ajthinking/modeltables
composer require laravelcollective/html

touch storage/database.sqlite

sed -i '8s/.*/DB_CONNECTION=sqlite/' .env
sed -i "9s/.*/DB_DATABASE=\/home\/anders\/Code\/$1\/storage\/database.sqlite/" .env
sed -i '10s/.*//' .env
sed -i '11s/.*//' .env
sed -i '12s/.*//' .env
sed -i '13s/.*//' .env

php artisan make:auth
php artisan migrate:fresh
