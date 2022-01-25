<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAreaCurso extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('area_cursos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('curso_id')->nullable()->references('id')->on('cursos')->cascadeOnUpdate()->nullOnDelete();
            $table->foreignId('area_id')->nullable()->references('id')->on('areas')->cascadeOnUpdate()->nullOnDelete();
            $table->string('area_curso')->nullable()->references('id')->on('areas')->cascadeOnUpdate()->nullOnDelete();
            $table->timestamps();
        });


        Schema::table('cuestionarios', function (Blueprint $table) {
            $table->boolean('area_id')->after('curso_id');
        });

        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {

        Schema::table('cursos', function (Blueprint $table) {
            $table->dropForeign(['curso_id']);
          });

          Schema::table('areas', function (Blueprint $table) {
            $table->dropForeign(['curso_id']);
          });
        Schema::dropIfExists('cursos_areas');
    }
}
