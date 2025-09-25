<?php

namespace Modules\CoffeeShop\Database\Factories;

use Modules\CoffeeShop\Models\MenuItem;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\Modules\CoffeeShop\Models\MenuItem>
 */
class MenuItemFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = MenuItem::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'item_name' => $this->faker->randomElement(['Espresso', 'Latte', 'Cappuccino', 'Mocha', 'Americano', 'Macchiato', 'Frappuccino', 'Cold Brew']),
            'description' => $this->faker->sentence(),
            'price' => $this->faker->randomFloat(2, 2, 10), // $2 - $10
            'image_url' => $this->faker->imageUrl(200, 200, 'coffee', true),
            'is_available' => $this->faker->boolean(90),
        ];
    }
}
