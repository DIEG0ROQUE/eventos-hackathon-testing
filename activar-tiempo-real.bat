@echo off
echo ============================================
echo   ACTIVAR SISTEMA EN TIEMPO REAL
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
echo   LISTO! Sistema en tiempo real activado
echo ============================================
echo.
echo ARCHIVOS MODIFICADOS:
echo  + routes/web.php (rutas API agregadas)
echo  + app/Http/Controllers/EquipoController.php (metodo enviarMensajeApi)
echo  + app/Http/Controllers/TareaController.php (3 metodos API)
echo  + resources/views/equipos/show.blade.php (IDs agregados)
echo  + public/js/equipos-tiempo-real.js (JavaScript completo)
echo.
echo COMO PROBAR:
echo.
echo 1. Chat en Tiempo Real:
echo    - Ve a un equipo
echo    - Escribe un mensaje
echo    - Presiona Enter
echo    - Mensaje aparece SIN recargar
echo    - Input se limpia automaticamente
echo.
echo 2. Tareas en Tiempo Real:
echo    - Click en "Crear Tarea"
echo    - Llena formulario
echo    - Click "Crear Tarea"
echo    - Modal se cierra solo
echo    - Tarea aparece en lista SIN recargar
echo.
echo 3. Marcar Tareas:
echo    - Click en checkbox de tarea
echo    - Cambia a verde con check
echo    - SIN recargar pagina
echo    - Con animacion suave
echo.
echo Si no funciona:
echo 1. Recarga la pagina con Ctrl + Shift + R
echo 2. Abre consola del navegador (F12)
echo 3. Busca errores en rojo
echo.
pause
