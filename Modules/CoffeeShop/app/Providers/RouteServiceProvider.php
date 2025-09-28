<?php

namespace Modules\CoffeeShop\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    protected string $name = 'CoffeeShop';

    /**
     * Called before routes are registered.
     */
    public function boot(): void
    {
        parent::boot();
    }

    /**
     * Define the routes for the application.
     */
    public function map(): void
    {
        $this->mapApiRoutes();
        $this->mapWebRoutes();
    }

    /**
     * Define the "web" routes for the application.
     */
    protected function mapWebRoutes(): void
    {
        Route::middleware('web')->group(base_path('Modules/CoffeeShop/routes/web.php'));
    }

    /**
     * Define the "api" routes for the application.
     */
    protected function mapApiRoutes(): void
    {
        Route::middleware('api')
            ->prefix('api/' . config('api.version', 'v1'))
            ->name('api.')
            ->group(base_path('Modules/CoffeeShop/routes/api.php'));
    }
}
