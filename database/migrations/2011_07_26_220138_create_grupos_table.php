<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGruposTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up() {
    Schema::create('grupos', function (Blueprint $table) {
      $table->id();
      $table->string('nombre')->unique();
      $table->foreignId('curso_id')->nullable()->references('id')->on('cursos')->cascadeOnUpdate()->nullOnDelete();
      $table->timestamps();
    });
  }

  /**
  * Reverse the migrations.
  *
  * @return void
  */
  public function down() {
    Schema::table('cursos', function (Blueprint $table) {
      $table->dropForeign(['curso_id']);
    });
    Schema::dropIfExists('grupos');
  }
}