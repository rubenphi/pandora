<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class UserSeeder extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */
  public function run() {
    DB::table('users')->insert([
      [
        'name' => 'Rubén Darío Villamil Zamora',
        'code' => '001',
        'email' => 'rubenphii@gmail.com',
        'curso_id' => 1,
        'grupo_id' => 1,
        'password' => Hash::make('japon93'),
        'rol' => 'admin',
        'created_at' => date('Y-m-d H:i:s.').gettimeofday()["usec"]
      ]
    ]);
  }
}
