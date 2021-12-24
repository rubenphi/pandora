<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
  /**
  * Seed the application's database.
  *
  * @return void
  */
  public function run() {
    $this->call(CursoSeeder::class);
    $this->call(GrupoSeeder::class);
    $this->call(UserSeeder::class);
    $this->call(CuestionarioSeeder::class);
    $this->call(OpcionSeeder::class);
    $this->call(PreguntaSeeder::class);
    $this->call(RespuestaSeeder::class);

  }
}