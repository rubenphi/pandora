<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Curso;
use App\Http\Requests\CreateCursoRequest;
use App\Http\Requests\UpdateCursoRequest;

class CursoController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    $cursos = Curso::all();
    return $cursos;
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
    $curso = new Curso();
    $curso->nombre = $request->nombre;

    $curso->save();
    return response()->json([
      'res' => true,
      'message' => 'Registro creado correctamente'
    ], 200);
  }

  /**
  * Display the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function show(Request $request) {
    $curso = Curso::with('curso')->findOrFail($request->id);
    return $curso;
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
    $curso = Curso::findOrFail($request->id);
    $curso->nombre = $request->nombre;

    $curso->save();

        return response()->json([
      'res' => true,
      'message' => 'Registro actualizado correctamente'
    ], 200);
  }

  /**
  * Remove the specified resource from storage.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function destroy(Request $request) {
    $curso = Curso::destroy($request->id);
        return response()->json([
      'res' => true,
      'message' => 'Registro eliminado correctamente'
    ], 200);
  }
}