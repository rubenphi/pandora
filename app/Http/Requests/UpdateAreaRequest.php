<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAreaRequest extends FormRequest
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
    public function rules() {
        return [
            'nombre' => 'required|unique:areas,nombre,'. $this->route('id'),
        ];
      }
    
      public function messages() {
        return [
          'nombre.unique' => 'No puede haber dos areas con el mismo nombre',
          'nombre.required' => 'El curso debe tener un nombre que la identifique'
        ];
      }
}
