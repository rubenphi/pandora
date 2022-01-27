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
use App\Http\Traits\Traits;
class RespuestaController extends Controller
{

  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    if (Traits::superadmin()) {
      $respuestas = Respuesta::with('opcion')->with('pregunta')->with('grupo')->with('cuestionario')->get();
      return $respuestas;
    } else {
      return Traits::error('Solo un administrador puede ver todas las respuestas', 400);
    }


  }

  public function respuestasByCuestionario(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'cuestionario');
    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $respuestas = Respuesta::where('cuestionario_id', $request->id)->get();
      return $respuestas;
    } else {
      return Traits::error('Si no es admin solo puede ver respuestas de su curso', 400);
    }


  }

  public function respuestasByCuestionarioSum(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'cuestionario');
    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $respuestas = Respuesta::selectRaw('grupo_id, SUM(puntaje) as total')->where('cuestionario_id', $request->id)->with('grupo')->groupBy('grupo_id')->orderBy('total', 'desc')->get();
      return $respuestas;
    } else {
      return Traits::error('Si no es admin solo puede ver respuestas de su curso', 400);
    }
  }

  public function respuestasByPregunta(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'pregunta');
    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $respuestas = Respuesta::where('pregunta_id', $request->id)->with('opcion')->with('grupo')->orderBy('puntaje', 'desc')->orderBy('created_at', 'asc')->get();
      return $respuestas;
    } else {
      return Traits::error('Si no es admin solo puede ver respuestas de su curso', 400);
    }
  }




  /*
  * Store a newly created resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @return \Illuminate\Http\Response
  */
  public function store(CreateRespuestaRequest $request) {
    $curso_id = Traits::verCurso($request->pregunta_id, 'pregunta');

    if (( Traits::curso($curso_id) && Pregunta::findOrFail($request->pregunta_id)->disponible == 1   )|| Traits::superadmin()) {
      Arr::set($request, 'grupoPregunta', $request->grupo_id . '-' . $request->pregunta_id);
      $request->validate(['grupoPregunta' => ['unique:respuestas,grupoPregunta']]);

      $respuesta = new respuesta();
      $respuesta->cuestionario_id = Pregunta::findOrFail($request->pregunta_id)->cuestionario_id;
      if (Opcion::findOrFail($request->opcion_id)->correcto === 1) {
        $respuesta->puntaje = Pregunta::findOrFail($request->pregunta_id)->valor;

        if (!Respuesta::where('opcion_id', '=', $request->opcion_id)->where('pregunta_id', '=', $request->pregunta_id)->exists()) {
          $respuesta->puntaje = $respuesta->puntaje * 1.5;

        };
      } else {
        $respuesta->puntaje = 0;
      };
      $respuesta->existe = $request->existe;
      $respuesta->opcion_id = $request->opcion_id;
      $respuesta->pregunta_id = $request->pregunta_id;
      $respuesta->grupoPregunta = $request->grupoPregunta;
      $respuesta->grupo_id = $request->grupo_id;

      $respuesta->save();

      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente ' . (Opcion::findOrFail($request->opcion_id)->correcto)
      ], 200);
    } else {
      return Traits::error('Si no es admin solo puede ver responder a preguntas de su curso', 400);
    }


  
  }

  /**
  * Display the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function show(Request $request) {
    $respuesta = Respuesta::with('opcion')->with('pregunta')->with('grupo')->with('cuestionario')->findOrFail($request->id);

    if (Traits::curso($respuesta->cuestionario->curso_id) || Traits::superadmin()) {
      return $respuesta;
    } else {
      return Traits::error('Si no es admin solo puede ver responder a preguntas de su curso', 400);
    }


  }

  /**
  * Show the form for editing the specified resource.
  *


  
  * Update the specified resource in storage.
  *
  * @param  \Illuminate\Http\Request  $request
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function update(UpdateRespuestaRequest $request) {
    if (Traits::superadmin()) {
      $respuesta = Respuesta::findOrFail($request->id);
      $respuesta->opcion_id = $request->opcion_id;
      $respuesta->puntaje = $request->puntaje;
      $respuesta->existe = $request->existe;
      $respuesta->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro actualizado correctamente'
      ], 200);
    } else {
      return Traits::error('Si no es admin no puede modificar una respuesta', 400);
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
      $respuesta = Respuesta::destroy($request->id);
      return response()->json([
        'res' => true,
        'message' => 'Registro eliminado correctamente'
      ], 200);
    } else {
      return Traits::error('Si no es admin no puede eliminar una respuesta', 400);
    }


  }
}
