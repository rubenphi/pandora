<?php

namespace App\Http\Traits;

use App\Models\Invitation;
use App\Models\Curso;
use App\Models\Cuestionario;
use App\Models\Pregunta;
use App\Models\Opcion;
use App\Models\User;

trait Traits
{
  public static function admin($id) {

    $rolUser = auth()->user()->rol;
    if ($rolUser == 'admin') {
      return true;
    } else {
      return false;
    }
  }


  public static function curso($id) {

    $curso_id = auth()->user()->curso_id;
    if ($id == $curso_id) {
      return true;
    } else {
      return false;
    }
  }

  public static function verCurso(int $id, string $tipo) {
    switch ($tipo) {
      case 'cuestionario':
        return Cuestionario::findOrFail($id)->curso_id;
        break;
      case 'pregunta':
        return Pregunta::with('cuestionario')->with('opciones')->findOrFail($id)->cuestionario->curso_id;
        break;
      case 'opcion':
        return Pregunta::with('cuestionario')->with('opciones')->findOrFail(Opcion::findOrFail($id)->pregunta_id)->cuestionario->curso_id;

        break;
      default:
        return 0;
        break;

    }
  }


  public static function error(string $error, int $ecode) {
    return response()->json([
      'res' => false,
      'message' => $error
    ], $ecode);
  }

  public static function mismo($id) {
    $user = User::find($id);

    if (strval($user) == auth()->user()) {
      return true;
    } else {
      return false;
    }
  }

  public static function loged() {
    if (auth()->user() != null) {
      return true;
    } else {
      return false;
    }
  }

  public static function superadmin() {
    $rolUser = auth()->user()->rol;
    if ($rolUser == 'admin') {
      return true;
    } else {
      return false;
    }
  }

  public static function uploadPhoto($file) {

    $nameFile = time(). "." . $file->getClientOriginalExtension();
    $file->move(public_path('fotografias'), $nameFile);
    return 'fotografias/'.$nameFile;
  }

  public static function uploadDocument($file) {

    $nameFile = time(). "." . $file->getClientOriginalExtension();
    $file->move(public_path('documents'), $nameFile);
    return 'documents/'.$nameFile;
  }
}
