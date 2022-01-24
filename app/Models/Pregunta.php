<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
  use HasFactory;
  protected $fillable = [
    'enunciado',
    'photo',
    'cuestionario_id',
    'valor',
    'visible',
    'disponible'
  ];

  public function opciones() {
    return $this->hasMany(Opcion::class)->orderBy('letra','asc')->where('existe', '=' , 1);
  }

  public function cuestionario() {
    return $this->belongsTo(Cuestionario::class, 'cuestionario_id');
  }
}
