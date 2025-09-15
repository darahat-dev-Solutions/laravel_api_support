<?php

use App\Modules\AiModule\Http\Controllers\AiModuleController;
use Illuminate\Support\Facades\Route;

Route::apiResource('ai-module', AiModuleController::class);
