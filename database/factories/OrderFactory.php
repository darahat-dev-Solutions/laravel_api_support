<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    public function definition(): array
    {
        return [
            'user_id' => \App\Models\User::factory(), // create user if not provided
            'order_time' => $this->faker->dateTimeThisMonth(),
            'total_price' => 0, // will update later after adding items
            'status' => $this->faker->randomElement(['pending','preparing','ready','completed']),
        ];
    }
}
