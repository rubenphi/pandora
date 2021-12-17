<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
    use HasFactory;
    protected $fillable = ['enunciado', 'cuestionario_id','valor','visible','disponible'];

	public function cuestionario() 
	{
		return $this->belongsTo(Cuestionario::class, 'cuestionario_id');
	}
}
