<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CuestionarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cuestionarios')->insert([
			[
			'tema' => 'Cosas' ,
			'fecha' => date('Y-m-d H:i:s'),
			'usuario_id' => 1,
			'created_at' => date('Y-m-d H:i:s')
	      ]
]);

    }
}
