<?php

namespace Modules\CoffeeShop\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MenuItemRequest extends FormRequest
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
            'item_name' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|nullable|string',
            'price' => 'sometimes|required|numeric|min:0',
            'image_url' => 'sometimes|nullable|url',
            'is_available' => 'sometimes|boolean',
        ];

        if ($this->isMethod('post')) {
            $rules['item_name'] = 'required|string|max:255';
            $rules['price'] = 'required|numeric|min:0';
        }

        return $rules;
    }
}
