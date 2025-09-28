<?php

namespace Modules\CoffeeShop\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\CoffeeShop\Models\ItemRating;
use Modules\CoffeeShop\Models\MenuItem;
use App\Models\User;

class ItemRatingFactory extends Factory
{
    protected $model = ItemRating::class;

    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'item_id' => MenuItem::factory(),
            'rating' => $this->faker->numberBetween(1, 5),
            'review' => $this->faker->optional(0.7)->paragraph(),
        ];
    }

    /**
     * Create a five-star rating
     */
    public function fiveStars(): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => 5,
            'review' => $this->faker->sentence() . ' Excellent quality!',
        ]);
    }

    /**
     * Create a high rating (4-5 stars)
     */
    public function highRating(): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => $this->faker->numberBetween(4, 5),
        ]);
    }

    /**
     * Create a low rating (1-2 stars)
     */
    public function lowRating(): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => $this->faker->numberBetween(1, 2),
        ]);
    }

    /**
     * Create rating with review
     */
    public function withReview(): static
    {
        return $this->state(fn (array $attributes) => [
            'review' => $this->faker->paragraph(),
        ]);
    }

    /**
     * Create rating without review
     */
    public function withoutReview(): static
    {
        return $this->state(fn (array $attributes) => [
            'review' => null,
        ]);
    }
}
