<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pregunta;
use App\Models\Opcion;
use App\Http\Requests\CreatePreguntaRequest;
use App\Http\Requests\UpdatePreguntaRequest;
use App\Http\Traits\Traits;

class PreguntaController extends Controller
{
  /**
  * Display a listing of the resource.
  *
  * @return \Illuminate\Http\Response
  */
  public function index() {
    if (Traits::superadmin()) {
      $preguntas = Pregunta::with('cuestionario')->get();
      return $preguntas;
    } else {
      return Traits::error('Solo un administrador puede ver todas las preguntas', 400);
    }


  }

  public function preguntasByCuestionario(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'cuestionario');
    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $preguntas = Pregunta::where('cuestionario_id', $request->id)->where('existe', 1)->get();
      return $preguntas;
    } else {
      return Traits::error('Si no es administrador no puede ver preguntas que no pertenecen a cuestionarios asignados a su curso', 400);
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
  public function store(CreatePreguntaRequest $request) {
    if (Traits::superadmin()) {
    if($request->visible == true){
      $request->visible = 1;
    } else {
      $request->visible = 0;
    };
    
    if($request->disponible == true){
      $request->disponible = 1;
    } else {
      $request->disponible = 0;
    };

      $pregunta = new Pregunta();
        if($request->has('photo') & gettype($request->photo) == 'object'){
                $pregunta->photo = Traits::uploadPhoto($request->photo);
        } else {
        $pregunta->photo = $request->photo;
        };
      $pregunta->existe = $request->existe;
      $pregunta->enunciado = $request->enunciado;
       $pregunta->titulo = $request->titulo;
          $pregunta->cuestionario_id = $request->cuestionario_id;
      $pregunta->valor = $request->valor;
      $pregunta->visible = $request->visible;
      $pregunta->disponible = $request->disponible;


      $pregunta->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro creado correctamente'
      ], 200);
    } else {
      return Traits::error('Si no es administrador no puede crear preguntas', 400);
    }


  }

  public function importPreguntas(Request $request){
    $preguntas = Pregunta::with('cuestionario')->with('opciones')->find($request->preguntas);
    foreach ($preguntas as $pregunta){
      $datos = new Pregunta();
      $datos->photo = $pregunta->photo;
      $datos->titulo = $pregunta->titulo;
      $datos->enunciado = $pregunta->enunciado;
      $datos->cuestionario_id = $request->id;
      $datos->valor = $pregunta->valor;
      $datos->visible = 0;
      $datos->disponible = 0;
      $datos->existe = $pregunta->existe;
      $datos->save();
      $opciones = Opcion::where('pregunta_id', $pregunta->id)->get();
      foreach ($opciones as $opcion){
        $dat = new Opcion();
        $dat->enunciado = $opcion->enunciado;
        $dat->correcto = $opcion->correcto;
        $dat->letra = $opcion->letra;
        $dat->pregunta_id = $datos->id;
        $dat->letraPregunta = $opcion->letra . "-" . $datos->id;
        $dat->correctoPregunta = $opcion->correcto . "-" . $datos->id;
        $dat->save();
      } 
    }
    return $request->preguntas;
  }
  public function importPreguntasByCuestionario(Request $request){
    
    $request->id= intval($request->a);
    $request->b = intval($request->b);
    $a = new Request();
    $a->id = intval($request->a);
    $b = new Request();
    $b->id = intval($request->b);

  $preguntas = $this->preguntasByCuestionario($a);
    foreach ($preguntas as $pregunta){
      $datos = new Pregunta();
      $datos->photo = $pregunta->photo;
      $datos->titulo = $pregunta->titulo;
      $datos->enunciado = $pregunta->enunciado;
      $datos->cuestionario_id = $b->id;
      $datos->valor = $pregunta->valor;
      $datos->visible = 0;
      $datos->disponible = 0;
      $datos->existe = $pregunta->existe;
      $datos->save();
      $opciones = Opcion::where('pregunta_id', $pregunta->id)->get();
      foreach ($opciones as $opcion){
        $dat = new Opcion();
        $dat->enunciado = $opcion->enunciado;
        $dat->correcto = $opcion->correcto;
        $dat->letra = $opcion->letra;
        $dat->pregunta_id = $datos->id;
        $dat->letraPregunta = $opcion->letra . "-" . $datos->id;
        $dat->correctoPregunta = $opcion->correcto . "-" . $datos->id;
        $dat->save();
      } 
    }
    return "proceso finalizado";
  }

  /**
  * Display the specified resource.
  *
  * @param  int  $id
  * @return \Illuminate\Http\Response
  */
  public function show(Request $request) {
    $curso_id = Traits::verCurso($request->id, 'pregunta');
    if (Traits::curso($curso_id) || Traits::superadmin()) {
      $pregunta = Pregunta::with('cuestionario')->with('opciones')->findOrFail($request->id);
      return $pregunta;
    } else {
      return Traits::error('Si no es administrador o esta pregunta no fue asignada a su curso no la puede ver', 400);
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
  public function update(UpdatePreguntaRequest $request) {
    if (Traits::superadmin()) {
       
        
      $pregunta = Pregunta::findOrFail($request->id);
      if($request->has('photo') & gettype($request->photo) == 'object'){
                $pregunta->photo = Traits::uploadPhoto($request->photo);
           } else {
        $pregunta->photo = $request->photo;
        };
      $pregunta->existe = $request->existe;
      $pregunta->enunciado = $request->enunciado;
    
           $pregunta->titulo = $request->titulo;
      $pregunta->cuestionario_id = $request->cuestionario_id;
      $pregunta->valor = $request->valor;
      $pregunta->disponible = $request->disponible;
      $pregunta->visible = $request->visible;
     
  

      $pregunta->save();
      return response()->json([
        'res' => true,
        'message' => 'Registro actualizado correctamente',
        'visible' => $pregunta->visible,
        'disponible' => $pregunta->disponible
      ], 200);
    } else {
      return Traits::error('Si no es administrador no puede modificar preguntas', 400);
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
      $pregunta = Pregunta::destroy($request->id);
      return response()->json([
        'res' => true,
        'message' => 'Registro eliminado correctamente'
      ], 200);
    } else {
      return Traits::error('Si no es administrador no puede eliminar preguntas', 400);
    }


  }
}
