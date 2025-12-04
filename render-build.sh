#!/usr/bin/env bash
# exit on error
set -o errexit

# Instalar dependencias de Composer
composer install --no-dev --optimize-autoloader

# Instalar dependencias de Node
npm install

# Compilar assets
npm run build

# Limpiar y optimizar cache
php artisan config:clear
php artisan cache:clear
php artisan view:clear

# Optimizar para producción
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Ejecutar migraciones
php artisan migrate --force

# Opcional: Ejecutar seeders (descomenta si los necesitas)
# php artisan db:seed --force
