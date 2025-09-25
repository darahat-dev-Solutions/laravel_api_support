<?php

use App\Modules\AiModule\Http\Controllers\AiModuleController;
use Illuminate\Support\Facades\Route;

Route::apiResource('ai-modules', AiModuleController::class);