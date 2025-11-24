<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CriterioEvaluacion extends Model
{
    use HasFactory;

    protected $table = 'criterio_evaluacion';

    protected $fillable = [
        'evento_id',
        'nombre',
        'descripcion',
        'ponderacion',
        'orden',
    ];

    protected $casts = [
        'ponderacion' => 'decimal:2',
    ];

    public function evento(): BelongsTo
    {
        return $this->belongsTo(Evento::class);
    }

    public function calificaciones(): HasMany
    {
        return $this->hasMany(Calificacion::class, 'criterio_id');
    }
}