<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('calificaciones', function (Blueprint $table) {
            $table->id();
            $table->foreignId('proyecto_id')->constrained('proyectos')->onDelete('cascade');
            $table->foreignId('juez_user_id')->constrained('users'); // El juez que evalúa
            $table->foreignId('criterio_id')->constrained('criterio_evaluacion')->onDelete('cascade');
            $table->decimal('puntuacion', 5, 2); // 0-100
            $table->text('comentario')->nullable();
            $table->timestamps();
            
            // Un juez solo puede calificar un criterio de un proyecto una vez
            $table->unique(['proyecto_id', 'juez_user_id', 'criterio_id'], 'calificacion_unica');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('calificaciones');
    }
};
