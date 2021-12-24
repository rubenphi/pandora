<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up() {
    Schema::create('users', function (Blueprint $table) {
      $table->id();
      $table->string('name');
      $table->string('rol');
      $table->foreignId('curso_id')->nullable()->references('id')->on('cursos')->cascadeOnUpdate()->nullOnDelete();
      $table->foreignId('grupo_id')->nullable()->references('id')->on('grupos')->cascadeOnUpdate()->nullOnDelete();
      $table->string('email')->unique();
      $table->timestamp('email_verified_at')->nullable();
      $table->string('password');
      $table->rememberToken();
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

    Schema::table('grupos', function (Blueprint $table) {
      $table->dropForeign(['grupo_id']);
    });

    Schema::dropIfExists('users');
  }
}