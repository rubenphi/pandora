<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuestionario extends Model
{
  use HasFactory;
  protected $fillable = [
    'tema',
    'fecha',
    'usuario_id',
    'curso_id'
  ];
  public function curso() {
    return $this->belongsTo(Curso::class, 'curso_id');
  }

  public function area() {
    return $this->belongsTo(Area::class, 'area_id');
  }

  public function preguntas() {
    return $this->hasMany(Pregunta::class)->where('existe', '=' ,1);
  }
}