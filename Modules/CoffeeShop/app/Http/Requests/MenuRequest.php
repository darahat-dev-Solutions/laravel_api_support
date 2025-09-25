<?php

namespace Modules\CoffeeShop\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MenuRequest extends FormRequest
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
            'description' => 'sometimes|nullable|string|max:1000',
            'price' => 'sometimes|required|numeric|min:0|max:999.99',
            'image_url' => 'sometimes|nullable|url',
            'is_available' => 'sometimes|boolean',
        ];

        if ($this->isMethod('post')) {
            // Creating new menu item - required fields
            $rules['item_name'] = 'required|string|max:255';
            $rules['price'] = 'required|numeric|min:0|max:999.99';
            $rules['is_available'] = 'boolean';
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'item_name.required' => 'Item name is required.',
            'item_name.max' => 'Item name cannot be longer than 255 characters.',
            'description.max' => 'Description cannot be longer than 1000 characters.',
            'price.required' => 'Price is required.',
            'price.numeric' => 'Price must be a valid number.',
            'price.min' => 'Price cannot be negative.',
            'price.max' => 'Price cannot exceed $999.99.',
            'image_url.url' => 'Image URL must be a valid URL.',
            'is_available.boolean' => 'Availability must be true or false.',
        ];
    }

    /**
     * Get custom attribute names for validator errors.
     */
    public function attributes(): array
    {
        return [
            'item_name' => 'item name',
            'description' => 'description',
            'price' => 'price',
            'image_url' => 'image URL',
            'is_available' => 'availability status',
        ];
    }

    /**
     * Prepare the data for validation.
     */
    protected function prepareForValidation(): void
    {
        // Ensure price is formatted correctly
        if ($this->has('price')) {
            $this->merge([
                'price' => number_format((float)$this->price, 2, '.', '')
            ]);
        }

        // Convert string boolean to actual boolean
        if ($this->has('is_available')) {
            $this->merge([
                'is_available' => filter_var($this->is_available, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE) ?? true
            ]);
        }
    }
}
