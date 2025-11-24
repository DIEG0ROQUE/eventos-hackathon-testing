<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('criterio_evaluacion', function (Blueprint $table) {
            $table->id();
            $table->foreignId('evento_id')->constrained('eventos')->onDelete('cascade');
            $table->string('nombre', 100);
            $table->text('descripcion')->nullable();
            $table->decimal('ponderacion', 5, 2); // 0-100
            $table->integer('orden')->default(1);
            $table->timestamps();
            
            $table->index(['evento_id', 'orden']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('criterio_evaluacion');
    }
};
