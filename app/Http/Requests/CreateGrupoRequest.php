<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateGrupoRequest extends FormRequest
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
      'curso_id' => 'required'
    ];
  }

  public function messages() {
    return [
      'nombre.required' => 'Debe ingresar un nombre para el grupo',
      'curso_id.required' => 'El grupo debe pertenecer a un curso',
    ];
  }
}