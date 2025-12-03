@echo off
echo ============================================
echo   SOLICITUDES EN TIEMPO REAL - ACTIVAR
echo ============================================
echo.

cd /d "%~dp0"

echo [1/4] Limpiando cache de rutas...
php artisan route:clear
echo.

echo [2/4] Limpiando cache de vistas...
php artisan view:clear
echo.

echo [3/4] Limpiando cache de configuracion...
php artisan config:clear
echo.

echo [4/4] Recargando autoloader...
composer dump-autoload
echo.

echo ============================================
echo   LISTO! Solicitudes en tiempo real activas
echo ============================================
echo.
echo ARCHIVOS MODIFICADOS:
echo  + routes/web.php (ruta API agregada)
echo  + app/Http/Controllers/EquipoController.php (metodo solicitarApi)
echo  + resources/views/equipos/show.blade.php (IDs agregados)
echo  + public/js/equipos-tiempo-real.js (funcionalidad agregada)
echo.
echo COMO FUNCIONA:
echo.
echo 1. Usuario ve equipo
echo 2. Click "Solicitar Unirse"
echo 3. Selecciona rol
echo 4. Click "Enviar Solicitud"
echo 5. Modal se cierra automaticamente
echo 6. Solicitud aparece instantaneamente
echo    (El lider la ve sin recargar)
echo.
echo COMPORTAMIENTO:
echo  √ Solicitud enviada sin recargar
echo  √ Modal se cierra solo
echo  √ Aparece en lista del lider instantaneamente
echo  √ Notificacion de exito verde
echo  √ Animacion de entrada suave
echo.
echo ============================================
echo   COMO PROBAR
echo ============================================
echo.
echo PREPARACION:
echo 1. Abre 2 navegadores diferentes (o ventanas incognito)
echo 2. Navegador 1: Inicia sesion como LIDER de equipo
echo 3. Navegador 2: Inicia sesion como OTRO USUARIO
echo.
echo PRUEBA:
echo 1. Navegador 1 (Lider): Ve a tu equipo
echo 2. Navegador 2 (Usuario): Ve al mismo equipo
echo 3. Navegador 2: Click "Solicitar Unirse"
echo 4. Navegador 2: Selecciona rol y envia
echo 5. Navegador 2: Modal se cierra, notificacion verde
echo 6. Navegador 1: Recarga pagina (Ctrl+F5)
echo 7. Navegador 1: Debe ver la solicitud en "Invitaciones Pendientes"
echo.
echo NOTA: Para ver la solicitud aparecer SIN recargar,
echo      necesitarias WebSockets (mas avanzado).
echo      Por ahora, el que envia la solicitud la ve aparecer
echo      instantaneamente en su vista.
echo.
pause
