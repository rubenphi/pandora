<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Existe extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::table('cursos', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('nombre');
        });

        Schema::table('grupos', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('nombre');
        });

        Schema::table('cuestionarios', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('usuario_id');
        });

        Schema::table('users', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('rol');
        });

        Schema::table('preguntas', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('valor');
        });

        Schema::table('preguntas', function (Blueprint $table) {
            $table->boolean('existe')->default(1)->after('valor');
        });


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
