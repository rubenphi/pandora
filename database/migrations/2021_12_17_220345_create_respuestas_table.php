<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
class CreateRespuestasTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up() {
    Schema::create('respuestas', function (Blueprint $table) {
      $table->id();
      $table->foreignId('pregunta_id')->nullable()->references('id')->on('preguntas')->cascadeOnUpdate()->nullOnDelete();
      $table->foreignId('grupo_id')->nullable()->references('id')->on('grupos')->cascadeOnUpdate()->nullOnDelete();
      $table->foreignId('opcion_id')->nullable()->references('id')->on('opcions')->cascadeOnUpdate()->nullOnDelete();
      $table->foreignId('cuestionario_id')->nullable()->references('id')->on('cuestionarios')->cascadeOnUpdate()->nullOnDelete();
      $table->integer('puntaje');
      $table->string('grupoPregunta');
      $table->timestamps();
    });
  }

  /**
  * Reverse the migrations.
  *
  * @return void
  */
  public function down() {

    Schema::table('preguntas', function (Blueprint $table) {
      $table->dropForeign(['pregunta_id']);
    });

    Schema::table('opcions', function (Blueprint $table) {
      $table->dropForeign(['opcion_id']);
    });

    Schema::table('grupos', function (Blueprint $table) {
      $table->dropForeign(['grupo_id']);
    });

    Schema::table('cuestionarios', function (Blueprint $table) {
      $table->dropForeign(['cuestionario_id']);
    });


    Schema::dropIfExists('respuestas');
  }


}