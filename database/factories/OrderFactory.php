<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\Customer;

class OrderFactory extends Factory
{
    protected $model = Order::class;

    public function definition(): array
    {
        return [
            'customer_id' => Customer::factory(),
            'order_time' => $this->faker->dateTimeThisMonth(),
            'total_price' => 0, // will update later after adding items
            'status' => $this->faker->randomElement(['pending','preparing','ready','completed']),
        ];
    }

    /**
     * Create a pending order.
     */
    public function pending(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'pending',
            'order_time' => now(),
        ]);
    }

    /**
     * Create a completed order.
     */
    public function completed(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'completed',
            'order_time' => $this->faker->dateTimeBetween('-30 days', '-1 hour'),
        ]);
    }

    /**
     * Create a recent order.
     */
    public function recent(): static
    {
        return $this->state(fn (array $attributes) => [
            'order_time' => $this->faker->dateTimeBetween('-7 days', 'now'),
        ]);
    }

    /**
     * Create an order with specific customer.
     */
    public function forCustomer($customer): static
    {
        return $this->state(fn (array $attributes) => [
            'customer_id' => $customer->customers_id ?? $customer,
        ]);
    }
}