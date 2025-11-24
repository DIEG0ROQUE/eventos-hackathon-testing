<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('eventos', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->text('descripcion');
            $table->enum('tipo', ['hackathon', 'datathon', 'concurso', 'workshop'])->default('hackathon');
            
            // Fechas del evento
            $table->dateTime('fecha_inicio');
            $table->dateTime('fecha_fin');
            $table->dateTime('fecha_limite_registro');
            $table->dateTime('fecha_evaluacion')->nullable();
            $table->dateTime('fecha_premiacion')->nullable();
            
            // Configuración del evento
            $table->string('ubicacion')->nullable();
            $table->boolean('es_virtual')->default(false);
            $table->integer('duracion_horas')->default(48);
            $table->integer('max_participantes')->nullable();
            $table->integer('min_miembros_equipo')->default(3);
            $table->integer('max_miembros_equipo')->default(5);
            
            // Estado y control
            $table->enum('estado', ['draft', 'abierto', 'en_progreso', 'cerrado', 'completado'])->default('draft');
            $table->string('imagen_portada')->nullable();
            $table->foreignId('created_by')->nullable()->constrained('users');
            
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('eventos');
    }
};
