<?php

require_once __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';

use Modules\CoffeeShop\Models\Customer;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\OrderItem;

// Seed Customers
echo "Seeding customers...\n";
$customers = [
    ['name' => 'John Doe', 'email' => 'john@example.com', 'phone' => '1234567890'],
    ['name' => 'Jane Smith', 'email' => 'jane@example.com', 'phone' => '0987654321'],
    ['name' => 'Bob Johnson', 'email' => 'bob@example.com', 'phone' => '1122334455'],
];

foreach ($customers as $customerData) {
    Customer::create($customerData);
}

// Seed Menu Items
echo "Seeding menu items...\n";
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
];

foreach ($menuItems as $item) {
    MenuItem::create($item);
}

// Seed Orders
echo "Seeding orders...\n";
$customer1 = Customer::first();
$customer2 = Customer::where('email', 'jane@example.com')->first();

$orders = [
    [
        'customer_id' => $customer1->customer_id,
        'total_amount' => 7.00,
        'order_status' => 'completed',
        'order_date' => now(),
    ],
    [
        'customer_id' => $customer2->customer_id,
        'total_amount' => 9.00,
        'order_status' => 'pending',
        'order_date' => now(),
    ],
];

foreach ($orders as $orderData) {
    Order::create($orderData);
}

// Seed Order Items
echo "Seeding order items...\n";
$order1 = Order::first();
$order2 = Order::skip(1)->first();
$espresso = MenuItem::where('item_name', 'Espresso')->first();
$latte = MenuItem::where('item_name', 'Latte')->first();

$orderItems = [
    [
        'order_id' => $order1->order_id,
        'item_id' => $espresso->item_id,
        'quantity' => 2,
        'unit_price' => 2.50,
        'total_price' => 5.00,
    ],
    [
        'order_id' => $order1->order_id,
        'item_id' => $latte->item_id,
        'quantity' => 1,
        'unit_price' => 4.50,
        'total_price' => 4.50,
    ],
    [
        'order_id' => $order2->order_id,
        'item_id' => $latte->item_id,
        'quantity' => 2,
        'unit_price' => 4.50,
        'total_price' => 9.00,
    ],
];

foreach ($orderItems as $item) {
    OrderItem::create($item);
}

echo "CoffeeShop database seeded successfully!\n";
