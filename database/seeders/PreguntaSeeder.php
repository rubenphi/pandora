<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PreguntaSeeder extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */

  public function run() {
    DB::table('preguntas')->insert([
      [
        'enunciado' => 'Hola mundo',
        'photo' => 'https://s1.significados.com/foto/897px-eugene-delacroix-le-28-juillet.-la-liberte-guidant-le-peuple_bg.jpg',
        'cuestionario_id' => 1,
        'valor' => 5,
        'visible' => true,
        'disponible' => false,
        'created_at' => date('Y-m-d H:i:s')
      ],
      [
        'enunciado' => 'Hola mundo 2',
        'cuestionario_id' => 1,
        'valor' => 5,
        'visible' => true,
        'disponible' => false,
        'created_at' => date('Y-m-d H:i:s')
      ]
    ]);

  }



}
