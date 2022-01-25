<?php

namespace App\Http\Controllers;
use App\Models\Area;
use App\Http\Requests\CreateAreaRequest;
use App\Http\Requests\UpdateAreaRequest;
use Illuminate\Http\Request;
use App\Http\Traits\Traits;

class AreaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        if (Traits::superadmin()) {
          $areas = Area::all();
          return $Areas;
        } else {
          return Traits::error('Solo un administrador puede ver todos los cursos', 400);
        }
    
    
      }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateAreaRequest $request) {
        if (Traits::superadmin()) {
          $area = new Area();
          $area->nombre = $request->nombre;
          $area->existe = $request->existe;
          $area->save();
          return response()->json([
            'res' => true,
            'message' => 'Registro creado correctamente'
          ], 200);
        } else {
          return Traits::error('Solo el administrador puede crear areas', 400);
        }
    
    
      }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request) {
        if (Traits::superadmin()) {
          $area = Area::with('cursos')->findOrFail($request->id);
          return $areas;
        } else {
          return Traits::error('Acceso denegado, no es administrador ', 400);
        }
    
    
      }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAreaRequest $request) {
        if (Traits::superadmin()) {
          $area = Area::findOrFail($request->id);
          $area->nombre = $request->nombre;
          $area->existe = $request->existe;
          $area->save();
    
          return response()->json([
            'res' => true,
            'message' => 'Registro actualizado correctamente'
          ], 200);
        } else {
          return Traits::error('Solo el administrador puede modificar cursos', 400);
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
    
          $area = Area::destroy($request->id);
          return response()->json([
            'res' => true,
            'message' => 'Registro eliminado correctamente'
          ], 200);
        } else {
          return Traits::error('Solo el administrador puede eliminar areas', 400);
        }
    
    
      }
}
