@echo off
echo ====================================
echo Desplegando a Railway
echo ====================================
echo.

echo Commiteando cambios locales...
git add .
git commit -m "Preparando deployment con seeders"
echo.

echo Subiendo a GitHub...
git push origin main
echo.

echo ====================================
echo Ahora ejecuta estos comandos en Railway CLI o en el dashboard:
echo.
echo 1. Conectate via Railway CLI: railway shell
echo 2. Ejecuta: php artisan migrate:fresh --force
echo 3. Ejecuta: php artisan db:seed --force
echo.
echo O usa el siguiente comando directo:
echo railway run php artisan migrate:fresh --seed --force
echo ====================================
pause
