<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pregunta;

class PreguntaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $preguntas = Pregunta::with('cuestionario')->get();
        return $preguntas;
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
//
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $pregunta = new Pregunta();
        $pregunta->enunciado = $request->enunciado;
        $pregunta->cuestionario_id = $request->cuestionario_id;
	   	$pregunta->valor = $request->valor;
			$pregunta->visible = $request->visible;
			$pregunta->disponible = $request->disponible;


        $pregunta->save();
        return $pregunta;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
         $pregunta = Pregunta::with('cuestionario')->findOrFail($request->id);
        return $pregunta;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $pregunta = Pregunta::findOrFail($request->id);
        $pregunta->enunciado = $request->enunciado;
        $pregunta->cuestionario_id = $request->cuestionario_id;
	   	$pregunta->valor = $request->valor;
			$pregunta->visible = $request->visible;
			$pregunta->disponible = $request->disponible;


        $pregunta->save();
        return $pregunta;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $pregunta = Pregunta::destroy($request->id);
        return $pregunta;
    }
}
