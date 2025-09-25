<?php

namespace Modules\AiModule\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AiModuleRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            'name' => 'sometimes|required|string',
            'description' => 'sometimes|required|string',
            'prompt' => 'sometimes|required|string',
        ];

        if($this->isMethod('post')){
            $rules['name'] = 'required|string';
            $rules['description'] = 'required|string';
            $rules['prompt'] = 'required|string';
        }

        return $rules;
    }
}
