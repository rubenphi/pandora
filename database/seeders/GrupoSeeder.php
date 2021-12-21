<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GrupoSeeder extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */
  public function run() {
    DB::table('grupos')->insert([
      [
        'nombre' => 'grupo 1',
        'curso_id' => '1',
        'created_at' => date('Y-m-d H:i:s')
      ],
      [
        'nombre' => 'grupo 2',
        'curso_id' => '1',
        'created_at' => date('Y-m-d H:i:s')
      ]
      ,
      [
        'nombre' => 'grupo 3',
        'curso_id' => '1',
        'created_at' => date('Y-m-d H:i:s')
      ]
      ,
      [
        'nombre' => 'grupo 4',
        'curso_id' => '1',
        'created_at' => date('Y-m-d H:i:s')
      ]
      ,
      [
        'nombre' => 'grupo 5',
        'curso_id' => '1',
        'created_at' => date('Y-m-d H:i:s')
      ]
      ,
      [
        'nombre' => 'grupo 6',
        'curso_id' => '1',
        'created_at' => date('Y-m-d H:i:s')
      ]
    ]);
  }
}