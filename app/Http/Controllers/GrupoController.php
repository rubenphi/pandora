<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Grupo;
use App\Http\Requests\CreateGrupoRequest;
use App\Http\Requests\UpdateGrupoRequest;

class GrupoController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    $grupos = Grupo::with('curso')->get();
    return $grupos;
  }

  /**
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
  public function store(CreateGrupoRequest $request) {
    $grupo = new Grupo();
    $grupo->nombre = $request->nombre;
    $grupo->curso_id = $request->curso_id;


    $grupo->save();
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
    $grupo = Grupo::with('curso')->findOrFail($request->id);
    return $grupo;
  }

  /**
  * Show the form for editing the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function edit($id) {
    //
  }

  /**
  * Update the specified resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function update(UpdateGrupoRequest $request) {
    $grupo = Grupo::findOrFail($request->id);
    $grupo->nombre = $request->nombre;
    $grupo->curso_id = $request->curso_id;


    $grupo->save();

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
    $grupo = Grupo::destroy($request->id);
    return response()->json([
      'res' => true,
      'message' => 'Registro eliminado correctamente'
    ], 200);
  }
}