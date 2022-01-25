<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;
    protected $fillable = [
        'nombre',
        'existe'
      ];

      public function cursos()
{

    return $this->belongsToMany(Curso::class, 'cursos_areas', 'area_id', 'curso_id');
}
}


