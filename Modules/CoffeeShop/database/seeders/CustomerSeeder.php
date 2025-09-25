<?php

namespace Modules\CoffeeShop\Database\Seeders;

use Modules\CoffeeShop\Models\Customer;
use Illuminate\Database\Seeder;

class CustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Customer::factory(20)->create();
    }
}
