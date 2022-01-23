<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Existe_faltante extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {


        Schema::table('opcions', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('letra');
        });

        Schema::table('respuestas', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('puntaje');
        });


        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
