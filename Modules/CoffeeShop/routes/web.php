<?php

use Illuminate\Support\Facades\Route;
use Modules\CoffeeShop\Http\Controllers\CoffeeShopController;

Route::middleware(['auth', 'verified'])->group(function () {
    Route::resource('coffeeshops', CoffeeShopController::class)->names('coffeeshop');
});
