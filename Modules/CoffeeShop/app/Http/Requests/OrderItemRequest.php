<?php

namespace Modules\CoffeeShop\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderItemRequest extends FormRequest
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
            'order_id' => 'sometimes|required|exists:orders,order_id',
            'item_id' => 'sometimes|required|exists:menu,item_id',
            'quantity' => 'sometimes|required|integer|min:1|max:99',
            'price' => 'sometimes|required|numeric|min:0|max:999.99',
        ];

        if ($this->isMethod('post')) {
            // Creating new order item - all fields required
            $rules['order_id'] = 'required|exists:orders,order_id';
            $rules['item_id'] = 'required|exists:menu,item_id';
            $rules['quantity'] = 'required|integer|min:1|max:99';
            $rules['price'] = 'required|numeric|min:0|max:999.99';
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'order_id.required' => 'Order ID is required.',
            'order_id.exists' => 'Selected order does not exist.',
            'item_id.required' => 'Menu item is required.',
            'item_id.exists' => 'Selected menu item does not exist.',
            'quantity.required' => 'Quantity is required.',
            'quantity.integer' => 'Quantity must be a whole number.',
            'quantity.min' => 'Quantity must be at least 1.',
            'quantity.max' => 'Quantity cannot exceed 99 per item.',
            'price.required' => 'Item price is required.',
            'price.numeric' => 'Price must be a valid number.',
            'price.min' => 'Price cannot be negative.',
            'price.max' => 'Price cannot exceed $999.99.',
        ];
    }

    /**
     * Get custom attribute names for validator errors.
     */
    public function attributes(): array
    {
        return [
            'order_id' => 'order',
            'item_id' => 'menu item',
            'quantity' => 'quantity',
            'price' => 'price',
        ];
    }

    /**
     * Configure the validator instance.
     */
    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            // Check if menu item is available
            if ($this->has('item_id')) {
                $menuItem = \Modules\CoffeeShop\Models\Menu::find($this->item_id);
                if ($menuItem && !$menuItem->is_available) {
                    $validator->errors()->add(
                        'item_id',
                        "The menu item '{$menuItem->item_name}' is currently unavailable."
                    );
                }
            }

            // Check if order is still modifiable (not completed or cancelled)
            if ($this->has('order_id')) {
                $order = \Modules\CoffeeShop\Models\Order::find($this->order_id);
                if ($order && in_array($order->status, ['completed', 'cancelled'])) {
                    $validator->errors()->add(
                        'order_id',
                        "Cannot modify items for {$order->status} orders."
                    );
                }
            }

            // Validate price matches menu item price (if not explicitly provided)
            if ($this->has('item_id') && !$this->has('price')) {
                $menuItem = \Modules\CoffeeShop\Models\Menu::find($this->item_id);
                if ($menuItem) {
                    // Auto-set the price from menu item
                    $this->merge(['price' => $menuItem->price]);
                }
            }

            // Check for duplicate items in the same order
            if ($this->has('order_id') && $this->has('item_id') && $this->isMethod('post')) {
                $existingItem = \Modules\CoffeeShop\Models\OrderItem::where([
                    'order_id' => $this->order_id,
                    'item_id' => $this->item_id
                ])->first();

                if ($existingItem) {
                    $validator->errors()->add(
                        'item_id',
                        'This item is already in the order. Please update the existing item instead.'
                    );
                }
            }
        });
    }

    /**
     * Prepare the data for validation.
     */
    protected function prepareForValidation(): void
    {
        // If price is not provided, try to get it from the menu item
        if ($this->has('item_id') && !$this->has('price')) {
            $menuItem = \Modules\CoffeeShop\Models\Menu::find($this->item_id);
            if ($menuItem) {
                $this->merge(['price' => $menuItem->price]);
            }
        }

        // Ensure price is formatted correctly
        if ($this->has('price')) {
            $this->merge([
                'price' => number_format((float)$this->price, 2, '.', '')
            ]);
        }
    }
}
