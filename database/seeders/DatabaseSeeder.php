<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // FORZAR ejecución de seeders
        $this->command->info('🌱 Iniciando seeders...');
        
        $this->call([
            CarreraSeeder::class,
            RolSeeder::class,
            PerfilSeeder::class,
            UserSeeder::class,
            EventoSeeder::class,
            EquipoSeeder::class,
        ]);
        
        // Verificar resultados
        $carreras = \App\Models\Carrera::count();
        $roles = \App\Models\Rol::count();
        $usuarios = \App\Models\User::count();
        
        $this->command->info("✅ Seeders completados:");
        $this->command->info("   - Carreras: {$carreras}");
        $this->command->info("   - Roles: {$roles}");
        $this->command->info("   - Usuarios: {$usuarios}");
    }
}