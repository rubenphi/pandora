<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GrupoController;
use App\Http\Controllers\CursoController;
use App\Http\Controllers\PreguntaController;
use App\Http\Controllers\CuestionarioController;
use App\Http\Controllers\OpcionController;
use App\Http\Controllers\RespuestaController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
  return $request->user();
});

Route::group(['middleware' => 'auth:api'], function() {

  Route::get('/grupos', [GrupoController::class, 'index']); //muestra todos los registros
  Route::get('/grupos/{id}', [GrupoController::class, 'show']); //muestra un los registro
  Route::post('/grupos', [GrupoController::class, 'store']); // crea un registro
  Route::put('/grupos/{id}', [GrupoController::class, 'update']); // actualiza un registro
  Route::delete('/grupos/{id}', [GrupoController::class, 'destroy']); //elimina un registro

  Route::get('/cursos', [CursoController::class, 'index']); //muestra todos los registros
  Route::get('/cursos/{id}', [CursoController::class, 'show']); //muestra un los registro
  Route::post('/cursos', [CursoController::class, 'store']); // crea un registro
  Route::put('/cursos/{id}', [CursoController::class, 'update']); // actualiza un registro
  Route::delete('/cursos/{id}', [CursoController::class, 'destroy']); //elimina un registro

  Route::get('/preguntas', [PreguntaController::class, 'index']); //muestra todos los registros
  Route::get('/preguntas/{id}', [PreguntaController::class, 'show']); //muestra un los registro
  Route::get('/preguntas/cuestionario/{id}', [PreguntaController::class, 'preguntasByCuestionario']); //muestra un los registro
  Route::post('/preguntas', [PreguntaController::class, 'store']); // crea un registro
  Route::put('/preguntas/{id}', [PreguntaController::class, 'update']); // actualiza un registro
  Route::delete('/preguntas/{id}', [PreguntaController::class, 'destroy']); //elimina un registro

  Route::get('/cuestionarios', [CuestionarioController::class, 'index']); //muestra todos los registros
  Route::get('/cuestionarios/{id}', [CuestionarioController::class, 'show']); //muestra un los registro
  Route::get('/cuestionarios/curso/{id}', [CuestionarioController::class, 'cuestionariosByCurso']); //muestra un los registro
  Route::post('/cuestionarios', [CuestionarioController::class, 'store']); // crea un registro
  Route::put('/cuestionarios/{id}', [CuestionarioController::class, 'update']); // actualiza un registro
  Route::delete('/cuestionarios/{id}', [CuestionarioController::class, 'destroy']); //elimina un registro

  Route::get('/opciones', [OpcionController::class, 'index']); //muestra todos los registros
  Route::get('/opciones/{id}', [OpcionController::class, 'show']); //muestra un los registro
  Route::get('/opciones/pregunta/{id}', [OpcionController::class, 'opcionesByPregunta']); //muestra un los registro
  Route::post('/opciones', [OpcionController::class, 'store']); // crea un registro
  Route::put('/opciones/{id}', [OpcionController::class, 'update']); // actualiza un registro
  Route::delete('/opciones/{id}', [OpcionController::class, 'destroy']); //elimina un registro

  Route::get('/respuestas', [RespuestaController::class, 'index']); //elimina un registro
  Route::get('/respuestas/cuestionario/{id}', [RespuestaController::class, 'respuestasByCuestionario']); //elimina un registro
  Route::get('/respuestas/resultado/{id}', [RespuestaController::class, 'respuestasByCuestionarioSum']); //elimina un registro
  Route::get('/respuestas/pregunta/{id}', [RespuestaController::class, 'respuestasByPregunta']); //elimina un registro
  Route::get('/respuestas/{id}', [RespuestaController::class, 'show']); //elimina un registro
  Route::post('/respuestas', [RespuestaController::class, 'store']); //elimina un registro
  Route::put('/respuestas/{id}', [RespuestaController::class, 'update']); //elimina un registro
  Route::delete('/respuestas/{id}', [RespuestaController::class, 'destroy']); //elimina un registro



});