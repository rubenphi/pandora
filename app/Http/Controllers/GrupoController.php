<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Grupo;
use App\Http\Requests\CreateGrupoRequest;
use App\Http\Requests\UpdateGrupoRequest;
use App\Http\Traits\Traits;

class GrupoController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    if (Traits::superadmin()) {
      $grupos = Grupo::with('curso')->get();
      return $grupos;
    } else {
      return Traits::error('Solo un administrador puede ver todos los grupos', 400);
    }

  }

  /**
  * Show the form for creating a new resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function gruposByCurso(Request $request) {
    if (Traits::curso($request->id) || Traits::superadmin()) {
      $grupos = Grupo::where('curso_id', $request->id)->where('existe', 1)->get();
      return $grupos;
    } else {
      return Traits::error('Acceso denegado, no es administrador o no pertenece al curso', 400);
    }

  }

  /**
  * Store a newly created resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @return \Illuminate\Http\Response
  */
  public function store(CreateGrupoRequest $request) {
    if (Traits::superadmin()) {
      $grupo = new Grupo();
      $grupo->nombre = $request->nombre;
      $grupo->curso_id = $request->curso_id;
      $grupo->existe = $request->existe;

      $grupo->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo un administrador puede crear grupos', 400);
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
      $grupo = Grupo::with('curso')->with('integrantes')->findOrFail($request->id);
      return $grupo;
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
    if (Traits::superadmin()) {
      $grupo = Grupo::findOrFail($request->id);
      $grupo->nombre = $request->nombre;
      $grupo->curso_id = $request->curso_id;


      $grupo->save();

      return response()->json([
        'res' => true,
        'message' => 'Registro actualizado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo un administrador puede modificar grupos', 400);
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
      $grupo = Grupo::destroy($request->id);
    return response()->json([
      'res' => true,
      'message' => 'Registro eliminado correctamente'
    ], 200);
    } else {
      return Traits::error('Solo un administrador puede eliminar grupos', 400);
    }
    
    
  }
}