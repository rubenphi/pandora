<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AutorRespuesta extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
            Schema::table('respuestas', function (Blueprint $table) {
              $table->foreignId('user_id')->nullable()->references('id')->on('users')->cascadeOnUpdate()->nullOnDelete();
 


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
               Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
          });


    }

