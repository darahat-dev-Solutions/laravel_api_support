<?php

namespace Modules\Auth\Providers;

use Illuminate\Support\ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    public function boot()
    {
        // The new nwidart module structure handles routes differently.
        // This line is typically handled by the module's RouteServiceProvider.
        // $this->loadRoutesFrom(__DIR__.'/Routes/api.php');
    }
}