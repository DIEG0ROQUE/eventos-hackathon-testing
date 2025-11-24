<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Rol;

class RolSeeder extends Seeder
{
    public function run(): void
    {
        $roles = [
            [
                'nombre' => 'admin',
                'descripcion' => 'Administrador del sistema con acceso completo'
            ],
            [
                'nombre' => 'juez',
                'descripcion' => 'Juez que evalúa proyectos'
            ],
            [
                'nombre' => 'participante',
                'descripcion' => 'Estudiante participante en eventos'
            ],
        ];

        foreach ($roles as $rol) {
            Rol::create($rol);
        }
    }
}
