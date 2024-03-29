<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
  use HasFactory;
  protected $fillable = [
    'titulo',
    'enunciado',
    'photo',
    'cuestionario_id',
    'valor',
    'visible',
    'disponible',
    'revelada',
    'tiempo'
  ];

  protected $attributes = [
    'revelada' => false,
];

  public function opciones() {
    return $this->hasMany(Opcion::class)->orderBy('letra','asc')->where('existe', '=' , 1);
  }

  public function cuestionario() {
    return $this->belongsTo(Cuestionario::class, 'cuestionario_id');
  }
}
