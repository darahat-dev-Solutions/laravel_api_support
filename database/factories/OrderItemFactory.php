<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Modules\CoffeeShop\Models\OrderItem;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\Menu;

class OrderItemFactory extends Factory
{
    protected $model = OrderItem::class;

    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'item_id' => Menu::factory(),
            'quantity' => $this->faker->numberBetween(1, 3),
            'price' => $this->faker->randomFloat(2, 2, 10),
        ];
    }
}
