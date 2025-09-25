<?php

namespace Modules\AiModule\Database\Seeders;

use Modules\AiModule\Models\AiModule;
use Illuminate\Database\Seeder;

class AiModuleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        AiModule::factory(10)->create();
    }
}
