<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Equipo;
use App\Models\Participante;
use App\Models\Evento;
use App\Models\Proyecto;
use App\Models\Perfil;

class EquipoSeeder extends Seeder
{
    public function run(): void
    {
        $evento1 = Evento::where('nombre', 'Hackathon Primavera 2025')->first();
        
        $perfilProgramador = Perfil::where('nombre', 'Programador')->first();
        $perfilDisenador = Perfil::where('nombre', 'Diseñador')->first();
        $perfilAnalista = Perfil::where('nombre', 'Analista de Negocios')->first();
        $perfilDatos = Perfil::where('nombre', 'Analista de Datos')->first();

        // EQUIPO 1: Los Innovadores
        $participante1 = Participante::whereHas('user', fn($q) => $q->where('email', 'juan.perez@alumno.com'))->first();
        $participante2 = Participante::whereHas('user', fn($q) => $q->where('email', 'maria.lopez@alumno.com'))->first();
        $participante3 = Participante::whereHas('user', fn($q) => $q->where('email', 'pedro.ramirez@alumno.com'))->first();

        $equipo1 = Equipo::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Los Innovadores',
            'descripcion' => 'Equipo enfocado en soluciones educativas con IA',
            'lider_id' => $participante1->id,
            'max_miembros' => 5,
            'estado' => 'activo',
        ]);

        // Agregar miembros al equipo 1
        $equipo1->participantes()->attach($participante1->id, [
            'perfil_id' => $perfilProgramador->id,
            'estado' => 'activo',
        ]);
        $equipo1->participantes()->attach($participante2->id, [
            'perfil_id' => $perfilDisenador->id,
            'estado' => 'activo',
        ]);
        $equipo1->participantes()->attach($participante3->id, [
            'perfil_id' => $perfilAnalista->id,
            'estado' => 'activo',
        ]);

        // Proyecto del equipo 1
        Proyecto::create([
            'equipo_id' => $equipo1->id,
            'evento_id' => $evento1->id,
            'nombre' => 'EduAI - Tutor Virtual Inteligente',
            'descripcion' => 'Plataforma educativa con asistente virtual basado en IA que se adapta al ritmo de aprendizaje de cada estudiante.',
            'link_repositorio' => 'https://github.com/innovadores/eduai',
            'link_demo' => 'https://eduai-demo.com',
        ]);

        // EQUIPO 2: Code Warriors
        $participante4 = Participante::whereHas('user', fn($q) => $q->where('email', 'ana.martinez@alumno.com'))->first();
        $participante5 = Participante::whereHas('user', fn($q) => $q->where('email', 'luis.hernandez@alumno.com'))->first();
        $participante6 = Participante::whereHas('user', fn($q) => $q->where('email', 'carmen.flores@alumno.com'))->first();
        $participante7 = Participante::whereHas('user', fn($q) => $q->where('email', 'roberto.gomez@alumno.com'))->first();

        $equipo2 = Equipo::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Code Warriors',
            'descripcion' => 'Desarrolladores full-stack apasionados por el cambio social',
            'lider_id' => $participante4->id,
            'max_miembros' => 5,
            'estado' => 'activo',
        ]);

        // Agregar miembros al equipo 2
        $equipo2->participantes()->attach($participante4->id, [
            'perfil_id' => $perfilProgramador->id,
            'estado' => 'activo',
        ]);
        $equipo2->participantes()->attach($participante5->id, [
            'perfil_id' => $perfilProgramador->id,
            'estado' => 'activo',
        ]);
        $equipo2->participantes()->attach($participante6->id, [
            'perfil_id' => $perfilDisenador->id,
            'estado' => 'activo',
        ]);
        $equipo2->participantes()->attach($participante7->id, [
            'perfil_id' => $perfilDatos->id,
            'estado' => 'activo',
        ]);

        // Proyecto del equipo 2
        Proyecto::create([
            'equipo_id' => $equipo2->id,
            'evento_id' => $evento1->id,
            'nombre' => 'GreenRoute - Optimización de Rutas Sustentables',
            'descripcion' => 'App móvil que calcula rutas optimizadas reduciendo emisiones de CO2 y sugiriendo alternativas de transporte público.',
            'link_repositorio' => 'https://github.com/codewarriors/greenroute',
        ]);

        // EQUIPO 3: Tech Titans
        $participante8 = Participante::whereHas('user', fn($q) => $q->where('email', 'sofia.morales@alumno.com'))->first();
        $participante9 = Participante::whereHas('user', fn($q) => $q->where('email', 'diego.castro@alumno.com'))->first();
        $participante10 = Participante::whereHas('user', fn($q) => $q->where('email', 'valeria.vargas@alumno.com'))->first();

        $equipo3 = Equipo::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Tech Titans',
            'descripcion' => 'Equipo multidisciplinario enfocado en fintech',
            'lider_id' => $participante8->id,
            'max_miembros' => 5,
            'estado' => 'activo',
        ]);

        // Agregar miembros al equipo 3
        $equipo3->participantes()->attach($participante8->id, [
            'perfil_id' => $perfilProgramador->id,
            'estado' => 'activo',
        ]);
        $equipo3->participantes()->attach($participante9->id, [
            'perfil_id' => $perfilProgramador->id,
            'estado' => 'activo',
        ]);
        $equipo3->participantes()->attach($participante10->id, [
            'perfil_id' => $perfilAnalista->id,
            'estado' => 'activo',
        ]);

        // Proyecto del equipo 3
        Proyecto::create([
            'equipo_id' => $equipo3->id,
            'evento_id' => $evento1->id,
            'nombre' => 'MicroSave - Ahorro Inteligente',
            'descripcion' => 'Aplicación de educación financiera que ayuda a usuarios de bajos recursos a crear hábitos de ahorro mediante gamificación.',
            'link_repositorio' => 'https://github.com/techtitans/microsave',
            'link_demo' => 'https://microsave-app.com',
        ]);
    }
}
