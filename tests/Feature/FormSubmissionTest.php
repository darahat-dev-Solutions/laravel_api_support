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
     * this function actually at first created 2 factory data
     * (or you may say it seeding 2 data)
     * because at for first time db table may not have any data
     * after that it is getting all data exist. its actually testing
     * the index function of formSubmission controller
     */

    public function test_it_can_list_all_form_submissions(){
        /// Arrange: Create 2 form submissions
        FormSubmission::factory()->count(2)->create();

        // Act: Make a Get request to the index endpoint
        $response = $this->getJson('/api/form-submissions');
        ///Assert Check for a 200 ok status and that we received 2 records
        $response->assertStatus(200)->assertJsonCount(2);
    }
    /**
     *  Test it can create a new form submission
     * Now we will test is form submission is
     * perfect or not.
     * @return void
     */
public function test_it_can_create_a_new_form_submission(){
    /// Arrange: Prepare the data for the new submission
    $data= [
        'form_id' => Str::uuid()->toString(),
        'submitter_id' => Str:: uuid()->toString(),
        'responses' => ['question1' => 'answer1']
    ];
}

}
