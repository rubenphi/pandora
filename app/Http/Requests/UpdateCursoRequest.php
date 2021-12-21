<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCursoRequest extends FormRequest
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
      'nombre' => 'unique:cursos,nombre,'. $this->route('id'),
    ];
  }

  public function messages() {
    return [
      'nombre.unique' => 'No puede haber dos cursos con el mismo nombre',
    ];
  }

}