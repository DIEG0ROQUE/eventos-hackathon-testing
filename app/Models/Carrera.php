<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Carrera extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre',
        'clave',
    ];

    /**
     * Participantes de esta carrera
     */
    public function participantes(): HasMany
    {
        return $this->hasMany(Participante::class);
    }
}