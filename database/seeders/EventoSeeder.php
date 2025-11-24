<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Evento;
use App\Models\EventPremio;
use App\Models\CriterioEvaluacion;
use App\Models\User;
use Carbon\Carbon;

class EventoSeeder extends Seeder
{
    public function run(): void
    {
        $admin = User::where('email', 'admin@hackathon.com')->first();

        // EVENTO 1: Hackathon Primavera 2025 (ABIERTO)
        $evento1 = Evento::create([
            'nombre' => 'Hackathon Primavera 2025',
            'descripcion' => 'Competencia de desarrollo de software enfocada en soluciones innovadoras para problemas sociales. Los equipos tendrán 48 horas para desarrollar un prototipo funcional.',
            'tipo' => 'hackathon',
            'fecha_inicio' => Carbon::now()->addDays(15)->setTime(8, 0),
            'fecha_fin' => Carbon::now()->addDays(17)->setTime(18, 0),
            'fecha_limite_registro' => Carbon::now()->addDays(10)->setTime(23, 59),
            'fecha_evaluacion' => Carbon::now()->addDays(18)->setTime(10, 0),
            'fecha_premiacion' => Carbon::now()->addDays(20)->setTime(16, 0),
            'ubicacion' => 'Instituto Tecnológico de Oaxaca - Centro de Cómputo',
            'es_virtual' => false,
            'duracion_horas' => 48,
            'max_participantes' => 100,
            'min_miembros_equipo' => 3,
            'max_miembros_equipo' => 5,
            'estado' => 'abierto',
            'created_by' => $admin->id,
        ]);

        // Premios Evento 1
        EventPremio::create([
            'evento_id' => $evento1->id,
            'lugar' => '1er lugar',
            'descripcion' => '$15,000 MXN + Trofeo + Certificado',
            'orden' => 1,
        ]);
        EventPremio::create([
            'evento_id' => $evento1->id,
            'lugar' => '2do lugar',
            'descripcion' => '$10,000 MXN + Medalla + Certificado',
            'orden' => 2,
        ]);
        EventPremio::create([
            'evento_id' => $evento1->id,
            'lugar' => '3er lugar',
            'descripcion' => '$5,000 MXN + Medalla + Certificado',
            'orden' => 3,
        ]);

        // Criterios de Evaluación Evento 1
        CriterioEvaluacion::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Innovación',
            'descripcion' => 'Originalidad y creatividad de la solución',
            'ponderacion' => 25.00,
            'orden' => 1,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Funcionalidad',
            'descripcion' => 'Completitud y funcionalidad del prototipo',
            'ponderacion' => 30.00,
            'orden' => 2,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Impacto Social',
            'descripcion' => 'Potencial de impacto en la comunidad',
            'ponderacion' => 20.00,
            'orden' => 3,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Diseño UX/UI',
            'descripcion' => 'Calidad de la experiencia de usuario',
            'ponderacion' => 15.00,
            'orden' => 4,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento1->id,
            'nombre' => 'Presentación',
            'descripcion' => 'Calidad del pitch y demostración',
            'ponderacion' => 10.00,
            'orden' => 5,
        ]);

        // EVENTO 2: Datathon Análisis de Datos 2025 (DRAFT)
        $evento2 = Evento::create([
            'nombre' => 'Datathon Análisis de Datos 2025',
            'descripcion' => 'Competencia de análisis de datos donde los equipos trabajarán con grandes conjuntos de datos para extraer insights valiosos.',
            'tipo' => 'datathon',
            'fecha_inicio' => Carbon::now()->addDays(30)->setTime(9, 0),
            'fecha_fin' => Carbon::now()->addDays(31)->setTime(20, 0),
            'fecha_limite_registro' => Carbon::now()->addDays(25)->setTime(23, 59),
            'fecha_evaluacion' => Carbon::now()->addDays(32)->setTime(14, 0),
            'fecha_premiacion' => Carbon::now()->addDays(35)->setTime(18, 0),
            'ubicacion' => 'Plataforma Virtual - Zoom',
            'es_virtual' => true,
            'duracion_horas' => 24,
            'max_participantes' => 60,
            'min_miembros_equipo' => 2,
            'max_miembros_equipo' => 4,
            'estado' => 'draft',
            'created_by' => $admin->id,
        ]);

        // Premios Evento 2
        EventPremio::create([
            'evento_id' => $evento2->id,
            'lugar' => '1er lugar',
            'descripcion' => '$12,000 MXN + Curso de Data Science',
            'orden' => 1,
        ]);
        EventPremio::create([
            'evento_id' => $evento2->id,
            'lugar' => '2do lugar',
            'descripcion' => '$8,000 MXN + Certificación',
            'orden' => 2,
        ]);
        EventPremio::create([
            'evento_id' => $evento2->id,
            'lugar' => '3er lugar',
            'descripcion' => '$4,000 MXN + Certificación',
            'orden' => 3,
        ]);

        // Criterios Evento 2
        CriterioEvaluacion::create([
            'evento_id' => $evento2->id,
            'nombre' => 'Calidad del Análisis',
            'descripcion' => 'Profundidad y rigor del análisis de datos',
            'ponderacion' => 35.00,
            'orden' => 1,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento2->id,
            'nombre' => 'Visualización',
            'descripcion' => 'Claridad y efectividad de las visualizaciones',
            'ponderacion' => 25.00,
            'orden' => 2,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento2->id,
            'nombre' => 'Insights Obtenidos',
            'descripcion' => 'Valor de los insights descubiertos',
            'ponderacion' => 30.00,
            'orden' => 3,
        ]);
        CriterioEvaluacion::create([
            'evento_id' => $evento2->id,
            'nombre' => 'Presentación',
            'descripcion' => 'Comunicación efectiva de resultados',
            'ponderacion' => 10.00,
            'orden' => 4,
        ]);

        // EVENTO 3: Workshop de IA (COMPLETADO - pasado)
        $evento3 = Evento::create([
            'nombre' => 'Workshop Introducción a IA',
            'descripcion' => 'Taller práctico sobre fundamentos de Inteligencia Artificial y Machine Learning.',
            'tipo' => 'workshop',
            'fecha_inicio' => Carbon::now()->subDays(10)->setTime(9, 0),
            'fecha_fin' => Carbon::now()->subDays(10)->setTime(17, 0),
            'fecha_limite_registro' => Carbon::now()->subDays(15)->setTime(23, 59),
            'ubicacion' => 'Instituto Tecnológico de Oaxaca - Auditorio',
            'es_virtual' => false,
            'duracion_horas' => 8,
            'max_participantes' => 50,
            'min_miembros_equipo' => 1,
            'max_miembros_equipo' => 2,
            'estado' => 'completado',
            'created_by' => $admin->id,
        ]);
    }
}
