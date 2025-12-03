@echo off
echo ============================================
echo   SOLICITUDES EN TIEMPO REAL CON POLLING
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
echo   LISTO! Sistema de Polling Activado
echo ============================================
echo.
echo ARCHIVOS MODIFICADOS:
echo  + routes/web.php (ruta API para obtener solicitudes)
echo  + app/Http/Controllers/EquipoController.php (metodo obtenerSolicitudesPendientesApi)
echo  + resources/views/equipos/show.blade.php (data-solicitud-id agregado)
echo  + public/js/equipos-tiempo-real.js (polling cada 10 segundos)
echo.
echo ============================================
echo   COMO FUNCIONA EL POLLING
echo ============================================
echo.
echo 1. El LIDER abre la pagina de su equipo
echo 2. JavaScript detecta que hay un contenedor de solicitudes
echo 3. Inicia un intervalo que revisa cada 10 segundos
echo 4. Cada 10 segundos hace fetch a /solicitudes/pendientes/api
echo 5. Compara las solicitudes nuevas con las ya mostradas
echo 6. Si hay nuevas, las agrega automaticamente a la lista
echo 7. Muestra notificacion verde al lider
echo 8. Reproduce sonido de notificacion (beep)
echo.
echo ============================================
echo   COMO PROBAR - IMPORTANTE
echo ============================================
echo.
echo NECESITAS 2 NAVEGADORES DIFERENTES:
echo.
echo NAVEGADOR 1 (Lider):
echo 1. Abre Chrome (o tu navegador principal)
echo 2. Inicia sesion como lider de un equipo
echo 3. Ve a la pagina de tu equipo
echo 4. DEJA LA PAGINA ABIERTA
echo 5. Abre la consola (F12) y veras:
echo    "✅ Polling de solicitudes activado (cada 10 segundos)"
echo.
echo NAVEGADOR 2 (Usuario):
echo 1. Abre Firefox (o modo incognito)
echo 2. Inicia sesion como otro usuario
echo 3. Ve al equipo del lider
echo 4. Click "Solicitar Unirse"
echo 5. Selecciona rol y envia
echo.
echo RESULTADO:
echo En NAVEGADOR 1 (Lider):
echo - Espera maximo 10 segundos
echo - Veras aparecer la solicitud automaticamente
echo - Notificacion verde: "Nueva solicitud de [nombre]"
echo - Sonido de beep
echo - SIN RECARGAR LA PAGINA
echo.
echo ============================================
echo   CONFIGURACION
echo ============================================
echo.
echo Intervalo de polling: 10 segundos
echo (Puedes cambiarlo en equipos-tiempo-real.js linea ~535)
echo.
echo Para cambiar intervalo:
echo 1. Abre public/js/equipos-tiempo-real.js
echo 2. Busca: setInterval(() =^> { ... }, 10000);
echo 3. Cambia 10000 a:
echo    - 5000 = 5 segundos (mas rapido)
echo    - 30000 = 30 segundos (mas lento)
echo.
pause
