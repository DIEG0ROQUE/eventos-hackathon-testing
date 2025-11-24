<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('event_premios', function (Blueprint $table) {
            $table->id();
            $table->foreignId('evento_id')->constrained('eventos')->onDelete('cascade');
            $table->string('lugar', 50);
            $table->text('descripcion');
            $table->integer('orden')->default(1);
            $table->timestamps();
            
            $table->index(['evento_id', 'orden']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('event_premios');
    }
};
