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
      'name' => 'required|alpha_dash|unique:users,name',
      'password' => 'required',
      'email' => 'unique:users,email'
    ];
  }

  public function messages() {
    return [
      'name.required' => 'Debes poner un nombre de usuario',
      'name.alpha_dash' => 'El nombre de usuario solo puede tener letras y números, sin espacios ni tildes',
      'name.unique' => 'El nombre de usuario ya fue tomado',
      'email.unique' => 'Ya existe un usuario registrado con ese correo',
      'password.required' => 'El usuario debe tener una contraseña'
    ];
  }
}