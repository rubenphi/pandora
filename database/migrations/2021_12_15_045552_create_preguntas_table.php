<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePreguntasTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up() {
    Schema::create('preguntas', function (Blueprint $table) {
      $table->id();
      $table->string('enunciado', 500);
      $table->foreignId('cuestionario_id')->references('id')->on('cuestionarios')->cascadeOnUpdate()->nullOnDelete();
      $table->integer('valor');
      $table->boolean('visible');
      $table->boolean('disponible');
      $table->timestamps();
    });
  }

  /**
  * Reverse the migrations.
  *
  * @return void
  */
  public function down() {

    Schema::table('cuestionarios', function (Blueprint $table) {
      $table->dropForeign(['custionario_id']);
    });
    Schema::dropIfExists('preguntas');


  }
}