<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('constancias', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participante_id')->constrained('participantes')->onDelete('cascade');
            $table->foreignId('evento_id')->constrained('eventos')->onDelete('cascade');
            $table->enum('tipo', ['participacion', 'primer_lugar', 'segundo_lugar', 'tercer_lugar', 'mencion_honorifica'])->default('participacion');
            $table->string('ruta_pdf')->nullable();
            $table->string('codigo_qr', 100)->unique();
            $table->dateTime('fecha_emision')->nullable();
            $table->timestamps();
            
            $table->unique(['participante_id', 'evento_id', 'tipo']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('constancias');
    }
};
