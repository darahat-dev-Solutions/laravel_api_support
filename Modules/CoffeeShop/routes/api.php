<?php

use Illuminate\Support\Facades\Route;
use Modules\CoffeeShop\Http\Controllers\CoffeeShopController;

Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    Route::apiResource('coffeeshops', CoffeeShopController::class)->names('coffeeshop');
});
