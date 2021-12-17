<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GrupoController;
use App\Http\Controllers\PreguntaController;
use App\Http\Controllers\CuestionarioController;
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


Route::get('/grupos', [GrupoController::class,'index']); //muestra todos los registros
Route::get('/grupos/{id}', [GrupoController::class,'show']); //muestra un los registro
Route::post('/grupos', [GrupoController::class,'store']); // crea un registro
Route::put('/grupos/{id}', [GrupoController::class,'update']); // actualiza un registro
Route::delete('/grupos/{id}', [GrupoController::class,'destroy']); //elimina un registro

Route::get('/preguntas', [PreguntaController::class,'index']); //muestra todos los registros
Route::get('/preguntas/{id}', [PreguntaController::class,'show']); //muestra un los registro
Route::post('/preguntas', [PreguntaController::class,'store']); // crea un registro
Route::put('/preguntas/{id}', [PreguntaController::class,'update']); // actualiza un registro
Route::delete('/preguntas/{id}', [PreguntaController::class,'destroy']); //elimina un registro

Route::get('/cuestionarios', [CuestionarioController::class,'index']); //muestra todos los registros
Route::get('/cuestionarios/{id}', [CuestionarioController::class,'show']); //muestra un los registro
Route::post('/cuestionarios', [CuestionarioController::class,'store']); // crea un registro
Route::put('/cuestionarios/{id}', [CuestionarioController::class,'update']); // actualiza un registro
Route::delete('/cuestionarios/{id}', [CuestionarioController::class,'destroy']); //elimina un registro



