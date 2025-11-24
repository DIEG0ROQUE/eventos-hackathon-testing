<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('equipo_participante', function (Blueprint $table) {
            $table->foreignId('equipo_id')->constrained('equipos')->onDelete('cascade');
            $table->foreignId('participante_id')->constrained('participantes')->onDelete('cascade');
            $table->foreignId('perfil_id')->constrained('perfiles');
            $table->enum('estado', ['activo', 'pendiente', 'rechazado'])->default('activo');
            $table->timestamps();
            
            $table->primary(['equipo_id', 'participante_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('equipo_participante');
    }
};
