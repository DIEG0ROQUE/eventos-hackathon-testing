#!/bin/bash
# Script de inicio optimizado para Railway

echo "🚀 Iniciando aplicación..."

# Solo ejecutar migraciones pendientes (sin borrar)
echo "📊 Verificando migraciones..."
php artisan migrate --force

# Optimizar (solo si no está en cache)
if [ ! -f "bootstrap/cache/config.php" ]; then
    echo "⚡ Optimizando aplicación..."
    php artisan config:cache
    php artisan route:cache
    php artisan view:cache
fi

echo "✅ Aplicación lista!"
