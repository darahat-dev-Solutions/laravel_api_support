<?php
namespace Test\Feature;

use App\Modules\AiModule\Models\AiModule;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;
use Tests\TestCase;

class AiModuleTest extends TestCase{

    use RefreshDatabase;

    /**
     * Test it can list all ai modules.
     * @return void
     * this function actually at first created 2 factory data
     * (or you may say it seeding 2 data)
     * because at for first time db table may not have any data
     * after that it is getting all data exist. its actually testing
     * the index function of aiModule controller
     */

    public function test_it_can_list_all_ai_module(){
        /// Arrange: Create 2 ai modules
        AiModule::factory()->count(2)->create();

        // Act: Make a Get request to the index endpoint
        $response = $this->getJson('/api/ai-modules');
        ///Assert Check for a 200 ok status and that we received 2 records
        $response->assertStatus(200)->assertJsonCount(2);
    }
    /**
     *  Test it can create a new ai module
     * Now we will test is ai module is
     * perfect or not.
     * @return void
     */
public function test_it_can_create_a_new_ai_module(){
    /// Arrange: Prepare the data for the new submission
    $data= [
        // 'id' => 1,
        'description' =>'AI will act like a Senior Smart Contract Developer',
        'name' => 'GeneralAIAssistant',
        'prompt' => 'You are a blockchain smart contract engineer. Write secure, gas-optimized contracts using Solidity and best practices.',
        // 'created_at' => now(),
        // 'updated_at' => now(),
    ];
    // Act: Make a POST request to the store endpoint
    $response = $this->postJson(
        '/api/ai-modules', $data
    );

    //Assert: Check for a 201 ok status and what we received 2 records
    $response->assertStatus(201)->assertJsonFragment(['name'=> $data['name']]);
    $this->assertDatabaseHas('ai_modules', ['name' => $data['name'] ]);
}
    /**
     * Test it returns validation errors when creating a submission
     * with invalid data(Here i have removed the ai module name).ai module name is required
     * so need to test is it return proper validation errors without
     * a required field
     * @return void
     */
    public function test_it_returns_validation_errors_for_store_with_invalid_data(){
        // Arrange: Prepare invalid data (missing name)
        $data =[
            // 'id'=> 15,
            'prompt' => 'You are a blockchain smart contract engineer. Write secure, gas-optimized contracts using Solidity and best practices.',
            // 'name' => 'TestEngineer',
            'description' => 'I am test engineer'
        ];
        // Act: Make a POST request
        $response = $this->postJson('/api/ai-modules', $data);

        /// Assert: Check for a 422 Unprocessable Entity status and a validation error for 'id'
        $response->assertStatus(422)->assertJsonValidationErrors(['name']);
    }

    /**
     * Test it can show a specific ai module
     * Here specific means at first we will create a factory(dummy) data
     * after that will will take the data's id and will check is there same
     * id data exist or not
     * @return void
     *
    */

    public function test_it_can_show_a_specific_ai_module(){
        /// Arrange: Create a ai module
        $aiModule = AiModule::factory()->create();
        // Act: Make a Get request to the show endpoint
        $response = $this->getJson(
            'api/ai-modules/' . $aiModule->id
        );

        // Assert: Check for a 200 OK status and that the response
        // contains the correct data
        $response->assertStatus(200)->assertJsonFragment([
            'id' => $aiModule->id,
            'name' => $aiModule->name,
        ]);
    }
    /**
     * Test it can update a ai module
     * @return void
     */

    public function test_it_can_update_a_whole_ai_module(){
        //Arrange: Create a ai module and prepare the update data
        $aiModule = AiModule::factory()->create();
        $updateData = [
            'description' => $aiModule->description,
            'prompt' => $aiModule->prompt,
            'name' => $aiModule->name,
            'updated_at' => now(),
            'created_at' => now(),
        ];
        //Act: Make a PUT request to the update endpoint
        $response = $this->putJson('/api/ai-modules/' . $aiModule->id, $updateData);
        // Assert: Check for a 200 OK status and that the database was updated
        $response->assertStatus(200);

        $this->assertDatabaseHas('ai_modules',[
            'id' => $aiModule->id,
            'name' => $updateData['name']
        ]);
    }

  public function test_it_can_update_a_ai_module_single_field(){
        //Arrange: Create a ai module and prepare the update data
 $aiModule = AiModule::factory()->create([
          'name' => 'Original Name',
          'prompt' => 'Original Prompt',
      ]);
              $updateData = [

            'name' => 'Updated Name'

        ];
        //Act: Make a PATCH request to the update endpoint
        $response = $this->patchJson('/api/ai-modules/' . $aiModule->id, $updateData);
        // Assert: Check for a 200 OK status and that the database was updated
        $response->assertStatus(200);

        $this->assertDatabaseHas('ai_modules',[
            'id' => $aiModule->id,
            'name' => 'Updated Name',
        ]);
        // Assert that the prompt was not changed
        $this->assertDatabaseHas('ai_modules',[
            'id' => $aiModule->id,
            'prompt' => 'Original Prompt',
        ]);
    }


    /**
     * Test it can delete a ai module
     * @return void
     */

    public function test_it_can_delete_a_ai_module(){
        // Arrange: create a ai module
        $aiModule = AiModule::factory()->create();
        // Act: Make a Delete request to the destroy endpoint
        $response = $this->deleteJson(
            '/api/ai-modules/' . $aiModule->id);
        // Assert: Check for a 204 No content status and that the record
        //is gone from the database
        $response->assertStatus(204);
        $this->assertDatabaseMissing(
            'ai_modules',[
                'id' => $aiModule->id,
            ]);

    }

}
