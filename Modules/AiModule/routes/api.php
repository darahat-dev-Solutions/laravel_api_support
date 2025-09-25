<?php

use Modules\AiModule\Http\Controllers\AiModuleController;
use Illuminate\Support\Facades\Route;

Route::apiResource('ai-modules', AiModuleController::class);
