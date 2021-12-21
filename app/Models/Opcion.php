<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Opcion extends Model
{
  use HasFactory;
  protected $fillable = ['enunciado',
    'correcto',
    'letra',
    'pregunta_id',
    'letraPregunta',
    'correctoPregunta'
    ];

  public function pregunta() {
    return $this->belongsTo(Pregunta::class, 'pregunta_id');
  }
}