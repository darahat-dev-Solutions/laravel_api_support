<?php

use Modules\CoffeeShop\Http\Controllers\CoffeeShopController;
use Modules\CoffeeShop\Http\Controllers\CustomerController;
use Modules\CoffeeShop\Http\Controllers\MenuItemController;
use Modules\CoffeeShop\Http\Controllers\OrderController;
use Illuminate\Support\Facades\Route;


// Simple test route
Route::get('test', function () {
    return response()->json([
        'success' => true,
        'message' => 'CoffeeShop module API is working!',
        'timestamp' => now()
    ]);
});

// Dashboard and statistics
Route::get('coffee-shop/dashboard', [CoffeeShopController::class, 'dashboard']);
Route::get('coffee-shop/recent-orders', [CoffeeShopController::class, 'recentOrders']);
Route::get('coffee-shop/popular-items', [CoffeeShopController::class, 'popularItems']);

// Customer routes
Route::apiResource('coffee-shop/customers', CustomerController::class)->parameters([
    'customers' => 'customer:customer_id'
]);

// Menu Item routes
Route::apiResource('coffee-shop/menu-items', MenuItemController::class)->parameters([
    'menu-items' => 'menuItem:item_id'
]);
Route::get('coffee-shop/menu-items-available', [MenuItemController::class, 'available']);

// Order routes
Route::apiResource('coffee-shop/orders', OrderController::class)->parameters([
    'orders' => 'order:order_id'
]);
Route::get('coffee-shop/orders/status/{status}', [OrderController::class, 'byStatus']);
Route::get('coffee-shop/orders/customer/{customerId}', [OrderController::class, 'byCustomer']);
