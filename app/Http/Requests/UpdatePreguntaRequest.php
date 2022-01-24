<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePreguntaRequest extends FormRequest
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
      'titulo' => 'required',
      'enunciado' => 'required',
      'cuestionario_id' => 'required',
      'valor' => 'required',
      'visible' => 'required',
      'disponible' => 'required'
    ];
  }
}
