@echo off
echo Creando ruta temporal para ejecutar seeders...
echo.

cd C:\Users\diego\Downloads\eventos_hackaton

REM Crear archivo temporal con la ruta
echo. >> routes\web.php
echo // RUTA TEMPORAL - EJECUTAR SEEDERS >> routes\web.php
echo Route::get('/run-seeders-now', function() { >> routes\web.php
echo     try { >> routes\web.php
echo         Artisan::call('db:seed', ['--force' =^> true]); >> routes\web.php
echo         return 'Seeders ejecutados: ' . Artisan::output(); >> routes\web.php
echo     } catch (\Exception $e) { >> routes\web.php
echo         return 'Error: ' . $e-^>getMessage(); >> routes\web.php
echo     } >> routes\web.php
echo }); >> routes\web.php

echo.
echo Archivo web.php actualizado.
echo.
echo Ahora sube los cambios:
echo git add routes/web.php
echo git commit -m "Agregar ruta temporal para seeders"
echo git push origin main
echo.
echo Despues ve a: https://eventos-hackathon.onrender.com/run-seeders-now
echo.
pause
