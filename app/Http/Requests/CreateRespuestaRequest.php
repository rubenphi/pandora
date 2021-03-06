<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateRespuestaRequest extends FormRequest
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
      'opcion_id' => 'required',
      'pregunta_id' => 'required',
      'grupo_id' => 'required',
      'grupoPregunta' => 'unique'
    ];
  }
}