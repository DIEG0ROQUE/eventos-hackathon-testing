<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Rol extends Model  // ← Cambiar de Role a Rol
{
    use HasFactory;

    protected $table = 'roles'; // ← Agregar esto para asegurar el nombre de la tabla

    protected $fillable = [
        'nombre',      // ← Cambiar de name a nombre
        'descripcion', // ← Cambiar de description a descripcion
    ];

    /**
     * Los usuarios que tienen este rol
     */
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_rol')
                    ->withTimestamps();
    }

    /**
     * Helpers estáticos
     */
    public static function estudiante()
    {
        return static::where('nombre', 'estudiante')->first();
    }

    public static function admin()
    {
        return static::where('nombre', 'admin')->first();
    }

    public static function juez()
    {
        return static::where('nombre', 'juez')->first();
    }
}