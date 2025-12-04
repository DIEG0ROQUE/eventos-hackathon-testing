#!/bin/bash
# Script para Railway - Ejecutar migraciones y seeders

echo "🚀 Iniciando deployment en Railway..."
echo ""

# 1. Limpiar cache
echo "🧹 Limpiando cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# 2. Verificar conexión a base de datos
echo "🔍 Verificando conexión a base de datos..."
php artisan db:show

# 3. Ejecutar migraciones frescas
echo "📊 Ejecutando migraciones frescas..."
php artisan migrate:fresh --force

# 4. Ejecutar seeders
echo "🌱 Ejecutando seeders..."
php artisan db:seed --force

# 5. Optimizar aplicación
echo "⚡ Optimizando aplicación..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo ""
echo "✅ Deployment completado exitosamente!"
echo "🎉 La base de datos ha sido creada y poblada con datos iniciales"
