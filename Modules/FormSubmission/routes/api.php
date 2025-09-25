<?php

use Modules\FormSubmission\Http\Controllers\FormSubmissionController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::apiResource('form-submissions', FormSubmissionController::class);
});