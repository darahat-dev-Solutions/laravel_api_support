<?php

use Illuminate\Support\Facades\Route;
use Modules\FormSubmission\Http\Controllers\FormSubmissionController;

Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    Route::apiResource('formsubmissions', FormSubmissionController::class)->names('formsubmission');
});
