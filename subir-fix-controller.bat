@echo off
echo ========================================
echo SUBIENDO CONTROLLER.PHP A GITHUB
echo ========================================
echo.

cd /d "C:\Users\LENOVO\Documents\7MO SEMESTRE\WEB\hackathon-events"

echo [1/4] Agregando archivos...
git add app/Http/Controllers/Controller.php
git add FIX_CONTROLLER_RAILWAY.md

echo.
echo [2/4] Haciendo commit...
git commit -m "fix: agregar Controller.php base faltante para Railway"

echo.
echo [3/4] Subiendo a GitHub...
git push origin main

echo.
echo [4/4] COMPLETADO!
echo.
echo ========================================
echo AHORA:
echo 1. Ve a Railway
echo 2. Railway detectara el cambio automaticamente
echo 3. Espera 3-5 minutos mientras redeploya
echo 4. Verifica los logs
echo ========================================
echo.
pause
