@echo off
echo ========================================
echo  Preparando deploy para Render
echo ========================================
echo.

echo [1/3] Agregando archivos...
git add .

echo [2/3] Creando commit...
git commit -m "Add Render deployment configuration"

echo [3/3] Subiendo a GitHub...
git push

echo.
echo ========================================
echo  ¡Listo! Archivos subidos a GitHub
echo ========================================
echo.
echo Proximos pasos:
echo 1. Ve a https://render.com
echo 2. Inicia sesion con GitHub
echo 3. Sigue la guia en GUIA_RENDER.md
echo.
pause
