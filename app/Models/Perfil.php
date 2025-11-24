<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Perfil extends Model
{
    use HasFactory;

    protected $table = 'perfiles';

    protected $fillable = [
        'nombre',
        'descripcion',
    ];

    /**
     * Participantes en equipos con este perfil
     */
    public function participantesEnEquipos()
    {
        return $this->hasMany(EquipoParticipante::class, 'perfil_id');
    }
}