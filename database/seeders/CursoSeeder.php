<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CursoSeeder extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */
  public function run() {
    DB::table('cursos')->insert([
      [
        'nombre' => '902',
        'created_at' => date('Y-m-d H:i:s')
      ]
    ]);
  }
}