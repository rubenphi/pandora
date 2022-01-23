<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOpcionsTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up() {
    Schema::create('opcions', function (Blueprint $table) {
      $table->id();
      $table->string('enunciado', 500);
      $table->boolean('correcto');
      $table->string('letra');
      $table->string('letraPregunta');
      $table->string('correctoPregunta');
      $table->foreignId('pregunta_id')->nullable()->references('id')->on('preguntas')->cascadeOnUpdate()->nullOnDelete();
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
    Schema::dropIfExists('opcions');
  }
}