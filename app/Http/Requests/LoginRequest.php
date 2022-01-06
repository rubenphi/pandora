<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
      'code' => 'required',
      'password' => 'required'

    ];
  }
  
  public function messages() {
    return [
      'code.required' => 'Debe ingresar su codigo de usuario',
      'password.required' => 'Debe ingresar la contraeña'
    ];
  }
}
