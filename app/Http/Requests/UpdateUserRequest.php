<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
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
      'name' => 'required',
      'password' => 'required',
      'email' => 'unique:users,email,' . $this->route('id'),
      'code' => 'required|unique:users,code,' . $this->route('id')
    ];
  }

  public function messages() {
    return [
      'name.required' => 'Debes poner un nombre de usuario',
      'code.unique' => 'El codigo de usuario ya fue tomado',
      'email.unique' => 'Ya existe un usuario registrado con ese correo',
      'password.required' => 'El usuario debe tener una contraseña'
    ];
  }
}