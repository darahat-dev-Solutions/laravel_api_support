<?php

namespace Modules\CoffeeShop\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CustomerRequest extends FormRequest
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
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|nullable|email|max:255',
            'phone' => 'sometimes|nullable|string|max:20',
            'img_url' => 'sometimes|nullable|url|max:220',
        ];

        if ($this->isMethod('post')) {
            // Creating new customer - name is required
            $rules['name'] = 'required|string|max:255';

            // Email should be unique when creating
            if ($this->filled('email')) {
                $rules['email'] = 'nullable|email|max:255|unique:customers,email';
            }
        }

        if ($this->isMethod('put') || $this->isMethod('patch')) {
            // Updating customer - email should be unique except for current customer
            $customerId = $this->route('customer') ?? $this->route('coffeeshop');
            if ($this->filled('email')) {
                $rules['email'] = 'nullable|email|max:255|unique:customers,email,' . $customerId . ',customers_id';
            }
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'name.required' => 'Customer name is required.',
            'name.max' => 'Customer name cannot be longer than 255 characters.',
            'email.email' => 'Please provide a valid email address.',
            'email.unique' => 'This email address is already registered.',
            'email.max' => 'Email address cannot be longer than 255 characters.',
            'phone.max' => 'Phone number cannot be longer than 20 characters.',
            'img_url.url' => 'Image URL must be a valid URL.',
            'img_url.max' => 'Image URL cannot be longer than 220 characters.',
        ];
    }

    /**
     * Get custom attribute names for validator errors.
     */
    public function attributes(): array
    {
        return [
            'name' => 'customer name',
            'email' => 'email address',
            'phone' => 'phone number',
            'img_url' => 'profile image',
        ];
    }
}
