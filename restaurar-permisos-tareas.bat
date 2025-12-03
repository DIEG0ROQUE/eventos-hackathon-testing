@echo off
echo ============================================
echo   RESTAURAR PERMISOS DE TAREAS
echo ============================================
echo.

cd /d "%~dp0"

echo [1/3] Limpiando cache de vistas...
php artisan view:clear
echo.

echo [2/3] Limpiando cache de configuracion...
php artisan config:clear
echo.

echo [3/3] Limpiando cache de rutas...
php artisan route:clear
echo.

echo ============================================
echo   PERMISOS RESTAURADOS
echo ============================================
echo.
echo ARCHIVOS MODIFICADOS:
echo  + app/Http/Controllers/TareaController.php
echo    - toggleApi() con validaciones completas
echo  + resources/views/equipos/show.blade.php
echo    - Variable $puedeMarcar agregada
echo.
echo ============================================
echo   REGLAS DE PERMISOS
echo ============================================
echo.
echo LIDER DEL EQUIPO:
echo  √ Puede marcar/desmarcar CUALQUIER tarea
echo  √ Tiene control total sobre todas las tareas
echo.
echo MIEMBRO ASIGNADO:
echo  √ Puede marcar/desmarcar SOLO las tareas asignadas a el
echo  X No puede tocar tareas de otros miembros
echo.
echo MIEMBRO NO ASIGNADO:
echo  X No puede marcar ninguna tarea
echo  √ Solo puede verlas (checkbox deshabilitado)
echo.
echo ============================================
echo   VALIDACIONES IMPLEMENTADAS
echo ============================================
echo.
echo BACKEND (TareaController::toggleApi):
echo  1. Usuario es miembro activo del equipo
echo  2. Equipo no fue evaluado
echo  3. Tarea pertenece al proyecto del equipo
echo  4. Usuario es lider O esta asignado a la tarea
echo.
echo FRONTEND (show.blade.php):
echo  1. Calcula variable $puedeMarcar
echo  2. Muestra boton clickeable solo si $puedeMarcar = true
echo  3. Muestra checkbox deshabilitado si no puede marcar
echo.
echo JAVASCRIPT:
echo  1. Maneja errores 403 del backend
echo  2. Muestra notificacion roja si no tiene permiso
echo.
echo ============================================
echo   COMO PROBAR
echo ============================================
echo.
echo PRUEBA 1 - Como Lider:
echo 1. Inicia sesion como lider
echo 2. Ve a tu equipo
echo 3. Intenta marcar cualquier tarea
echo 4. Resultado: Funciona ✓
echo.
echo PRUEBA 2 - Como Miembro Asignado:
echo 1. Inicia sesion como miembro
echo 2. Ve a tu equipo
echo 3. Intenta marcar tarea ASIGNADA a ti
echo 4. Resultado: Funciona ✓
echo 5. Intenta marcar tarea NO ASIGNADA a ti
echo 6. Resultado: Notificacion roja "No estas asignado..."
echo.
echo PRUEBA 3 - Como Miembro Sin Tareas:
echo 1. Inicia sesion como miembro sin tareas
echo 2. Ve a tu equipo
echo 3. Los checkboxes se ven pero no son clickeables
echo 4. Resultado: No puede marcar nada
echo.
pause
