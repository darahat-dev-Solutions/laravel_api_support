<?php
namespace Test\Feature;

use Modules\FormSubmission\Models\FormSubmission;
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
        'responses' => ['question1' => 'answer1'],
        'submitted_at' => now()->toIso8601String(),
    ];
    // Act: Make a POST request to the store endpoint
    $response = $this->postJson(
        '/api/form-submissions', $data
    );

    //Assert: Check for a 201 ok status and what we received 2 records
    $response->assertStatus(201)->assertJsonFragment(['form_id'=> $data['form_id']]);
    $this->assertDatabaseHas('form_submissions', ['form_id' => $data['form_id'] ]);
}
    /**
     * Test it returns validation errors when creating a submission
     * with invalid data(Here i have removed the form id).form id is required
     * so need to test is it return proper validation errors without
     * a required field
     * @return void
     */
    public function test_it_returns_validation_errors_for_store_with_invalid_data(){
        // Arrange: Prepare invalid data (missing formId)
        $data =[
            'submitter_id'=> Str::uuid()->toString(),
            'responses' => ['questions1' => 'answer1'],
        ];
        // Act: Make a POST request
        $response = $this->postJson('/api/form-submissions', $data);

        /// Assert: Check for a 422 Unprocessable Entity status and a validation error for 'form_id'
        $response->assertStatus(422)->assertJsonValidationErrors(['form_id']);
    }

    /**
     * Test it can show a specific form submission
     * Here specific means at first we will create a factory(dummy) data
     * after that will will take the data's id and will check is there same
     * id data exist or not
     * @return void
     *
    */

    public function test_it_can_show_a_specific_form_submission(){
        /// Arrange: Create a form submission
        $formSubmission = FormSubmission::factory()->create();
        // Act: Make a Get request to the show endpoint
        $response = $this->getJson(
            'api/form-submissions/' . $formSubmission->id
        );

        // Assert: Check for a 200 OK status and that the response
        // contains the correct data
        $response->assertStatus(200)->assertJsonFragment([
            'id' => $formSubmission->id,
            'form_id' => $formSubmission->form_id,
        ]);
    }
    /**
     * Test it can update a form submission
     * @return void
     */

    public function test_it_can_update_a_form_submission(){
        //Arrange: Create a form submission and prepare the update data
        $formSubmission = FormSubmission::factory()->create();
        $updateData = [
            'form_id' => $formSubmission->form_id,
            'submitter_id' => $formSubmission->submitter_id,
            'responses' => ['question1' => 'new_answer'],
            'submitted_at' => now()->toIso8601String(),
        ];
        //Act: Make a PUT request to the update endpoint
        $response = $this->putJson('/api/form-submissions/' . $formSubmission->id, $updateData);
        // Assert: Check for a 200 OK status and that the database was updated
        $response->assertStatus(200);

        $this->assertDatabaseHas('form_submissions',[
            'id' => $formSubmission->id,
            'responses' => json_encode($updateData['responses'])
        ]);
    }
    /**
     * Test it can delete a form submission
     * @return void
     */

    public function test_it_can_delete_a_form_submission(){
        // Arrange: create a form submission
        $formSubmission = FormSubmission::factory()->create();
        // Act: Make a Delete request to the destroy endpoint
        $response = $this->deleteJson(
            '/api/form-submissions/' . $formSubmission->id);
        // Assert: Check for a 204 No content status and that the record
        //is gone from the database
        $response->assertStatus(204);
        $this->assertDatabaseMissing(
            'form_submissions',[
                'id' => $formSubmission->id,
            ]);

    }

}