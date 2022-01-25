<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ActualizaAreaRequest extends FormRequest
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
      'area_id' => 'required',
      'curso_id' => 'required',
      'area_curso' => 'unique:curso_area,area_curso,' . $this->route('id')
    ];
  }

  public function messages() {
    return [
      'area_id.required' => 'debe haber un area',
      'curso_id.required' => 'debe haber un curso',
      'area_curso.unique' => 'No se puede añadir dos veces el área a un curso'
    ];
  }

}