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
      'tema' => 'required',
      'fecha' => 'required',
      'curso_id' => 'required'
    ];
  }
  
    public function messages() {
    return [
      'tema.required' => 'Debe ingresar un tema',
      'fecha.required' => 'Debe ingresar una fecha',
      'curso_id.required' => 'El cuestionario debe estar asignado a un grupo'
    ];
  }
  
}