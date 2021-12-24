<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RespuestaSeeder extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */
  public function run() {
    DB::table('respuestas')->insert([
      [
        'opcion_id' => 1,
        'pregunta_id' => 1,
        'grupo_id' => 1,
        'grupoPregunta' => '1-1',
        'puntaje' => 0,
        'cuestionario_id' => 1,
        'created_at' => date('Y-m-d H:i:s.').gettimeofday()["usec"]+100
      ],
      [
        'opcion_id' => 1,
        'pregunta_id' => 1,
        'grupo_id' => 2,
        'grupoPregunta' => '2-1',
        'puntaje' => 0,
        'cuestionario_id' => 1,
        'created_at' => date('Y-m-d H:i:s.').gettimeofday()["usec"]
      ],
      [
        'opcion_id' => 0,
        'pregunta_id' => 2,
        'grupo_id' => 3,
        'grupoPregunta' => '3-2',
        'puntaje' => 8,
        'cuestionario_id' => 1,
        'created_at' => date('Y-m-d H:i:s.').gettimeofday()["usec"]
      ]
    ]);
  }
}