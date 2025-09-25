<?php

use Modules\AiModule\Http\Controllers\AiModuleController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::apiResource('ai-modules', AiModuleController::class);
});
