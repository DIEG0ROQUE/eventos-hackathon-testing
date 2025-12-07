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
    // Verificar si ya hay datos
    $carrerasExisten = \App\Models\Carrera::count() > 0;
    
    if (!$carrerasExisten) {
        // Solo ejecutar si no hay datos
        $this->call([
            CarreraSeeder::class,
            RolSeeder::class,
            PerfilSeeder::class,
            UserSeeder::class,
            EventoSeeder::class,
            EquipoSeeder::class,
        ]);
        
        $this->command->info('Seeders ejecutados: ' . \App\Models\Carrera::count() . ' carreras creadas');
    } else {
        $this->command->info('Los datos ya existen, seeders omitidos');
    }
}
}