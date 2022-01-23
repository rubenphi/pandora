<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateOpcionRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'enunciado' => 'required',
            'correcto' => 'required',
            'letra' => 'required',
            'pregunta_id' => 'required',
            'letraPregunta' => 'unique:opcions,letraPregunta'
    ];

    }
    
  public function messages() {
    return [
      'enunciado.required' => 'La opción debe tener contenido',
      'correcto.required' => 'Debe especificar si es la opción correcta o no',
      'letra.required' => 'Debe asignar una letra u otro identificador',
      'pregunta_id.required' => 'La opción debe estar asignada a una pregunta',
      'letraPregunta.unique' => 'Ya hay una opción de respuesta con esa letra o identificador' 
    ];
  }
}
