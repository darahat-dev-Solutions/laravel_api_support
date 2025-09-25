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
            'customer_id' => 'sometimes|required|exists:customers,customers_id',
            'order_time' => 'sometimes|date',
            'total_price' => 'sometimes|nullable|numeric|min:0',
            'status' => 'sometimes|in:pending,preparing,ready,completed,cancelled',

            // Order items (for creating order with items)
            'items' => 'sometimes|array|min:1',
            'items.*.item_id' => 'required_with:items|exists:menu,item_id',
            'items.*.quantity' => 'required_with:items|integer|min:1|max:99',
            'items.*.price' => 'sometimes|numeric|min:0',
        ];

        if ($this->isMethod('post')) {
            // Creating new order - customer_id is required
            $rules['customer_id'] = 'required|exists:customers,customers_id';
            $rules['items'] = 'required|array|min:1';
        }

        if ($this->isMethod('put') || $this->isMethod('patch')) {
            // Updating order - validate status transitions
            $rules['status'] = 'sometimes|in:pending,preparing,ready,completed,cancelled|' .
                               'different:' . $this->getCurrentStatus();
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'customer_id.required' => 'Customer is required for the order.',
            'customer_id.exists' => 'Selected customer does not exist.',
            'order_time.date' => 'Order time must be a valid date.',
            'total_price.numeric' => 'Total price must be a valid number.',
            'total_price.min' => 'Total price cannot be negative.',
            'status.in' => 'Order status must be: pending, preparing, ready, completed, or cancelled.',
            'status.different' => 'New status must be different from current status.',

            'items.required' => 'At least one item is required for the order.',
            'items.array' => 'Items must be provided as an array.',
            'items.min' => 'Order must contain at least one item.',
            'items.*.item_id.required_with' => 'Item ID is required for each order item.',
            'items.*.item_id.exists' => 'Selected menu item does not exist.',
            'items.*.quantity.required_with' => 'Quantity is required for each order item.',
            'items.*.quantity.integer' => 'Quantity must be a whole number.',
            'items.*.quantity.min' => 'Quantity must be at least 1.',
            'items.*.quantity.max' => 'Quantity cannot exceed 99 per item.',
            'items.*.price.numeric' => 'Item price must be a valid number.',
            'items.*.price.min' => 'Item price cannot be negative.',
        ];
    }

    /**
     * Get custom attribute names for validator errors.
     */
    public function attributes(): array
    {
        return [
            'customer_id' => 'customer',
            'order_time' => 'order time',
            'total_price' => 'total price',
            'status' => 'order status',
            'items' => 'order items',
            'items.*.item_id' => 'menu item',
            'items.*.quantity' => 'quantity',
            'items.*.price' => 'item price',
        ];
    }

    /**
     * Configure the validator instance.
     */
    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            // Validate menu items are available when creating orders
            if ($this->isMethod('post') && $this->has('items')) {
                foreach ($this->items as $index => $item) {
                    $menuItem = \Modules\CoffeeShop\Models\Menu::find($item['item_id']);
                    if ($menuItem && !$menuItem->is_available) {
                        $validator->errors()->add(
                            "items.{$index}.item_id",
                            "The selected menu item '{$menuItem->item_name}' is currently unavailable."
                        );
                    }
                }
            }
        });
    }

    /**
     * Get the current order status (for update validation).
     */
    private function getCurrentStatus(): string
    {
        $order = $this->route('order') ?? $this->route('coffeeshop');
        if ($order && is_object($order)) {
            return $order->status ?? '';
        }
        return '';
    }
}
