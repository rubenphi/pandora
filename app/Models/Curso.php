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

  public function cuestionarios() {
    return $this->hasMany(Cuestionario::class);
  }
  public function grupos() {
    return $this->hasMany(Grupo::class);
  }

  public function integrantes() {
    return $this->hasMany(User::class);
  }

}