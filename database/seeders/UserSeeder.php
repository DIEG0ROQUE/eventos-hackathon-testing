<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Participante;
use App\Models\Rol;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        // 1. ADMINISTRADOR
        $admin = User::create([
            'name' => 'Admin Sistema',
            'email' => 'admin@hackathon.com',
            'password' => Hash::make('password'),
            'email_verified_at' => now(),
        ]);
        $admin->roles()->attach(Rol::where('nombre', 'admin')->first()->id);

        // 2. JUECES
        $jueces = [
            ['name' => 'Dr. Roberto Méndez', 'email' => 'juez1@hackathon.com'],
            ['name' => 'Ing. Laura Torres', 'email' => 'juez2@hackathon.com'],
            ['name' => 'Mtro. Carlos Ruiz', 'email' => 'juez3@hackathon.com'],
        ];

        $rolJuez = Rol::where('nombre', 'juez')->first();
        foreach ($jueces as $juezData) {
            $juez = User::create([
                'name' => $juezData['name'],
                'email' => $juezData['email'],
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]);
            $juez->roles()->attach($rolJuez->id);
        }

        // 3. PARTICIPANTES
        $participantes = [
            // Equipo 1 - Los Innovadores
            [
                'name' => 'Juan Pérez García',
                'email' => 'juan.perez@alumno.com',
                'no_control' => '21310001',
                'carrera_id' => 1, // Sistemas
                'semestre' => 7,
                'telefono' => '9511234567',
            ],
            [
                'name' => 'María López Sánchez',
                'email' => 'maria.lopez@alumno.com',
                'no_control' => '21310002',
                'carrera_id' => 1,
                'semestre' => 7,
                'telefono' => '9511234568',
            ],
            [
                'name' => 'Pedro Ramírez Ortiz',
                'email' => 'pedro.ramirez@alumno.com',
                'no_control' => '21310003',
                'carrera_id' => 2, // Gestión
                'semestre' => 6,
                'telefono' => '9511234569',
            ],
            
            // Equipo 2 - Code Warriors
            [
                'name' => 'Ana Martínez Cruz',
                'email' => 'ana.martinez@alumno.com',
                'no_control' => '21310004',
                'carrera_id' => 1,
                'semestre' => 8,
                'telefono' => '9511234570',
            ],
            [
                'name' => 'Luis Hernández Díaz',
                'email' => 'luis.hernandez@alumno.com',
                'no_control' => '21310005',
                'carrera_id' => 1,
                'semestre' => 7,
                'telefono' => '9511234571',
            ],
            [
                'name' => 'Carmen Flores Reyes',
                'email' => 'carmen.flores@alumno.com',
                'no_control' => '21310006',
                'carrera_id' => 7, // Arquitectura
                'semestre' => 5,
                'telefono' => '9511234572',
            ],
            [
                'name' => 'Roberto Gómez Silva',
                'email' => 'roberto.gomez@alumno.com',
                'no_control' => '21310007',
                'carrera_id' => 4, // Analista de Datos
                'semestre' => 6,
                'telefono' => '9511234573',
            ],
            
            // Equipo 3 - Tech Titans
            [
                'name' => 'Sofía Morales Ruiz',
                'email' => 'sofia.morales@alumno.com',
                'no_control' => '21310008',
                'carrera_id' => 1,
                'semestre' => 8,
                'telefono' => '9511234574',
            ],
            [
                'name' => 'Diego Castro López',
                'email' => 'diego.castro@alumno.com',
                'no_control' => '21310009',
                'carrera_id' => 1,
                'semestre' => 7,
                'telefono' => '9511234575',
            ],
            [
                'name' => 'Valeria Vargas Mendoza',
                'email' => 'valeria.vargas@alumno.com',
                'no_control' => '21310010',
                'carrera_id' => 2,
                'semestre' => 6,
                'telefono' => '9511234576',
            ],
            
            // Participantes sin equipo aún
            [
                'name' => 'Miguel Ángel Rojas',
                'email' => 'miguel.rojas@alumno.com',
                'no_control' => '21310011',
                'carrera_id' => 1,
                'semestre' => 5,
                'telefono' => '9511234577',
            ],
            [
                'name' => 'Andrea Jiménez Torres',
                'email' => 'andrea.jimenez@alumno.com',
                'no_control' => '21310012',
                'carrera_id' => 6, // Electrónica
                'semestre' => 6,
                'telefono' => '9511234578',
            ],
        ];

        $rolParticipante = Rol::where('nombre', 'participante')->first();
        
        foreach ($participantes as $index => $participanteData) {
            // Crear usuario
            $user = User::create([
                'name' => $participanteData['name'],
                'email' => $participanteData['email'],
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]);
            
            // Asignar rol participante
            $user->roles()->attach($rolParticipante->id);
            
            // Crear perfil de participante
            Participante::create([
                'user_id' => $user->id,
                'carrera_id' => $participanteData['carrera_id'],
                'no_control' => $participanteData['no_control'],
                'semestre' => $participanteData['semestre'],
                'telefono' => $participanteData['telefono'],
                'biografia' => 'Estudiante apasionado por la tecnología y la innovación.',
            ]);
        }
    }
}
