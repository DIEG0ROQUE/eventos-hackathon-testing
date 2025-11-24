<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class EventPremio extends Model
{
    use HasFactory;

    protected $fillable = [
        'evento_id',
        'lugar',
        'descripcion',
        'orden',
    ];

    public function evento(): BelongsTo
    {
        return $this->belongsTo(Evento::class);
    }

    public function getIconColorAttribute(): string
    {
        return match($this->orden) {
            1 => 'text-yellow-500',
            2 => 'text-gray-400',
            3 => 'text-orange-600',
            default => 'text-indigo-500',
        };
    }
}