<?php

namespace Modules\AiModule\Database\Factories;

use Modules\AiModule\Models\AiModule;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\Modules\AiModule\Models\AiModule>
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
            'name' => Str::uuid(),
            'description' => 'AI will act like a Senior Smart Contract Developer',
            'prompt' => 'You are a blockchain smart contract engineer. Write secure, gas-optimized contracts using Solidity and best practices.',
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
