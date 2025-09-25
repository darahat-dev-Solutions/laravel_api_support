<?php

namespace Modules\CoffeeShop\Database\Seeders;

use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\OrderItem;
use Modules\CoffeeShop\Models\Customer;
use Modules\CoffeeShop\Models\MenuItem;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $customers = Customer::all();
        $menuItems = MenuItem::all();

        // Create 50 orders with order items
        for ($i = 0; $i < 50; $i++) {
            $order = Order::create([
                'customer_id' => $customers->random()->customer_id,
                'order_time' => fake()->dateTimeThisMonth(),
                'status' => fake()->randomElement(['pending','preparing','ready','completed']),
                'total_price' => 0,
            ]);

            // Add 1-5 items to each order
            $itemCount = fake()->numberBetween(1, 5);
            $totalPrice = 0;

            for ($j = 0; $j < $itemCount; $j++) {
                $menuItem = $menuItems->random();
                $quantity = fake()->numberBetween(1, 3);
                $unitPrice = $menuItem->price;
                $itemTotal = $quantity * $unitPrice;

                OrderItem::create([
                    'order_id' => $order->order_id,
                    'item_id' => $menuItem->item_id,
                    'quantity' => $quantity,
                    'unit_price' => $unitPrice,
                    'total_price' => $itemTotal,
                ]);

                $totalPrice += $itemTotal;
            }

            // Update order total
            $order->update(['total_price' => $totalPrice]);
        }
    }
}
