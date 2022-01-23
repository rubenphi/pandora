<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cuestionario;
use App\Http\Requests\CreateCuestionarioRequest;
use App\Http\Requests\UpdateCuestionarioRequest;
use App\Http\Traits\Traits;

class CuestionarioController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    if (Traits::superadmin()) {
      $cuestionarios = Cuestionario::with('curso')->get();
      return $cuestionarios;
    } else {
      return Traits::error('Acceso denegado, no es administrador', 400);
    }


  }


  public function cuestionariosByCurso(Request $request) {
    if (Traits::curso($request->id) || Traits::superadmin()) {
      $cuestionarios = Cuestionario::where('curso_id', $request->id)->where('existe', 1)->with('curso')->get();
      return $cuestionarios;
    } else {
      return Traits::error('Acceso denegado, no es administrador o no pertenece al curso', 400);
    }

  }

  /**
  *
  *

  * Show the form for creating a new resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function create() {
    //
  }

  /**
  * Store a newly created resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @return \Illuminate\Http\Response
  */
  public function store(CreateCuestionarioRequest $request) {

    if (Traits::superadmin()) {
      $cuestionario = new Cuestionario();
      $cuestionario->tema = $request->tema;
      $cuestionario->fecha = $request->fecha;
      $cuestionario->usuario_id = auth()->user()->id;
      $cuestionario->curso_id = $request->curso_id;

      $cuestionario->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo pueden crear cuestionarios los profesores o el administrador', 400);
    }

  }

  /**
  * Display the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function show(Request $request) {
    if (Traits::curso($request->curso_id) || Traits::superadmin()) {
      $cuestionario = Cuestionario::with('preguntas')->with('curso')->findOrFail($request->id);
      return $cuestionario;
    } else {
      return Traits::error('Solo puedes ver este cuestionario si está asignado a tu curso o si eres administrador', 400);
    }

  }

  /**
  * Show the form for editing the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function edit($id) {}

  /**
  * Update the specified resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function update(UpdateCuestionarioRequest $request) {
    if (Traits::superadmin()) {
      $cuestionario = Cuestionario::findOrFail($request->id);
      $cuestionario->tema = $request->tema;
      $cuestionario->fecha = $request->fecha;
      $cuestionario->usuario_id = auth()->user()->id;
      $cuestionario->curso_id = $request->curso_id;

      $cuestionario->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro actualizado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo los administradores o profesores pueden modificar los cuestionarios', 400);
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
      $cuestionario = Cuestionario::destroy($request->id);
      return response()->json([
        'res' => true,
        'message' => 'Registro eliminado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo los administradores o profesores pueden eliminar cuestionarios', 400);
    }


  }
}
