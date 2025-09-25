<?php

use Illuminate\Support\Facades\Route;
use Modules\FormSubmission\Http\Controllers\FormSubmissionController;

Route::middleware(['auth', 'verified'])->group(function () {
    Route::resource('formsubmissions', FormSubmissionController::class)->names('formsubmission');
});
