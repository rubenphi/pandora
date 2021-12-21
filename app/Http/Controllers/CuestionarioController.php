<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cuestionario;
use App\Http\Requests\CreateCuestionarioRequestRequest;
use App\Http\Requests\UpdateCuestionarioRequest;

class CuestionarioController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    $cuestionarios = Cuestionario::with('curso')->get();
    return $cuestionarios;
  }


  public function cuestionariosByCurso(Request $request) {
    $cuestionarios = Cuestionario::where('curso_id', $request->id)->get();
    return $cuestionarios;
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
    $cuestionario = new Cuestionario();
    $cuestionario->tema = $request->tema;
    $cuestionario->fecha = $request->fecha;
    $cuestionario->usuario_id = $request->usuario_id;
    $cuestionario->curso_id = $request->curso_id;

    $cuestionario->save();
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
    $cuestionario = Cuestionario::with('preguntas')->with('curso')->findOrFail($request->id);
    return $cuestionario;
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
    $cuestionario = Cuestionario::findOrFail($request->id);
    $cuestionario->tema = $request->tema;
    $cuestionario->fecha = $request->fecha;
    $cuestionario->usuario_id = $request->usuario_id;
    $cuestionario->curso_id = $request->curso_id;

    $cuestionario->save();
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
    $cuestionario = Cuestionario::destroy($request->id);
        return response()->json([
      'res' => true,
      'message' => 'Registro eliminado correctamente'
    ], 200);
  }
}