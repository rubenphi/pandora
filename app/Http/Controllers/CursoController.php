<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Curso;
use App\Http\Requests\CreateCursoRequest;
use App\Http\Requests\UpdateCursoRequest;
use App\Http\Traits\Traits;

class CursoController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    if (Traits::superadmin()) {
      $cursos = Curso::all();
      return $cursos;
    } else {
      return Traits::error('Solo un administrador puede ver todos los cursos', 400);
    }


  }

  /**
  * Show the form for creating a new resource.
  *
  * @return \Illuminate\Http\Response
  */

  /**
  * Store a newly created resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @return \Illuminate\Http\Response
  */
  public function store(CreateCursoRequest $request) {
    if (Traits::superadmin()) {
      $curso = new Curso();
      $curso->nombre = $request->nombre;

      $curso->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo el administrador puede crear cursos', 400);
    }


  }

  /**
  * Display the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function show(Request $request) {
    if (Traits::curso($request->id) || Traits::superadmin()) {
      $curso = Curso::with('cuestionarios')->with('grupos')->with('integrantes')->findOrFail($request->id);
      return $curso;
    } else {
      return Traits::error('Acceso denegado, no es administrador o no pertenece al curso', 400);
    }


  }

  /**
  * Show the form for editing the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */

  /**
  * Update the specified resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function update(UpdateCursoRequest $request) {
    if (Traits::superadmin()) {
      $curso = Curso::findOrFail($request->id);
      $curso->nombre = $request->nombre;

      $curso->save();

      return response()->json([
        'res' => true,
        'message' => 'Registro actualizado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo el administrador puede modificar cursos', 400);
    }


  }

  /**
  * Remove the specified resource from storage.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function destroy(Request $request) {
    if (Traits::superadmin()) {

      $curso = Curso::destroy($request->id);
      return response()->json([
        'res' => true,
        'message' => 'Registro eliminado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo el administrador puede eliminar cursos', 400);
    }


  }
}