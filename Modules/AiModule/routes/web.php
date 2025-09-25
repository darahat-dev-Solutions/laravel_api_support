<?php

use Illuminate\Support\Facades\Route;
use Modules\AiModule\Http\Controllers\AiModuleController;

Route::middleware(['auth', 'verified'])->group(function () {
    Route::resource('aimodules', AiModuleController::class)->names('aimodule');
});
