<?php

namespace Modules\CoffeeShop\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRequest extends FormRequest
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
            'customer_id' => 'sometimes|required|exists:customers,customer_id',
            'order_time' => 'sometimes|nullable|date',
            'status' => 'sometimes|in:pending,preparing,ready,completed,cancelled',
            'items' => 'sometimes|required|array|min:1',
            'items.*.item_id' => 'required|exists:menu_items,item_id',
            'items.*.quantity' => 'required|integer|min:1',
        ];

        if ($this->isMethod('post')) {
            $rules['customer_id'] = 'required|exists:customers,customer_id';
            $rules['items'] = 'required|array|min:1';
        }

        return $rules;
    }
}
