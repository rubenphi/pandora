<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cuestionario;

class CuestionarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cuestionarios = Cuestionario::all();
        return $cuestionarios;
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
        $cuestionario = new Cuestionario();
			$cuestionario->tema = $request->tema;
			$cuestionario->fecha = $request->fecha;
			$cuestionario->usuario_id = $request->usuario_id;
			
			$cuestionario->save();
        return $cuestionario;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $cuestionario= Cuestionario::with('preguntas')->findOrFail($request->id);
        return $cuestionario;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         $cuestionario = Cuestionario::findOrFail($request->id);
			$cuestionario->tema = $request->tema;
			$cuestionario->fecha = $request->fecha;
			$cuestionario->usuario_id = $request->usuario_id;
			
			$cuestionario->save();
        return $cuestionario;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $cuestionario = Cuestionario::destroy($request->id);
        return $cuestionario;
    }
}
