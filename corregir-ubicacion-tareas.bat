@echo off
echo ============================================
echo   CORRECCION: TAREAS EN SECCION CORRECTA
echo ============================================
echo.

cd /d "%~dp0"

echo [1/3] Limpiando cache de vistas...
php artisan view:clear
echo.

echo [2/3] Limpiando cache de configuracion...
php artisan config:clear
echo.

echo [3/3] Limpiando cache de navegador...
echo IMPORTANTE: Despues de este script, recarga tu navegador con:
echo Ctrl + Shift + R (recarga forzada)
echo.

echo ============================================
echo   CAMBIOS APLICADOS
echo ============================================
echo.
echo PROBLEMA CORREGIDO:
echo  X Las tareas se agregaban en "Miembros del Equipo"
echo  √ Ahora se agregan en "Tareas del Proyecto" (lugar correcto)
echo.
echo ARCHIVOS MODIFICADOS:
echo  1. resources/views/equipos/show.blade.php
echo     - Agregado id="listaTareas" al contenedor de tareas
echo     - Agregado id="estadoSinTareas" al mensaje vacio
echo     - Contenedor siempre presente (incluso sin tareas)
echo.
echo  2. public/js/equipos-tiempo-real.js
echo     - Usa document.getElementById('listaTareas')
echo     - HTML de tarea coincide exactamente con la vista
echo     - Estructura identica a tareas existentes
echo.
echo COMPORTAMIENTO NUEVO:
echo  √ Crear tarea → Aparece en "Tareas del Proyecto"
echo  √ Mismo estilo que tareas existentes
echo  √ Sin recargar pagina
echo  √ Modal se cierra automaticamente
echo.
echo ============================================
echo   COMO PROBAR
echo ============================================
echo.
echo 1. Recarga tu navegador: Ctrl + Shift + R
echo 2. Ve a un equipo tuyo
echo 3. Click en "Nueva Tarea"
echo 4. Completa el formulario
echo 5. Click "Crear Tarea"
echo 6. Verifica que aparece en seccion "Tareas del Proyecto"
echo    (NO en "Miembros del Equipo")
echo.
pause
