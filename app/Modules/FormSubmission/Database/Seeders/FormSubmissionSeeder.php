<?php

namespace App\Modules\FormSubmission\Database\Seeders;

use App\Modules\FormSubmission\Models\FormSubmission;
use Illuminate\Database\Seeder;

class FormSubmissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        FormSubmission::factory(10)->create();
    }
}
