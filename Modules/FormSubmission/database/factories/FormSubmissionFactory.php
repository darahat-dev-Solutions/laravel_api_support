<?php

namespace Modules\FormSubmission\Database\Factories;

use Modules\FormSubmission\Models\FormSubmission;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\Modules\FormSubmission\Models\FormSubmission>
 */
class FormSubmissionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = FormSubmission::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'form_id' => Str::uuid(),
            'submitter_id' => Str::uuid(),
            'responses' => ['question1' => 'answer1', 'question2' => 'answer2'],
            'submitted_at' => now(),
        ];
    }
}
