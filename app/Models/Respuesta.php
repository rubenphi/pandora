<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Respuesta extends Model
{
  use HasFactory;
  protected $fillable = [
    'opcion_id',
    'pregunta_id',
    'grupo_id',
    'puntaje',
    'cuestionario_id',
    'grupoPregunta'
    ];
  protected $dateFormat = 'Y-m-d H:i:s.u';
  public function opcion() {
    return $this->belongsTo(Opcion::class, 'opcion_id');
  }

  public function pregunta() {
    return $this->belongsTo(Pregunta::class, 'pregunta_id');
  }

  public function grupo() {
    return $this->belongsTo(Grupo::class, 'grupo_id');
  }
  public function cuestionario() {
    return $this->belongsTo(Cuestionario::class, 'cuestionario_id');
  }
}
