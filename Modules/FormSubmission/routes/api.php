<?php

use Modules\FormSubmission\Http\Controllers\FormSubmissionController;
use Illuminate\Support\Facades\Route;

Route::apiResource('form-submissions', FormSubmissionController::class);
