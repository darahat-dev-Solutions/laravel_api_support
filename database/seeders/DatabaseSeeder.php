<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create test user only if it doesn't exist
        $testUser = User::where('email', 'test@example.com')->first();
        if (!$testUser) {
            User::factory()->create([
                'name' => 'Test User',
                'email' => 'test@example.com',
            ]);
        }

        $this->call([
            \Modules\FormSubmission\Database\Seeders\FormSubmissionSeeder::class,
            \Modules\AiModule\Database\Seeders\AiModuleSeeder::class,
            \Modules\CoffeeShop\Database\Seeders\CoffeeShopSeeder::class,
        ]);
    }
}
