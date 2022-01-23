<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Models\Opcion;
use App\Http\Requests\CreateOpcionRequest;
use App\Http\Requests\UpdateOpcionRequest;
use App\Http\Traits\Traits;

class OpcionController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    $opciones = Opcion::with('pregunta')->get();
    return $opciones;
  }

  public function opcionesByPregunta(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'pregunta')->where('existe', 1);

    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $opciones = Opcion::where('pregunta_id', $request->id)->get();
      return $opciones;
    } else {
      return Traits::error('Si no es administrador no puede ver las opciones de respuesta si la pregunta no existe en un cuestionario asignado a su curso', 400);
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
  public function store(CreateOpcionRequest $request) {
    if (Traits::superadmin()) {
      $opcion = new Opcion();
      Arr::set($request, 'letraPregunta', $request->letra . '-' . $request->pregunta_id);
      Arr::set($request, 'correctoPregunta', $request->correcto . '-' . $request->pregunta_id);
      $request->validate(['letraPregunta' => ['unique:opcions,letraPregunta']], ['letraPregunta.unique' => 'Ya hay una opción de respuesta con esa letra o identificador']);
      $opcion->enunciado = $request->enunciado;
      $opcion->correcto = $request->correcto;
      $opcion->letra = $request->letra;
      $opcion->pregunta_id = $request->pregunta_id;
      $opcion->letraPregunta = $request->letraPregunta;
      $opcion->correctoPregunta = $request->correctoPregunta;
      if ($opcion->correcto == true) {
        $request->validate(['correctoPregunta' => ['unique:opcions,correctoPregunta']], ['correctoPregunta.unique' => 'No puedes marcar como correcta dos opciones']);
      }
      $opcion->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo administradores pueden añadir opciones de respuesta a una pregunta', 400);
    }





  }

  /**
  * Display the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function show(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'opcion');
    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $opcion = Opcion::with('pregunta')->findOrFail($request->id);
      return $opcion;
    } else {
      return Traits::error('Si no es administrador no puede ver las opciones de respuesta si la pregunta no existe en un cuestionario asignado a su curso', 400);
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
  public function update(UpdateOpcionRequest $request) {
    if (Traits::superadmin()) {
      $opcion = Opcion::findOrFail($request->id);
      Arr::set($request, 'letraPregunta', $request->letra . '-' . $request->pregunta_id);
      Arr::set($request, 'correctoPregunta', $request->correcto . '-' . $request->pregunta_id);
      $request->validate(['letraPregunta' => ['unique:opcions,letraPregunta,'. $request->id]], ['letraPregunta.unique' => 'Ya hay una opción de respuesta con esa letra o identificador']);
      $opcion->enunciado = $request->enunciado;
      $opcion->correcto = $request->correcto;
      $opcion->letra = $request->letra;
      $opcion->pregunta_id = $request->pregunta_id;
      $opcion->letraPregunta = $request->letraPregunta;
      $opcion->correctoPregunta = $request->correctoPregunta;
      if ($opcion->correcto == true) {
        $request->validate(['correctoPregunta' => ['unique:opcions,correctoPregunta,'. $request->id]], ['correctoPregunta.unique' => 'No puedes marcar como correcta dos opciones']);
      }
      $opcion->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente'
      ], 200);

    } else {
      return Traits::error('Solo administradores pueden modificar opciones de respuesta', 400);
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
      $opcion = Opcion::destroy($request->id);
      return response()->json([
        'res' => true,
        'message' => 'Registro eliminado correctamente'
      ], 200);
    } else {
      return Traits::error('Solo administradores pueden eliminar opciones de respuesta', 400);
    }


  }
}