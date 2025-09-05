<?php
namespace Test\Feature;

use App\Modules\FormSubmission\Models\FormSubmission;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;
use Tests\TestCase;

class FormSubmissionTest extends TestCase{

    use RefreshDatabase;

    /**
     * Test it can list all form submissions.
     * @return void
     */

    public function test_it_can_list_all_form_submissions(){
        /// Arrange: Create 2 form submissions
        FormSubmission::factory()->count(2)->create();

        // Act: Make a Get request to the index endpoint
        $response = $this->getJson('/api/form-submissions');
        ///Assert Check for a 200 ok status and that we received 2 records
        $response->assertStatus(200)->assertJsonCount(2);
    }
}
