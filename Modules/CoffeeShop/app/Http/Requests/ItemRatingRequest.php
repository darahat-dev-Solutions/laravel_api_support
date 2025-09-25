<?php

namespace Modules\CoffeeShop\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class ItemRatingRequest extends FormRequest
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
            'user_id' => 'sometimes|required|exists:users,id',
            'menu_item_id' => 'sometimes|required|exists:menu,item_id',
            'rating' => 'sometimes|required|integer|between:1,5',
            'review' => 'sometimes|nullable|string|max:1000',
        ];

        if ($this->isMethod('post')) {
            // Creating new rating - required fields
            $rules['user_id'] = 'required|exists:users,id';
            $rules['menu_item_id'] = 'required|exists:menu,item_id';
            $rules['rating'] = 'required|integer|between:1,5';
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'user_id.required' => 'User is required for the rating.',
            'user_id.exists' => 'Selected user does not exist.',
            'menu_item_id.required' => 'Menu item is required for the rating.',
            'menu_item_id.exists' => 'Selected menu item does not exist.',
            'rating.required' => 'Rating is required.',
            'rating.integer' => 'Rating must be a whole number.',
            'rating.between' => 'Rating must be between 1 and 5 stars.',
            'review.max' => 'Review cannot be longer than 1000 characters.',
        ];
    }

    /**
     * Get custom attribute names for validator errors.
     */
    public function attributes(): array
    {
        return [
            'user_id' => 'user',
            'menu_item_id' => 'menu item',
            'rating' => 'rating',
            'review' => 'review',
        ];
    }

    /**
     * Configure the validator instance.
     */
    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            // Check for duplicate rating (user can only rate an item once)
            if ($this->isMethod('post') && $this->has('user_id') && $this->has('menu_item_id')) {
                $existingRating = \Modules\CoffeeShop\Models\ItemRating::where([
                    'user_id' => $this->user_id,
                    'menu_item_id' => $this->menu_item_id
                ])->first();

                if ($existingRating) {
                    $validator->errors()->add(
                        'menu_item_id',
                        'You have already rated this item. Please update your existing rating instead.'
                    );
                }
            }

            // For updates, ensure the user is updating their own rating
            if ($this->isMethod('put') || $this->isMethod('patch')) {
                $ratingId = $this->route('rating') ?? $this->route('itemrating');
                if ($ratingId) {
                    $rating = \Modules\CoffeeShop\Models\ItemRating::find($ratingId);
                    if ($rating && $this->has('user_id') && $rating->user_id != $this->user_id) {
                        $validator->errors()->add(
                            'user_id',
                            'You can only update your own ratings.'
                        );
                    }
                }
            }

            // Validate that menu item exists and get its name for better error messages
            if ($this->has('menu_item_id')) {
                $menuItem = \Modules\CoffeeShop\Models\Menu::find($this->menu_item_id);
                if (!$menuItem) {
                    $validator->errors()->add(
                        'menu_item_id',
                        'The selected menu item does not exist.'
                    );
                } else {
                    // Store menu item name for use in success messages
                    $this->merge(['_menu_item_name' => $menuItem->item_name]);
                }
            }
        });
    }

    /**
     * Prepare the data for validation.
     */
    protected function prepareForValidation(): void
    {
        // Auto-set user_id from authenticated user if not provided
        if (!$this->has('user_id') && Auth::check()) {
            $this->merge(['user_id' => Auth::id()]);
        }

        // Clean up review text
        if ($this->has('review') && $this->review) {
            $this->merge([
                'review' => trim($this->review)
            ]);

            // If review becomes empty after trimming, set to null
            if (empty($this->review)) {
                $this->merge(['review' => null]);
            }
        }

        // Ensure rating is an integer
        if ($this->has('rating')) {
            $this->merge([
                'rating' => (int) $this->rating
            ]);
        }
    }

    /**
     * Get validated data with additional computed fields.
     */
    public function validated($key = null, $default = null): array
    {
        $validated = parent::validated($key, $default);

        // Remove internal fields from validated data
        unset($validated['_menu_item_name']);

        return $validated;
    }
}
