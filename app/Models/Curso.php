<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
  use HasFactory;
  protected $fillable = [
    'nombre'
  ];

  public function cuestionario() {
    return $this->belongsTo(Cuestionario::class, 'cuestionario_id');
  }
}