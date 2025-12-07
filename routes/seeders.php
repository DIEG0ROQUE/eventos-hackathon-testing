<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

// RUTA TEMPORAL PARA EJECUTAR SEEDERS
// Visita: https://eventos-hackathon.onrender.com/ejecutar-seeders
Route::get('/ejecutar-seeders', function() {
    try {
        // Ejecutar seeders
        Artisan::call('db:seed', ['--force' => true]);
        
        $output = Artisan::output();
        
        // Verificar que hay carreras
        $carreras = \App\Models\Carrera::count();
        $roles = \App\Models\Rol::count();
        
        return response()->json([
            'status' => 'success',
            'message' => 'Seeders ejecutados correctamente',
            'output' => $output,
            'carreras_count' => $carreras,
            'roles_count' => $roles,
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'status' => 'error',
            'message' => $e->getMessage(),
            'trace' => $e->getTraceAsString(),
        ], 500);
    }
});
