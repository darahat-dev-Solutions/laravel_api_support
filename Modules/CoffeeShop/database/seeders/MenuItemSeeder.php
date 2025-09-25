<?php

namespace Modules\CoffeeShop\Database\Seeders;

use Modules\CoffeeShop\Models\MenuItem;
use Illuminate\Database\Seeder;

class MenuItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create predefined menu items
        $menuItems = [
            [
                'item_name' => 'Espresso',
                'description' => 'Strong black coffee made by forcing steam through ground coffee beans',
                'price' => 2.50,
                'image_url' => 'https://example.com/images/espresso.jpg',
                'is_available' => true,
            ],
            [
                'item_name' => 'Latte',
                'description' => 'Coffee drink made with espresso and steamed milk',
                'price' => 4.50,
                'image_url' => 'https://example.com/images/latte.jpg',
                'is_available' => true,
            ],
            [
                'item_name' => 'Cappuccino',
                'description' => 'Espresso-based coffee drink with steamed milk foam',
                'price' => 4.00,
                'image_url' => 'https://example.com/images/cappuccino.jpg',
                'is_available' => true,
            ],
            [
                'item_name' => 'Mocha',
                'description' => 'Chocolate-flavored coffee drink with espresso and steamed milk',
                'price' => 5.00,
                'image_url' => 'https://example.com/images/mocha.jpg',
                'is_available' => true,
            ],
            [
                'item_name' => 'Americano',
                'description' => 'Espresso shots mixed with hot water',
                'price' => 3.00,
                'image_url' => 'https://example.com/images/americano.jpg',
                'is_available' => true,
            ],
        ];

        foreach ($menuItems as $item) {
            MenuItem::create($item);
        }

        // Create additional random menu items
        MenuItem::factory(10)->create();
    }
}
