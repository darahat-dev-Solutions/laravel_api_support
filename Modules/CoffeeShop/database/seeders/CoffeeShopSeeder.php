<?php

namespace Modules\CoffeeShop\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Modules\CoffeeShop\Models\Customer;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\OrderItem;
use Modules\CoffeeShop\Models\ItemRating;

class CoffeeShopSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->command->info('🏪 Seeding Coffee Shop data...');

        // Create additional users for ratings
        $users = User::factory(15)->create();
        $this->command->info('👥 Created 15 users');

        // Create customers (some might be users, some walk-ins)
        $customers = Customer::factory(25)->create();
        $this->command->info('🧑‍🤝‍🧑 Created 25 customers');

        // Create menu items
        $menuItems = MenuItem::factory(30)->create([
            'is_available' => true
        ]);

        // Create a few unavailable items
        MenuItem::factory(5)->create([
            'is_available' => false
        ]);

        $this->command->info('☕ Created 35 menu items (30 available, 5 unavailable)');

        // Create orders with realistic distribution
        $orders = collect();

        // Recent orders (last 30 days)
        $recentOrders = Order::factory(50)
            ->recycle($customers)
            ->create([
                'order_time' => fake()->dateTimeBetween('-30 days', 'now')
            ]);
        $orders = $orders->merge($recentOrders);

        // Older orders (last 3 months)
        $olderOrders = Order::factory(30)
            ->recycle($customers)
            ->create([
                'order_time' => fake()->dateTimeBetween('-90 days', '-31 days')
            ]);
        $orders = $orders->merge($olderOrders);

        $this->command->info('📋 Created 80 orders');

        // Create order items for each order
        $orderItems = collect();
        foreach ($orders as $order) {
            $itemCount = fake()->numberBetween(1, 5); // 1-5 items per order
            $orderOrderItems = OrderItem::factory($itemCount)
                ->recycle($menuItems)
                ->create([
                    'order_id' => $order->order_id
                ]);
            $orderItems = $orderItems->merge($orderOrderItems);
        }

        $this->command->info('🍽️ Created ' . $orderItems->count() . ' order items');

        // Update order totals based on order items
        foreach ($orders as $order) {
            $total = $order->orderItems()->sum(DB::raw('price * quantity'));
            $order->update(['total_price' => $total]);
        }

        $this->command->info('💰 Updated order totals');

        // Create ratings for menu items
        $ratings = collect();
        $allUsers = User::all();
        $availableItems = $menuItems->shuffle();

        // A few items with excellent ratings (all 5 stars) - take first 3
        $excellentItems = $availableItems->take(3);
        foreach ($excellentItems as $item) {
            $ratingUsers = $allUsers->random(fake()->numberBetween(8, 15));
            foreach ($ratingUsers as $user) {
                $excellentRatings = ItemRating::factory()
                    ->fiveStars()
                    ->create([
                        'user_id' => $user->id,
                        'item_id' => $item->item_id
                    ]);
                $ratings = $ratings->merge([$excellentRatings]);
            }
        }

        // High-rated popular items (70% of ratings are 4-5 stars) - skip excellent items
        $popularItems = $availableItems->skip(3)->take(15);
        foreach ($popularItems as $item) {
            $ratingUsers = $allUsers->random(fake()->numberBetween(5, 12));

            // High ratings (70%)
            $highRatingUsers = $ratingUsers->take(ceil($ratingUsers->count() * 0.7));
            foreach ($highRatingUsers as $user) {
                $highRatings = ItemRating::factory()
                    ->highRating()
                    ->create([
                        'user_id' => $user->id,
                        'item_id' => $item->item_id
                    ]);
                $ratings = $ratings->merge([$highRatings]);
            }

            // Mixed ratings (30%)
            $mixedRatingUsers = $ratingUsers->skip(ceil($ratingUsers->count() * 0.7));
            foreach ($mixedRatingUsers as $user) {
                $mixedRatings = ItemRating::factory()
                    ->create([
                        'user_id' => $user->id,
                        'item_id' => $item->item_id
                    ]);
                $ratings = $ratings->merge([$mixedRatings]);
            }
        }

        // Average items (mixed ratings) - skip already processed items
        $averageItems = $availableItems->skip(18)->take(8);
        foreach ($averageItems as $item) {
            $ratingUsers = $allUsers->random(fake()->numberBetween(2, 8));
            foreach ($ratingUsers as $user) {
                $itemRatings = ItemRating::factory()
                    ->create([
                        'user_id' => $user->id,
                        'item_id' => $item->item_id
                    ]);
                $ratings = $ratings->merge([$itemRatings]);
            }
        }        $this->command->info('⭐ Created ' . $ratings->count() . ' item ratings');

        // Summary
        $this->command->info('');
        $this->command->info('🎉 Coffee Shop seeding completed!');
        $this->command->info('📊 Summary:');
        $this->command->info('   - Users: ' . User::count());
        $this->command->info('   - Customers: ' . Customer::count());
        $this->command->info('   - Menu Items: ' . MenuItem::count());
        $this->command->info('   - Orders: ' . Order::count());
        $this->command->info('   - Order Items: ' . OrderItem::count());
        $this->command->info('   - Ratings: ' . ItemRating::count());

        // Display some statistics
        $avgRating = ItemRating::avg('rating');
        $topRatedItem = MenuItem::withAvg('ratings', 'rating')
            ->orderByDesc('ratings_avg_rating')
            ->first();

        $this->command->info('   - Average Rating: ' . number_format($avgRating, 2));
        if ($topRatedItem) {
            $this->command->info('   - Top Rated Item: ' . $topRatedItem->item_name . ' (' . number_format($topRatedItem->ratings_avg_rating, 1) . '⭐)');
        }
    }
}
