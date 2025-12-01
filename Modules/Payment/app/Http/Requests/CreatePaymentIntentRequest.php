<?php

namespace Modules\Payment\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreatePaymentIntentRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'amount' => 'required|integer|min:50', // Minimum 50 cents or equivalent
            'currency' => 'required|string|size:3|in:' . implode(',', config('payment.supported_currencies', ['usd'])),
            'description' => 'nullable|string|max:500',
            'metadata' => 'nullable|array',
            'metadata.*' => 'string|max:500',
        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'amount.required' => 'The payment amount is required.',
            'amount.integer' => 'The payment amount must be an integer.',
            'amount.min' => 'The payment amount must be at least 50 cents.',
            'currency.required' => 'The currency is required.',
            'currency.size' => 'The currency must be exactly 3 characters.',
            'currency.in' => 'The selected currency is not supported.',
        ];
    }
}
