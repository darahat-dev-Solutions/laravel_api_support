<?php

use Modules\CoffeeShop\Http\Controllers\CoffeeShopController;
use Modules\CoffeeShop\Http\Controllers\CustomerController;
use Modules\CoffeeShop\Http\Controllers\MenuItemController;
use Modules\CoffeeShop\Http\Controllers\OrderController;
use Illuminate\Support\Facades\Route;

// Dashboard and statistics
Route::get('coffee-shop/dashboard', [CoffeeShopController::class, 'dashboard']);
Route::get('coffee-shop/recent-orders', [CoffeeShopController::class, 'recentOrders']);
Route::get('coffee-shop/popular-items', [CoffeeShopController::class, 'popularItems']);

// Customer routes
Route::apiResource('customers', CustomerController::class)->parameters([
    'customers' => 'customer:customer_id'
]);

// Menu Item routes
Route::apiResource('menu-items', MenuItemController::class)->parameters([
    'menu-items' => 'menuItem:item_id'
]);
Route::get('menu-items-available', [MenuItemController::class, 'available']);

// Order routes
Route::apiResource('orders', OrderController::class)->parameters([
    'orders' => 'order:order_id'
]);
Route::get('orders/status/{status}', [OrderController::class, 'byStatus']);
Route::get('orders/customer/{customerId}', [OrderController::class, 'byCustomer']);
