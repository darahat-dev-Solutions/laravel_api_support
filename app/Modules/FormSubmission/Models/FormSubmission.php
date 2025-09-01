<?php

namespace App\Modules\FormSubmission\Models;

use App\Modules\FormSubmission\Database\Factories\FormSubmissionFactory;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormSubmission extends Model
{
    use HasFactory, HasUuids;

    protected $fillable = [
        'formId',
        'submitterId',
        'responses',
        'submittedat',
    ];

    protected $casts = [
        'responses' => 'array',
        'submittedat' => 'datetime',
    ];

    /**
     * Create a new factory instance for the model.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    protected static function newFactory()
    {
        return FormSubmissionFactory::new();
    }
}