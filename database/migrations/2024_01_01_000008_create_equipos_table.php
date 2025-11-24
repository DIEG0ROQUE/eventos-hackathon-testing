<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('equipos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('evento_id')->constrained('eventos')->onDelete('cascade');
            $table->string('nombre');
            $table->text('descripcion')->nullable();
            $table->foreignId('lider_id')->constrained('participantes');
            $table->integer('max_miembros')->default(5);
            $table->enum('estado', ['activo', 'inactivo', 'eliminado'])->default('activo');
            $table->timestamps();
            $table->softDeletes();
            
            $table->unique(['evento_id', 'nombre']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('equipos');
    }
};
