<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OpcionSeeder extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */
  public function run() {
    DB::table('opcions')->insert([
      [
        'enunciado' => 'Primera opción',
        'correcto' => false,
        'letra' => 'B',
        'pregunta_id' => 1,
        'letraPregunta' => 'B-1',
        'correctoPregunta' => '0-1',
        'created_at' => date('Y-m-d H:i:s')
      ],
      [
        'enunciado' => 'Segunda opción',
        'correcto' => true,
        'letra' => 'A',
        'pregunta_id' => 1,
                'letraPregunta' => 'A-1',
        'correctoPregunta' => '1-1',
        'created_at' => date('Y-m-d H:i:s')
      ],
      [
        'enunciado' => 'Tercera opción',
        'correcto' => false,
        'letra' => 'D',
        'pregunta_id' => 1,
                'letraPregunta' => 'D-1',
        'correctoPregunta' => '0-1',
        'created_at' => date('Y-m-d H:i:s')
      ],
      [
        'enunciado' => 'Cuarta opción',
        'correcto' => false,
        'letra' => 'C',
        'pregunta_id' => 1,
                'letraPregunta' => 'C-1',
        'correctoPregunta' => '0-1',
        'created_at' => date('Y-m-d H:i:s')
      ]

    ]);

  }
}