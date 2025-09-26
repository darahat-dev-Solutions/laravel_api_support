<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\CoffeeShop\Models\ItemRating;
use Modules\CoffeeShop\Models\Menu;
use App\Models\User;

class ItemRatingFactory extends Factory
{
    protected $model = ItemRating::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'item_id' => Menu::factory(),
            'rating' => $this->faker->numberBetween(1, 5),
            'review' => $this->faker->optional(0.7)->paragraph(2), // 70% chance of having a review
        ];
    }

    /**
     * Create a high rating (4-5 stars).
     */
    public function highRating(): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => $this->faker->numberBetween(4, 5),
            'review' => $this->faker->randomElement([
                'Excellent coffee! Really enjoyed it.',
                'Amazing taste and great service.',
                'Perfect blend, highly recommended!',
                'Outstanding quality, will definitely come back.',
                'Love this place! Great atmosphere too.',
            ]),
        ]);
    }

    /**
     * Create a low rating (1-2 stars).
     */
    public function lowRating(): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => $this->faker->numberBetween(1, 2),
            'review' => $this->faker->randomElement([
                'Not satisfied with the quality.',
                'Coffee was too bitter for my taste.',
                'Service was slow and coffee was cold.',
                'Expected better quality for the price.',
                'Disappointing experience overall.',
            ]),
        ]);
    }

    /**
     * Create a rating with detailed review.
     */
    public function withDetailedReview(): static
    {
        return $this->state(fn (array $attributes) => [
            'review' => $this->faker->paragraphs(3, true),
        ]);
    }

    /**
     * Create a rating without review.
     */
    public function withoutReview(): static
    {
        return $this->state(fn (array $attributes) => [
            'review' => null,
        ]);
    }

    /**
     * Create a 5-star rating.
     */
    public function fiveStars(): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => 5,
            'review' => $this->faker->randomElement([
                'Absolutely perfect! The best coffee I\'ve ever had.',
                'Outstanding in every way. Highly recommend!',
                'Exceptional quality and service. Five stars!',
                'Perfect coffee, perfect service, perfect atmosphere.',
                'This is my new favorite coffee place!',
            ]),
        ]);
    }
}