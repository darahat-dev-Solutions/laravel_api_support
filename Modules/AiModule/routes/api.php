<?php

use Illuminate\Support\Facades\Route;
use Modules\AiModule\Http\Controllers\AiModuleController;

Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    Route::apiResource('aimodules', AiModuleController::class)->names('aimodule');
});
