<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Perfil;

class PerfilSeeder extends Seeder
{
    public function run(): void
    {
        $perfiles = [
            [
                'nombre' => 'Programador',
                'descripcion' => 'Desarrolla y programa la solución técnica'
            ],
            [
                'nombre' => 'Diseñador',
                'descripcion' => 'Diseña la interfaz y experiencia de usuario'
            ],
            [
                'nombre' => 'Analista de Negocios',
                'descripcion' => 'Analiza el problema y define requerimientos'
            ],
            [
                'nombre' => 'Analista de Datos',
                'descripcion' => 'Analiza y procesa datos para insights'
            ],
            [
                'nombre' => 'Scrum Master',
                'descripcion' => 'Coordina al equipo y gestiona el proyecto'
            ],
        ];

        foreach ($perfiles as $perfil) {
            Perfil::create($perfil);
        }
    }
}
