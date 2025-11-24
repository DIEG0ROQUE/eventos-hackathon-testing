<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Carrera;

class CarreraSeeder extends Seeder
{
    public function run(): void
    {
        $carreras = [
            ['nombre' => 'Ingeniería en Sistemas Computacionales', 'clave' => 'ISC'],
            ['nombre' => 'Ingeniería en Gestión Empresarial', 'clave' => 'IGE'],
            ['nombre' => 'Ingeniería Industrial', 'clave' => 'IND'],
            ['nombre' => 'Ingeniería Civil', 'clave' => 'CIV'],
            ['nombre' => 'Ingeniería Química', 'clave' => 'IQU'],
            ['nombre' => 'Ingeniería Electrónica', 'clave' => 'IEL'],
            ['nombre' => 'Arquitectura', 'clave' => 'ARQ'],
            ['nombre' => 'Contador Público', 'clave' => 'CPU'],
        ];

        foreach ($carreras as $carrera) {
            Carrera::create($carrera);
        }
    }
}
