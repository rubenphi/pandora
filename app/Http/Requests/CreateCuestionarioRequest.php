<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateCuestionarioRequest extends FormRequest
{
  /**
  * Determine if the user is authorized to make this request.
  *
  * @return bool
  */
  public function authorize() {
    return true;
  }

  /**
  * Get the validation rules that apply to the request.
  *
  * @return array
  */
  public function rules() {
    return [
      'nombre' => 'required',
      'fecha' => 'required',
      'usuario_id' => 'required',
      'curso_id' => 'required'
    ];
  }
  
    public function messages() {
    return [
      'nombre.required' => 'Debe ingresar un nombre',
      'fecha.required' => 'Debe ingresar una fecha',
      'usuario_id.required' => 'El cuestionario debe estar relacionado a un usuario',
      'curso_id.required' => 'El cuestionario debe estar asignado a un grupo'
    ];
  }
  
}