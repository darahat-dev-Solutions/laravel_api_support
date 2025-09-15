<?php
namespace App\Modules\AiModule\Database\Factories;

use App\Modules\AiModule\Models\AiModule;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Modules\AiModule\Models\AiModule>
 */
class AiModuleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = AiModule::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'module_id' => Str::uuid(),
            'name' => Str::uuid(),
            'description' => 'AI will act like a math expert', 'You are a math expert. Solve problems step by step with clear explanations.',
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}