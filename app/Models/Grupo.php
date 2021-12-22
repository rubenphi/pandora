<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grupo extends Model
{
  use HasFactory;
  protected $fillable = [
    'nombre',
    'curso_id'
  ];

  public function curso() {
    return $this->belongsTo(Curso::class, 'curso_id');
  }

  public function integrantes() {
    return $this->hasMany(User::class);
  }

}