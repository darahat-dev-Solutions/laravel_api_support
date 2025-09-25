<?php

namespace Modules\CoffeeShop\Database\Factories;

use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\Customer;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\Modules\CoffeeShop\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Order::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'customer_id' => Customer::factory(),
            'order_time' => $this->faker->dateTimeThisMonth(),
            'total_price' => 0, // Will be calculated after order items are added
            'status' => $this->faker->randomElement(['pending','preparing','ready','completed']),
        ];
    }
}
