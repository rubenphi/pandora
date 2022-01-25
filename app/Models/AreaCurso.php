<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AreaCurso extends Model
{
    use HasFactory;
    protected $fillable = [
        'area_id',
        'curso_',
        'area_curso'
      ];
}
