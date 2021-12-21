<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Models\Respuesta;
use App\Models\Pregunta;
use App\Models\Cuestionario;
use App\Models\Opcion;
use App\Http\Requests\CreateRespuestaRequest;
use App\Http\Requests\UpdateRespuestaRequest;
class RespuestaController extends Controller
{

  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    $respuestas = Respuesta::with('opcion')->with('pregunta')->with('grupo')->with('cuestionario')->get();
    return $respuestas;
  }

  public function respuestasByCuestionario(Request $request) {
    $respuestas = Respuesta::where('cuestionario_id', $request->id)->get();
    return $respuestas;
  }

  public function respuestasByCuestionarioSum(Request $request) {
    $respuestas = Respuesta::selectRaw('grupo_id, SUM(puntaje) as total')->where('cuestionario_id', $request->id)->with('grupo')->groupBy('grupo_id')->orderBy('total', 'desc')->get();
    return $respuestas;
  }

  public function respuestasByPregunta(Request $request) {
    $respuestas = Respuesta::where('pregunta_id', $request->id)->with('opcion')->with('grupo')->orderBy('puntaje', 'desc')->orderBy('created_at', 'asc')->get();
    return $respuestas;
  }
  /**


  /**
  * Store a newly created resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @return \Illuminate\Http\Response
  */
  public function store(CreateRespuestaRequest $request) {
    Arr::set($request, 'grupoPregunta', $request->grupo_id . '-' . $request->pregunta_id);
    $request->validate(['grupoPregunta' => ['unique:respuestas,grupoPregunta']]);

    $respuesta = new respuesta();
    $respuesta->cuestionario_id = Pregunta::findOrFail($request->pregunta_id)->cuestionario_id;
    if ((Opcion::findOrFail($request->opcion_id)->correcto) == true) {
      $respuesta->puntaje = Pregunta::findOrFail($request->pregunta_id)->valor;

      if (!Respuesta::where('opcion_id', '=', $request->opcion_id)->exists()) {
        $respuesta->puntaje = $respuesta->puntaje * 1.5;

      };
    } else {
      $respuesta->puntaje = 0;
    };
    $respuesta->opcion_id = $request->opcion_id;
    $respuesta->pregunta_id = $request->pregunta_id;
    $respuesta->grupoPregunta = $request->grupoPregunta;
    $respuesta->grupo_id = $request->grupo_id;
    $respuesta->puntaje = Pregunta::findOrFail($request->pregunta_id)->valor;

    $respuesta->save();

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
    $respuesta = Respuesta::with('opcion')->with('pregunta')->with('grupo')->with('cuestionario')->findOrFail($request->id);
    return $respuesta;
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
  public function update(UpdateRespuestaRequest $request) {
    $respuesta = Respuesta::findOrFail($request->id);
    $respuesta->opcion_id = $request->opcion_id;
    $respuesta->puntaje = $request->puntaje;

    $respuesta->save();
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
    $respuesta = Respuesta::destroy($request->id);
    return response()->json([
      'res' => true,
      'message' => 'Registro eliminado correctamente'
    ], 200);
  }
}