<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class OrderItemFactory extends Factory
{
    public function definition(): array
    {
        return [
            'order_id' => \App\Models\Order::factory(),
            'item_id' => \App\Models\Menu::factory(),
            'quantity' => $this->faker->numberBetween(1, 3),
            'price' => $this->faker->randomFloat(2, 2, 10),
        ];
    }
}
