<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ApiVersioningSmokeTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function ai_modules_index_responds()
    {
        $this->getJson('/api/v1/ai-modules')
            ->assertStatus(200);
    }

    /** @test */
    public function form_submissions_index_responds()
    {
        $this->getJson('/api/v1/form-submissions')
            ->assertStatus(200);
    }

    /** @test */
    public function menu_items_index_responds()
    {
        $this->getJson('/api/v1/menu-items')
            ->assertStatus(200);
    }
}
