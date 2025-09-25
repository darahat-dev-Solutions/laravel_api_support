<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\CoffeeShop\Models\Menu;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\Modules\CoffeeShop\Models\Menu>
 */
class MenuFactory extends Factory
{
    protected $model = Menu::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'item_name' => $this->faker->randomElement([
                'Espresso', 'Cappuccino', 'Latte', 'Americano', 'Mocha',
                'Macchiato', 'Frappuccino', 'Cold Brew', 'Turkish Coffee',
                'Croissant', 'Muffin', 'Sandwich', 'Bagel', 'Cake'
            ]),
            'description' => $this->faker->sentence(10),
            'price' => $this->faker->randomFloat(2, 2, 15),
            'image_url' => $this->faker->imageUrl(300, 300, 'food'),
            'is_available' => $this->faker->boolean(90), // 90% chance of being available
        ];
    }
}
