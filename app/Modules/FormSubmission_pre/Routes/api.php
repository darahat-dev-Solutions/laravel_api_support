<?php

use App\Modules\FormSubmission\Http\Controllers\FormSubmissionController;
use Illuminate\Support\Facades\Route;

Route::apiResource('form-submissions', FormSubmissionController::class);
